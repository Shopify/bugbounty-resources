## CVSS Scoring Guide  ✍️

This guide covers some common questions with respect to CVSS scoring on the Shopify program. We score according to the [CVSS Specification Document](https://www.first.org/cvss/v3.0/specification-document), but also find it helpful to detail some Shopify-specific scenarios.

#### Core vs. Non-Core Environment
Which assets are Core and Non-Core are detailed on the program page. In some cases, multiple assets are involved (for instance, when a bug is triggered by interacting with a Non-Core service, but the service uses APIs provided by a Core service). In these cases, the environment is set based on where the issue itself will be addressed. 

##### Example:
An issue relating to Point of Sale (POS) may be scored in the Core environment if the issue is fixed in a Core service (for instance, in the code that responds to a query or mutation that POS makes to Shopify Core). It may also be Non-Core, if the issue is limited to (and fixed within) either the POS mobile client or POS Channel app.  

#### Attack Complexity
Attack Complexity encompasses all preconditions that must be met for an attack to be successful. For example, Attack Complexity may be set to High if there is a specific store configuration setting necessary for a privilege escalation bug or permissions issue to occur. Attack Complexity also covers specific knowledge necessary to exploit the issue, which would be difficult to determine without prior access to the store. 

Attack Complexity may also be set to High in cases where an attack could be scaled to most or all users of a service (resulting in a High Confidentiality or Integrity impact), but doing so would require substantial effort. In such cases, we also consider a more targeted version of the attack (with Low Attack Complexity, and Low Confidentiality or Integrity impact) and choose whichever has a higher CVSS score.

##### Examples where Attack Complexity would be High:
* Permissions issues requiring Custom App development be enabled and used on the victim's store.
* Issues requiring previous access to the store, preview tokens, access to an authenticated session, etc.

#### Privileges Required
This metric describes the privilege level of the attacker, at the time of the exploit. Note that if previous access was required, that is typically covered in Attack Complexity (as a precondition).

Certain permissions in Shopify Admin are considered High privileges, as they are granted to staff in a high position of trust. Subscription plans are not generally considered privileges, except in the rare case where the accounts are not self-registered or have a vetting process.

If the attack requires compromising an app or an app being malicious, we score that as Privileges Required: Low (unless there is a unique case for the given app). However, we assume it would be difficult for an app to scale installs to "Most or All" stores, so this scenario is likely to have High Attack Complexity.  

##### Example:
* Settings permission and Add/Remove Staff Members permission are considered High privilege permissions

#### Scope Changes
Scope changes are rare. We score as Scope as Changed when a vulnerability in one software component impacts resources beyond its means, or privileges. 

##### Examples:
Compromising a Shopify ID account does not lead to a scope change, even though you may access shops or partners accounts this way. This is the intended authorization scope of a Shopify ID account. However, if a bug in Shopify Admin allowed a Shopify ID account takeover, this would likely be considered a scope change.  

#### Confidentiality Impact
The Confidentiality metric describes the ability to read sensitive information without proper authorization, the most common scenario being permissions issues in our APIs. To reach a score of High, there must be a total loss of confidentiality for all data belonging to the service (as per the CVSS specification).

Note that for permission issues in Shopify Admin, there are subtle overlaps in permissions necessary for certain tasks. We do our best to detail these overlaps, by publishing the [permission overrides in GraphQL]().

#### Integrity Impact
The Integrity metric describes the ability to make changes without proper authorization, the most common scenario also being permissions issues in our APIs. To reach a score of High, there must be a total loss of integrity for all data belonging to that service (as per the CVSS specification).

#### Availability Impact
We evaluate denial-of-service issues on a case-by-case basis. Our typical threshold for an Availability impact is the ability to cause substantial disruption to a network service with a single request. As a result, we close reports that do not meet this standard as Informative.

