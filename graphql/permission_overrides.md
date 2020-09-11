## Permission Overrides

In Shopify Admin, there are some subtle overlaps in permissions that are necessary for common tasks. For example, users with Orders permission are intentionally permitted to query some fields on Customers in order to process orders. This is the current list of these permission overlaps. Note that this list may change over time, but we will do our best to keep this reference up to date.

**Last Update:** 2020-09-09

#### CheckoutSettings
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | emailOrPhoneFieldMode

#### Collection
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, image

#### Customer
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, displayName, email, ordersCount, totalSpentV2, phone, note
Draft Orders | id, firstName, lastName, displayName, email, image, note, phone, taxExempt, ordersCount, defaultAddress, addressesV2
Orders | id, displayName, fullName, image, note, ordersCount

#### DeliveryShippingInsuranceCoverage
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, coverageCost, coverageAmount

#### DraftOrder
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, name, createdAt, totalPrice, customer, lineItems
Customers | id, name, createdAt, totalPrice, customer, lineItems

#### DraftOrderLineItem
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, product, variant
Customers | id, title, product, variant

#### ExternalVideo
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage
Settings | id, alt, previewImage

#### InventoryItem
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | tracked
Customers | tracked
Orders | id, harmonizedSystemCode, countryCodeOfOrigin, provinceCodeOfOrigin

#### LineItem
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, product, variant
Customers | id, title, variantTitle, image, product, variant

#### MediaImage
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage
Settings | id, alt, previewImage

#### Model3d
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage
Settings | id, alt, previewImage

#### Order
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, name, createdAt, totalPriceSet, customer, displayFinancialStatus, displayFulfillmentStatus, lineItems
Customers | id, name, createdAt, totalPriceSet, publication, displayFulfillmentStatus, lineItems, attributionName, subtotalLineItemsQuantity, customer, displayFinancialStatus

#### PaymentProvider
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, multipleCapture

#### Product
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, images, hasOnlyDefaultVariant, tracksInventory, variants, totalVariants, featuredMedia, featuredImage, totalInventory
Customers | id, title, featuredImage, tracksInventory, totalInventory, variants
Settings | id, title, hasOnlyDefaultVariant, featuredImage, totalVariants, tracksInventory, inCollection, featuredMedia, images, variants
Draft Orders | id, title, images, hasOnlyDefaultVariant, tracksInventory, variants, totalVariants, featuredMedia, featuredImage
Orders | id

#### ProductVariant
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, product, title, displayName, price, image, inventoryQuantity, inventoryManagement, selectedOptions, inventoryItem
Customers | id, product, title, image, inventoryQuantity, inventoryItem
Settings | id, title, deliveryProfile, inventoryQuantity, inventoryManagement, price, displayName, selectedOptions
Draft Orders | id, product, title, displayName, price, image, inventoryQuantity, inventoryManagement, selectedOptions
Orders | id, inventoryItem

#### Video
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage
Settings | id, alt, previewImage
