> © Icelandic Standards (IST) 2021. All Rights Reserved.
>
> Without the written permission of the publisher, this workshop
> agreement may not be reprinted or reproduced in any form by any means,
> mechanical or electronic, such as by photocopying, sound recording or
> other means, currently known or later invented, nor may the agreement
> be disseminated through an electronic database.
>
> 1\. edition

# TODO

- [ ] Review list of final WA participants

# Foreword

This IST workshop agreement was developed in accordance with "ÍST Reglur
um tækniforskriftir, tækniskýrslur og vinnu­stofu­samþykktir" (*e.* IST
rules on Technical Specifications, Technical Reports and Workshop
Agreements). It was agreed on 2021-X-X in a workshop by
representatives of interested parties, approved and supported by IST
following a public call for participation within TN-FMÞ, the FUT
technical committee on financial services. It does not necessarily
reflect the views of all stakeholders that might have an interest in its
subject matter.

The Workshop Agreement (ÍST WA) was funded by Íslandsbanki, Arion banki
and Landsbankinn. This ÍST WA is based on the results of the work of two
workgroups TN-FMÞ-VH-1 Technical requirements and TN-FMÞ-VH-2 Business
requirements.

The final text of ÍST WA-316 was submitted to IST for publication on
2021-X-X. It was developed as part of the agreement made by TN-FMÞ 
under the working group TN-FMÞ-VH7, and approved by:

-   Arion banki (Atli Már Gunnarsson, Védís Ingólfsdóttir, Björn Ingi
    Björnsson. Kristinn Stefánsson, Eiríkur Haraldsson, Eiríkur Egilsson,
    Steinar Þorbjörnsson)

-   Íslandsbanki (Halldór Vagn Hreinsson, Ingvi Rafn Guðmundsson, 
    Snorri Jónsson, Jóhannes Þór Ágústarson, Snorri Karlsson,  
    Stefán Orri Stefánsson, Frans Veigar Garðarson)

-   Landsbankinn (Hermann Þór Snorrason, Jökull
    Huxley Yngvason, Ólafur Eiríksson, Halldóra G. Steindórsdóttir,
    Guðni Þ. Björgvinsson, Guðmundur Ólafsson, Gísli Konráð Björnsson)

-   Alskil (Sigurður Gauti Hauksson)

-   Uniconta (Þorsteinn Lemke)

-   RB (Guðjón Karl Arnarsson, Halla Sigrún Árnadóttir)

ÍST WA-316 is not subject to any patent rights As part of the IOBWS v3.0 
Technical Specifications, the document is distributed under a 
Creative Commons Attri­bution 4.0 International Public License.

The Workshop participants have made every effort to ensure the
reliability and accuracy of the technical and non-technical content of
ÍST WA-315, but this does not guarantee, either explicitly or
implicitly, its correctness. Users of ÍST WA-316 should be aware that
neither the workshop participants, nor IST can be held liable for
damages or losses of any kind whatsoever which may arise from its
application. Users of ÍST WA-316 do so on their own responsibility and
at their own risk.
# Scope 

The technical specifications for individual aspects of the Icelandic Online Banking Web Services 3.0,
(IOBWS) do not address all implementation details, something these guidelines will try to address at least in parts.


# Normative references, definitions, and symbols 

## Definitions 

-   **IOBWS 3.0** -- This is the acronym of the third version of the
    Icelandic Open Banking Web Services project and its product.

-   **FUT** is the IT sector council at Icelandic standards.

-   **TN-FMÞ** - Technical committee on finance services, working under
    FUT.

It is the intention that the guidelines will be living documents, though issued as workshop agreements. Clarifications and changes can be suggested through issues on the Github site or with direct Pull Requests. All updates, similar to the maintenance of the technical specifications, will be funneled through Pull Requests as part of the regular work overseen by workgroup 7 (VH-7). It is expected they will then be released regularly by the working group TN-FMÞ-VH7. 

## Authentication Use Cases and Requirements

The API specifications for IOBWS reference OAuth2 based authorization, with the NextGenPSD2 ancestry of parts of the specification, occasionally showing through as references to consents. It is the intention here to further elaborate on the ways the most common use cases should be handled as the common dominator among implementors and consumers of the APIs.  

It is established here that the usage of "Búnaðarskilríki" issued under Fullgilt Auðkenni as the current gold standard for authentication will continue to be supported. They will however not require, as in the previous IOBWS specifications, the usage of username and passwords.  

Additionally, OpenID Code Flow with PKCE will be part of the common support to handle the various scenarios.

## Main Use Cases 

To harmonize technical expectations, some basic use cases are considered and the acceptance criteria should guide implementors towards selecting the correct solution.

#### Centralised Financial System
> As a **Financial System**, I want to connect to IOBWS 3.0 services so that I can e.g. manage Claims, initiate Payments, and fetch Account transactions in batches or directly on behalf of users.
Acceptance criteria:
1. Support for Búnaðarskilríki issued under Fullgilt Auðkenni, for authenticating and authorizing centralized software to act on behalf of organizational units.
2. Support for OIDC and, code flow with PKCE as the common denominator. 
3. Support for online scenarios, where the organization authenticates the interactive employee that instigates the action.

#### On-premise System
> As **a user of anw onpremise Financial System**, I want to be able to authorize the system to connect to IOBWS 3.0 services and manage Claims, initiate Payments and fetch Account transactions on my behalf in non-interactive sessions.
Acceptance criteria:
1. Support for OIDC and OAuth 2.0, code flow with offline_access, using MTLS to identify the client/server using Búnaðarskilríki issued under Fullgilt Auðkenni. 

#### On-premise employee
> As a **company employee** I want to e.g. initiate payment instructions, create claims and interact with IOBWS 3.0 so that I can manage my day-to-day activities through e.g. the company ERP system.
Acceptance criteria:
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the common denominator. 
2. Support for user authentication with Qualified Certificates.

#### Financial Services
> As e.g. **an independent Accounting firm** offering services to multiple clients, I want to be able to access their accounts and products through IOBWS 3.0, so I can manage their financials and accounting.
Acceptance criteria:
1. Support for assuming multiple identities. 
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the common denominator. 
2. Support for user authentication with Qualified Certificates.
3. The scopes should be known, based on the endpoints defined in IOBWS 3.0.

#### Financial Software as a Service
> As the IOBWS 3.0 **customer of a bank**, I want to be able to authorize SaaS software hosted in public clouds to act on my behalf, so I can allow the service to manage my financials and the products I have access to such as Claims.
Acceptance criteria:
1. This should address the scenario where companies offering e.g. Dynamics 365 or more custom apps need to act on behalf of bank customers.
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the common denominator. 
2. Support for user authentication with Qualified Certificates.

#### Software Vendor
> As a **Software Vendor** providing Custom, COTS, or SaaS applications that my clients use to accesses IOBWS 3.0, I want to be able to target common authentication behavior as part of the technical standard offered by all the banks, so that I do not have to implement and test against multiple subtly different endpoints.
Acceptance criteria:
1. There exist code samples that show how to connect using common platforms and frameworks.
2. The possible variations between banks do not affect the protocol exchanges between the client, authorization server, and API endpoint.
3. Possible variations in methods that still are offered by more than one bank are made part of the standard, as long as a common fallback exists. 

#### User of open endpoints
> As a **Consumer of open services** such as currency data, I want my system to be able to interact with the endpoints without authentication but identify my client as to 
Acceptance criteria:

#### Enterprise with the Claim Collection Agency role logs in for the first time
> As a **Claim Collection Agency**, I want my system to be able to login into the system and separate my authentication as a secondary collection agency vs. my use as a primary claims collector. 
Acceptance criteria:
1. When I log in as a secondary collection role, I identify using a client ID that is related to that role.
2. When I log in as the parent enterprise to create claims as a primary claims collector, I identify using a client ID that is related to that role

### Claim Collection Agency
> As a **Claim Collection Agency**, I want my system to be able to interact with the endpoints to manipulate claims whose status is in the secondary collection and transferred to a claim template in my ownership. 
Acceptance criteria:
1. When I log in, my token reflects the css.read and css.write scopes.
2. The token claims as per each service rule, will not allow me to create claims on the /claims endpoint.
3. The token claims will allow me to invoke claimsRecreationBatch(sic) that will be renamed to claimsRecreateBatch.

## Scopes

In general, scopes should reflect and communicate transparently the owner's intent at the highest level, as to what kind of access to resources she is consenting an application to have.  
The scopes described here are the least common denominator for scopes that requesting applications can ask to receive through a participating bank's authorization server, directly in code in the appropriate use cases, or with the resource owner potentially involved in others. If the latter, the client implementation must expect the final granted scopes to possibly reflect a subset of those originally requested.  
The authorization mechanism in each bank will, of course, further define access based on internal rules, e.g. their specific product offerings or service agreements.  

| Scope                        | Description                                                                                        |
|------------------------------|--------------------                                                                                |
| payments                     | Payment scope without prefix, when specific tokens are not issued for individual payments          |
| pis:{PaymentId}              | Prefix for payment scope, when dynamic scopes are supported by provider                            |
| accounts                     | Account scope without prefix, when user access is not specified by the optional consent endpoint   |
| ais:{ConsentId}              | Account consent scope                                                                              |
| claimtemplates               | Claim template scope                                                                               |
| claims                       | Claim scope                                                                                        |
| claimscollection             | Collection Claims scope                                                                            |
| documents                    | Document scope                                                                                     |
| consents                     | Consent scope                                                                                      |

|  Payments EndPoint	                                                                              | Scope                       |              
|---------------------------------------------------------------------------------------              |---------------------        |
| /v1/{payment-service}/{payment-product}:                                                            |	payments                    |            
| /v1/{payment-service}/{payment-product}/{paymentId}:                                                |	payments, pis:{paymentId}   |                        
| /v1/{payment-service}/{payment-product}/info/{Query-X-Request-ID}:                                  |	payments, pis:{paymentId}   |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/status:                                         |	payments, pis:{paymentId}   |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/authorisations:                                 |	payments, pis:{paymentId}   |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/authorisations/{authorisationId}:               |	payments, pis:{paymentId}   |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/cancellation-authorisations:                    |	payments, pis:{paymentId}   |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/cancellation-authorisations/{authorisationId}:  |	payments, pis:{paymentId}   |   

|              Accounts EndPoint                                                                      | Scope                       |              
|-----------------------------------------------------------------------------------------------------|---------------------        |
| /v1/accounts:                                                                                       |	accounts, ais:{consentId}   |                        
| /v1/accounts/{account-id}:                                                                          |	accounts, ais:{consentId}   |                        
| /v1/accounts/{account-id}/balances:                                                                 |	accounts, ais:{consentId}   |                        
| /v1/accounts/{account-id}/transactions:                                                             |	accounts, ais:{consentId}   |                        
| /v1/accounts/{account-id}/transactions/{transactionId}:                                             |	accounts, ais:{consentId}   |                        
| /v1/card-accounts:                                                                                  |	accounts, ais:{consentId}   |                        
| /v1/card-accounts/{account-id}:                                                                     |	accounts, ais:{consentId}   |                        
| /v1/card-accounts/{account-id}/balances:                                                            |	accounts, ais:{consentId}   |                        
| /v1/card-accounts/{account-id}/transactions:                                                        |	accounts, ais:{consentId}   | 

|              Currency EndPoint                                                                      | Scope                       |              
|-----------------------------------------------------------------------------------------------------|---------------------        |                    
| /v1/currencies:                                                                                     |     NA                      |        
| /v1/currencies/sources:                                                                             |     NA                      |        
| /v1/currencies/{base-currency}/rates:                                                               |     NA                      |        
| /v1/currencies/{quote-currency}/rates/{base-currency}:                                              |     NA                      |        
| /v1/currencies/{quote-currency}/rates/{base-currency}/history:                                      |     NA                      |  
      
|              Claim Templates EndPoint                                                               | Scope                       |              
|-----------------------------------------------------------------------------------------------------|---------------------        |                    
| /v1/claimtemplates:                                                                                 |	claimtemplates.read         |                 
| /v1/claimtemplates/{templateId}:                                                                    |	claimtemplates.read         |  

|              Claims EndPoint                                                                        | Scope                       |              
|-----------------------------------------------------------------------------------------------------|---------------------        |                                            
| /v1/claims/{claimId}:                                                                               |	claims.read, claims.write   |                            
| /v1/claims/{claimId}/transactions:                                                                  |	claims.read                 |                   
| /v1/claims/{claimId}/history:                                                                       |	claims.read                 |                 
| /v1/claims/{claimId}/transfer:                                                                      |	claims.read, claims.write   |                            
| /v1/claims:                                                                                         |	claims.read, claims.write   |                            
| /v1/claimsRecreationBatch:                                                                          |	claims.read, claims.write   |                            
| /v1/claimsRecreationBatch/{batchId}:                                                                |	claims.read, claims.write   |                            
| /v1/claimsCreationBatch:                                                                            |	claims.read, claims.write   |                            
| /v1/claimsCreationBatch/{batchId}:                                                                  |	claims.read, claims.write   |                            
| /v1/claimsCancellationBatch:                                                                        |	claims.read, claims.write   |                            
| /v1/claimsCancellationBatch/{batchId}:                                                              |	claims.read, claims.write   |                            
| /v1/claimsAlterationBatch:                                                                          |	claims.read, claims.write   |                            
| /v1/claimsAlterationBatch/{batchId}:                                                                |	claims.read, claims.write   |                            
| /v1/claims/transactions:                                                                            |	claims.read                 |                 
| /v1/claimsTransferBatch:                                                                            |	claims.read, claims.write   |                            
| /v1/claims/{claimId}/documentReferences:                                                            |	claims.read, claims.write   |                            
| /v1/claims/{claimId}/documentReferences/{documentStoreLocation}/{documentReferenceId}:              |	claims.read, claims.write   |      

|              __??ClaimsCollection??__ EndPoint                                                      | Scope                                         |              
|-----------------------------------------------------------------------------------------------------|---------------------                          |                                           
| /v1/claimscollection/{claimId}:                                                                     |	claimscollection.read, claimscollection.write |                              
                      
|              Documents EndPoint                                                                     | Scope                                         |              
|-----------------------------------------------------------------------------------------------------|---------------------                          |                                           
| /v1/documents/{document-store-location}/{sender-kennitala}/{documents-id}:                          |	documents.read, documents.write               |                            
| /v1/documents/{documentStoreLocation}:                                                              |	documents.read, documents.write               |                            
| /v1/documents/{documentStoreLocation}/types:                                                        |	documents.read                                |               
 
|              Consents EndPoint                                                                      | Scope                                         |              
|-----------------------------------------------------------------------------------------------------|---------------------                          |                                           
| /v1/consents/                                                                                       |	consents.read, consents.write                 |                        
