## What is the Scripts Platform

```
Note: The Scripts Platform is currently in a closed beta. 
```

With the help of [Checkout app extensions](https://shopify.dev/apps/checkout), Shopify is giving third party app developers the ability to extend their application code into checkout. Via custom [Scripts](https://shopify.dev/apps/checkout#scripts), third party developers now have the ability to customize many aspects of the checkout experience.

[Scripts](https://shopify.dev/apps/checkout#scripts) let you add custom server-side logic to checkout, and securely change the behavior of payment methods, shipping rates, and checkout line items.

The Scripts Platform includes a GraphQL API to publish and manage Scripts, an integration with the [Shopify CLI](https://github.com/Shopify/shopify-cli), in addition to a runtime environment powered by [WASMTIME](https://github.com/bytecodealliance/wasmtime).

Developers are given the tools to write, build and publish scripts to their third party app for use on Shopify checkouts. Execution of scripts takes place via compiled web assembly modules.

## Scope
Please note that for the time being, bugs that have their root cause traced back to [WASMTIME](https://github.com/bytecodealliance/wasmtime), [tokio](https://github.com/tokio-rs/tokio), or any other third-party library will not be eligible for bounty.

## Known issues
- DoS attacks undertaken by compiled web assembly modules that leverage heavily time-consuming code or an infinite loop.
- DoS attacks related to the continued publishing of scripts or to the continued issuance of requests for execution. (Exhausting the available thread pool)

## How to get started with the Scripts platform
In order to enroll, you'll need to complete the following steps:
- Register for a [Partners Account](https://www.shopify.ca/partners) with your `@wearehackerone.com` email address.


- Create a [Development store](https://shopify.dev/apps/tools/development-stores) in your Partners organization.

- Email us at `bugbounty@shopify.com` with the subject `Scripts Platform Beta` and include the following information in the body:
  - Email address used for the Partners Account.
  - The name of your Partners organization.
  - The name of the Development shop you want to use for testing.

Once enrolled, you will need to setup a [custom app](https://help.shopify.com/en/manual/apps/app-types#custom-apps) and install it on your development shop. This is required as your scripts are associated with a custom app.

Please consult the following documentation to learn how to create and install a [custom app](https://help.shopify.com/en/manual/apps/app-types#custom-apps):
- [How to install shopify-cli, create a custom app and install it on your store](https://shopify.dev/apps/tools/cli/getting-started)
  
Now that your custom app is created and installed on your development shop, you're ready to write your first script:
- [How to write and publish your first script using the Payments API](https://shopify.dev/apps/checkout/scripts/payment-changes/building-a-payment-script)

Once you have completed those steps, consult the following resources to learn more about the Extension Point APIs currently available to your scripts:
- [Shipping Methods Scripts API](https://shopify.github.io/extension-points/types/shipping-methods)

- [Payment methods Scripts API](https://shopify.github.io/extension-points/types/payment-methods)


Happy hacking!

