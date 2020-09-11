## A Hacker’s Guide to the ~~Galaxy~~ Shopify GraphQL API 🚀

### Purpose of this guide:
Shopify has been porting much of the functionality from our [REST API](https://shopify.dev/docs/admin-api/rest/reference), over to our newer and more flexible [GraphQL API](https://shopify.dev/docs/admin-api/graphql/reference). The GraphQL API is a great area to focus on for bug bounty research, as there is new code added very frequently which is very easy to identify. Hackers have definitely noticed this, and we receive a good volume of reports focused on GraphQL. However, we have noticed that many hackers are limiting themselves to replaying the queries and mutations that are used commonly in Shopify Admin. This guide attempts to make it easier to get started testing our full API, and to help you use the schema to track down bugs in lesser-known areas.

### Getting Started:
Our developer-facing documentation (linked above) is a good place to get your feet wet. We also provide an Embedded App version of GraphiQL, that you can install on your test shop and use to easily run queries: https://shopify-graphiql-app.shopifycloud.com/. There are many other great resources out there for learning about GraphQL, including an excellent guide on using the [Insomnia client with our APIs](https://www.shopify.ca/partners/blog/shopify-graphql-learning-kit).

### Accessing Full Schemas:
There is always new functionality being developed that may not have made it to the public-facing documentation yet, and may not even be available to all apps. Since it's a type system, GraphQL provides a complete description of all available fields. You can view the full admin schema a particular app has access to via our introspection endpoint:
`https://<your_shop>.myshopify.com/services/graphql/introspection/admin?api_client_api_key=<api_key>&api_version=<version>`

All apps in Shopify are identified by an API key value. For example, when you create a private app for your shop under `/admin/apps/private`, you are provided an API key to identify it. Providing this value in the `api_client_api_key` parameter here ensures that the introspection output is the schema that is available to this particular app. The `api_version` parameter is the handle for [the version of the API](https://shopify.dev/concepts/about-apis/versioning) you'd like to look at. You can provide a release version (ex. `2020-07`), or simply enter `unstable`.

### Enumerating Types and Mutations:
That big blob of JSON can be a bit difficult to read. You can parse this any way you'd like, but here are some quick tips for pulling out the defined Types and Mutations (using the [GraphQL Ruby](https://graphql-ruby.org/) gem):

**Loading the schema using GraphQL Ruby:**

Download the json file from the previously mentioned introspection endpoint. Ex. `curl "https://<your_shop>.myshopify.com/services/graphql/introspection/admin?api_client_api_key=<api_key>&api_version=<version>" -o admin.json`

```ruby
require 'json'
require 'graphql'

schema_json = JSON.load File.new("admin.json")
schema = GraphQL::Schema::Loader.load(schema_json)
```
**Listing All Defined Types:**
```ruby
schema.types.keys
```

**Listing Fields on a Given Type:**
```ruby
schema.types["DraftOrder"].own_fields.keys
# > ["activeCheckout", "appliedDiscount", "billingAddress", "completedAt", "createdAt", ...
```

**Listing Defined Mutations:**
```ruby
schema.mutation.own_fields.keys
# > ["abandonedCheckoutArchive", "abandonedCheckoutNoteUpdate", "abandonedCheckoutRecoveryEmailSend" ...
```

**Listing Arguments a Given Mutation Accepts and their Descriptions:**
```ruby
schema.mutation.own_fields["draftOrderCreate"].arguments.keys
# > ["input"]
schema.mutation.own_fields["draftOrderCreate"].arguments["input"].type.to_graphql
# > DraftOrderInput!
schema.types["DraftOrderInput"].own_arguments.keys
# > ["appliedDiscount", "billingAddress", "customerId", ...
schema_new.types["DraftOrderInput"].own_arguments["customerId"].description
# > "Customer associated with the draft order."
```

### Automated Change Detection:
You can also use the previously mentioned introspection endpoint to keep an eye on changes to the API, and spot new functionality before it is actively used. We have provided a [sample script](simple_diff.rb) that takes two schemas as input and will output detected changes that may be interesting. This requires [GraphQL Ruby](https://graphql-ruby.org/) and [GraphQL SchemaComparator](https://www.rubydoc.info/gems/graphql-schema_comparator/0.1.0). This is a simple version that just prints out added types, fields and arguments (SchemaComparator is capable of a lot more if you want to dig in further). You could even set this up to post to your Slack group, but we'll leave that as an open exercise!

### Testing from the Shopify Admin User Perspective:
When testing as a staff member in Shopify Admin, you will see requests to the GraphQL API endpoint at `/admin/internal/web/graphql/core`. There is a lot more functionality available through Shopify Admin than from the perspective of other apps. You can view the schema associated with this endpoint here:
https://app.shopify.com/services/graphql/introspection/admin?api_client_api_key=8d5b407fd77980d3dcdfe9375bb4a58a&api_version=unstable

From here, the sky is the limit for testing! You can use some of the tricks above to help you identify Types and Mutations to dig into. Some examples are available for how to craft your requests [here](testing_with_burp.md).

### Testing from the App Perspective:
Testing from the app perspective is a bit more straightforward. You can create a private app for your shop on `/admin/apps/private`. From there you can take your API secret to make the following kind of requests:

```http
POST /admin/api/2020-07/graphql HTTP/1.1
Accept: application/json
X-Shopify-Access-Token: <access_token>
Content-Type: application/graphql; charset=utf-8
Accept-Language: es
Host: hackerone-graphql-testing.myshopify.com
Connection: close
Accept-Encoding: gzip, deflate
Content-Length: 112

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

In order to gather more info about the schema in this case, you can use the same introspection endpoint with your app's API key, or just perform regular [introspection](https://graphql.org/learn/introspection/) queries.
Ex.

```graphql
{
  __schema {
    types {
      name
    }
  }
}
```

*Note on Shopify-developed Apps:*
There are some Shopify apps that interact directly with or proxy requests straight through to the Shopify core GraphQL API. For these, the testing methodology is very similar to the Admin user perspective as described above. If you see queries on another endpoint that appear to be interacting with the Shopify core GraphQL API, you can get more information by requesting the schema from the introspection endpoint with the API key for that app. This value is typically visible in the parameters during the app's OAuth flow.

You can see an example of this when accessing the Online Store channel within your shop. When you first visit the Online Store section of your Admin, you should see an OAuth flow. On the `/admin/oauth/authorize` request, you can see the `client_id` parameter of `650f1a14fa979ec5c74d063e968411d4`. This is the API key value that identifies this app, and you can use this to view the schema as Online Store sees it, at:
`https://<your-store>.myshopify.com/services/graphql/introspection/admin?api_client_api_key=650f1a14fa979ec5c74d063e968411d4&api_version=unstable`

### Previous Reports:
Looking for inspiration? Here are some great reports we've received previously:
* https://hackerone.com/reports/419883
* https://hackerone.com/reports/873366
* https://hackerone.com/reports/397130
* https://hackerone.com/reports/927567

### Questions?
If you have questions about this guide, feel free to reach out to us at `bugbounty@shopify.com`! We don't prevalidate reports through this email, but we are happy to clarify anything that may be confusing in this guide.
