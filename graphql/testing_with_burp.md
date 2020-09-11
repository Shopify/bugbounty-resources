## Examples for Testing in the Shopify Admin:
For simplicity, this section of the guide assumes you're using Burp with the [GraphQL Raider](https://portswigger.net/bappstore/4841f0d78a554ca381c65b26d48207e6) extension (but it's definitely not necessary to use this specific setup).

#### Identify a target Type or Mutation and gather info:
For this example, let's look at querying and updating Products.

##### Fields on Product:
```ruby
schema_old.types["Product"].own_fields.keys
#> ["aggregatedSellingPlanGroupCount", "aggregatedSellingPlanGroups", "availablePublicationCount", "bodyHtml", ...
```
##### Arguments on ProductUpdate Mutation:
```ruby
schema.mutation.fields["productUpdate"].own_arguments.keys
# > ["input"]
schema.mutation.fields["productUpdate"].own_arguments["input"].type.to_graphql
# > ProductInput!
schema.types["ProductInput"].own_arguments.keys
# > ["descriptionHtml", "handle", "redirectNewHandle", "seo", ...
```

#### Crafting a Query:
Login to Shopify Admin and capture a request to the GraphQL endpoint (this will be a POST to `/admin/internal/web/graphql/core`), and send to Repeater to be replayed. Remove any parameters other than query from the raw request.

From here you can modify the query in the GraphQL tab provided by GraphQL Raider. Let's say we'd like to query the Products available on our shop:

```graphql
{
  products(first: 10) {
    edges {
      node {
        id
        description
      }
    }
  }
}
```

Your resulting raw request should look something like:
```http
POST /admin/internal/web/graphql/core HTTP/1.1
Host: hackerone-graphql-testing.myshopify.com
Accept: application/json
Accept-Language: en-CA,en-US;q=0.7,en;q=0.3
Accept-Encoding: gzip, deflate
content-type: application/json
X-CSRF-Token: <csrf token>
Origin: https://hackerone-graphql-testing.myshopify.com
Content-Length: 140
Connection: close
Cookie: <cookies>

{"query":"{\r\n  products(first: 10) {\r\n    edges {\r\n      node {\r\n        id\r\n        description\r\n      }\r\n    }\r\n  }\r\n}"}
```

Now we've successfully crafted a custom query to look at product descriptions! You can modify this query to add any of the other fields from the list above.

#### Crafting a Mutation:
Let's update the product description and add the product to a specific channel. The `productUpdate` mutation takes an `input` argument of the type `ProductInput`. We looked at the arguments for this above, and found `descriptionHtml`. The following query updates the description for the product with id 5590578167830, and returns the description as a result.

```graphql
mutation ProductUpdate {
  productUpdate(input: { id: "gid:\/\/shopify\/Product\/5590578167830", descriptionHtml: "Shiny new description"}) {
		product {
			description
		}
	}
}
```

Now for adding the product to a collection. In the arguments accepted on `ProductInput` above, we want `collectionsToJoin`. To find out what type of input this is expecting:
```ruby
schema.types["ProductInput"].arguments["collectionsToJoin"].type.to_graphql
# > [ID!]
```
Looks like `collectionsToJoin` takes a list of ids. So to add our product to the collection with id 212125548566:

```graphql
mutation ProductUpdate {
  productUpdate(input: { id: "gid:\/\/shopify\/Product\/5590578167830", collectionsToJoin: ["gid:\/\/shopify\/Collection\/212125548566"]}) {
		product {
			collections(first: 10) {
				edges {
					node {
						id
					}
				}
			}
		}
	}
}
```

#### Get creative!
These are basic examples, but there's a ton to look at across the whole API. Look for missing permission checks, IDORs, or other strange and exploitable behaviour.

*NOTE ON TESTING PERMISSION ISSUES:* In Shopify Admin, there are some subtle overlaps in permissions that are necessary for common tasks. A recent list of these is available on our [permissions overrides page](permission_overrides.md).

### Submit your awesome bugs to us on [HackerOne](https://hackerone.com/shopify)!

*REMINDER*: When submitting reports, the more information we have to go on the quicker our response will be. So make sure to include your full query, important requests and responses, and why you feel this is a security issue.
