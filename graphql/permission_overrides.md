## Permission Overrides

In Shopify Admin, there are some subtle overlaps in permissions that are necessary for common tasks. For example, users with Orders permission are intentionally permitted to query some fields on Customers in order to process orders. This is the current list of these permission overlaps. Each header is the target query type and the entries in the table are the permissions that can access certain fields on that query type. Note that this list may change over time, but we will do our best to keep this reference up to date.

**Last Update:** 2022-04-06

#### Company
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Products | id, name
Draft Orders | id, name, orderCount, locationCount, note
Orders | id, name, orderCount, locationCount, note

#### CompanyAddress
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id, address1, address2, city, province, country, zip, firstName, lastName, phone, geoCoordinates, zoneCode, countryCode, formattedAddress
Orders | id, address1, address2, city, province, country, zip, firstName, lastName, phone, geoCoordinates, zoneCode, countryCode, formattedAddress
Products | id, formattedAddress

#### CompanyContact
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id, customer, roleAssignments
Orders | id, customer, roleAssignments

#### CompanyContactRoleAssignment
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id, companyLocation, company
Orders | id, companyLocation, company

#### CompanyLocation
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Products | id, name, company, hasPriceList, priceListCount, priceLists, shippingAddress
Draft Orders | id, name, billingAddress, shippingAddress, note
Orders | id, name, billingAddress, shippingAddress, note

#### GeoCoordinates
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | latitude, longitude
Orders | latitude, longitude

#### CheckoutSettings
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | emailOrPhoneFieldMode, abandonedCheckoutEmails
Draft Orders | emailOrPhoneFieldMode

#### Collection
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, title, image, handle
Draft Orders | id, title, productsCount

#### CustomPaymentMethod
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id, name

#### Customer
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | id, displayName, email, ordersCount, totalSpentV2, phone, note
Draft Orders | id, firstName, lastName, displayName, email, image, note, phone, taxExempt, ordersCount, defaultAddress, addressesV2, fullName, companyContactProfiles, totalSpentV2
Orders | id, displayName, fullName, firstName, lastName, email, image, note, ordersCount, taxExempt, acceptsMarketing, state, totalSpentV2, phone

#### CustomerEmailTemplateSubjects
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | contactBuyer

#### CustomerTag
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | title

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

#### Market
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id, primary, name, regions, enabled

#### MarketRegionCountry
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id, name, currencyCode, code

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
Draft Orders | id

#### PaymentProvider
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Orders | id, multipleCapture
Draft Orders | id, name, configuration
Settings | id, configuration

#### PaymentProviderConfiguration
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | id
Settings | id, enabled

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
Discounts | id, product, title, displayName, price, image, inventoryQuantity, inventoryManagement, selectedOptions, sku, barcode, inventoryItem
Customers | id, product, title, image, inventoryQuantity, inventoryItem
Settings | id, title, deliveryProfile, inventoryQuantity, inventoryManagement, price, displayName, selectedOptions
Draft Orders | id, product, title, displayName, price, image, inventoryQuantity, inventoryManagement, selectedOptions, sku, barcode, contextualPricing
Orders | id, inventoryItem, product, title, image, inventoryQuantity, contextualPricing

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

#### AuditTrailAdjustment
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | label, type, value
Orders | label, type, value

#### MediaPreviewImage
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Discounts | image
Draft Orders | image

#### PriceList
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Customers | id, name, currency, status, parent, fixedPricesCount, contextRule
Draft Orders | name
Orders | name

#### PriceListAdjustment
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Customers | type, value

#### PriceListContextRule
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Customers | companyLocationsTotalCount

#### PriceListParent
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Customers | adjustment

#### PriceListStep
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | priceList, priceAdjustments
Orders | priceList, priceAdjustments

#### PricingAuditTrail
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | priceAdjustments, stepsByKey
Orders | priceAdjustments, stepsByKey

#### PricingAuditTrailStepByKey
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | priceListStep
Orders | priceListStep

#### ProductVariantContextualPricing
| Permission Overrides | Accessible Fields |
| :--- | :--- |
Draft Orders | auditTrail, price
Orders | auditTrail, price