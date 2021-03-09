## Permission Overrides

In Shopify Admin, there are some subtle overlaps in permissions that are necessary for common tasks. For example, users with Orders permission are intentionally permitted to query some fields on Customers in order to process orders. This is the current list of these permission overlaps. Note that this list may change over time, but we will do our best to keep this reference up to date.

**Last Update:** 2021-03-09

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
Orders | id, displayName, fullName, image, note, ordersCount, email, totalSpentV2, phone

#### CustomerEmailTemplateSubjects
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | contactBuyer

#### DeliveryProfile
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, name

#### DeliveryShippingInsuranceCoverage
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, coverageCost, coverageAmount

#### DraftOrder
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, name, createdAt, totalPrice, customer, lineItems
Customers | id, name, createdAt, totalPrice, customer, lineItems
Orders | id, name, createdAt, totalPrice, customer, lineItems

#### DraftOrderLineItem
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, product, variant
Customers | id, title, product, variant
Orders | id, title, product, variant

#### ExternalVideo
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage, preview
Settings | id, alt, previewImage, preview
Draft Orders | id, alt, previewImage, preview

#### InventoryItem
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | tracked
Customers | tracked
Orders | id, harmonizedSystemCode, countryCodeOfOrigin, provinceCodeOfOrigin, stockableLocations, tracked

#### LineItem
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, product, variant
Customers | id, title, variantTitle, image, product, variant

#### MarketingEvent
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | app, channel, id, startedAt, type

#### MediaImage
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage, preview
Settings | id, alt, previewImage, preview
Draft Orders | id, alt, previewImage, preview

#### MediaPreviewImage
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | image
Draft Orders | image

#### Model3d
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage, preview
Settings | id, alt, previewImage, preview
Draft Orders | id, alt, previewImage, preview

#### Order
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, name, createdAt, totalPriceSet, customer, displayFinancialStatus, displayFulfillmentStatus, lineItems
Customers | id, name, createdAt, totalPriceSet, publication, displayFulfillmentStatus, lineItems, attributionName, subtotalLineItemsQuantity, customer, displayFinancialStatus
Products | id, name

#### PaymentProvider
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, multipleCapture

#### Product
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, status, images, hasOnlyDefaultVariant, tracksInventory, variants, totalVariants, featuredMedia, featuredImage, totalInventory
Customers | id, title, featuredImage, tracksInventory, totalInventory, variants
Settings | id, title, hasOnlyDefaultVariant, featuredImage, totalVariants, tracksInventory, inCollection, featuredMedia, images, variants
Draft Orders | id, title, status, images, hasOnlyDefaultVariant, tracksInventory, variants, totalVariants, featuredMedia, featuredImage
Orders | id, title, featuredImage, tracksInventory, totalInventory, variants

#### ProductVariant
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, product, title, displayName, price, image, inventoryQuantity, inventoryManagement, selectedOptions, inventoryItem
Customers | id, product, title, image, inventoryQuantity, inventoryItem
Settings | id, title, deliveryProfile, inventoryQuantity, inventoryManagement, price, displayName, selectedOptions
Draft Orders | id, product, title, displayName, price, image, inventoryQuantity, inventoryManagement, selectedOptions
Orders | id, inventoryItem, product, title, image, inventoryQuantity

#### PurchaseOrder
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, acceptedQuantity, destination, name, placedAt, referenceNumber, rejectedQuantity, shipNotices, status, supplier, totalQuantity

#### PurchaseOrderShipNotice
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, arrivesAt

#### Refund
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Products | id, order

#### Supplier
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, companyName

#### Video
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, alt, previewImage, preview
Settings | id, alt, previewImage, preview
Draft Orders | id, alt, previewImage, preview
