# WA 316 IOBWS 3.0 Authentication Requirements

## Introduction

Context ...
In the scopes, business rules for individual payments products or services is not fully reflected e.g. with regards to foreign payments.

## Main Use Cases 

### Centralised Financial System
> As an **Financial System**, I want to connect to IOBWS 3.0 services so that I can e.g. manage Claims, iniate Payments and fetch Account transactions in batches or directly on behalf of users.
Acceptance criteria:
1. Support for Búnaðarskilríki issued under Fullgilt Auðkenni, the current gold standard for authenticating and authorising centralised software to act on behalf of organisational units.
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
3. Support for on-line scenarios, where the organisation authenticates the interactive employee that instigates the action.

### Onpremise System
> As **a users of a on-premise Financial System**, I want to be able to authorise the system to connect to IOBWS 3.0 services and manage Claims, iniate Payments and fetch Account transactions on my behalf in non-interactive sessions.
Acceptance criteria:
1. Support for OIDC and OAuth 2.0, code flow with offline_access, using MTLS to identify the client/server using Búnaðarskilríki issued under Fullgilt Auðkenni. 

### On-premise employee
> As a **company employee** I want to e.g. iniate payment instructions, create claims and interact with IOBWS 3.0 so that I can manage my day-to-day activities through e.g. the companies ERP system.
Acceptance criteria:
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
2. Support for user authentication with Qualified Certificates.

### Financial Services
> As e.g. **an independant Accounting firm** offering services to multiple clients, I want to be able to access their accounts and products through IOBWS 3.0, so I can manage their financials and accounting.
Acceptance criteria:
1. Support for assuming multiple identities. 
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
2. Support for user authentication with Qualified Certificates.
3. The scopes should be known, based on the endpoints defined in IOBWS 3.0.

### Financial Software as a Service
> As the IOBWS 3.0 **customer of a bank**, I want to be able to authorise SaaS software hosted in public clouds to act on my behalf, so I can allow the service to manage my financials and the products I have access to such as Claims.
Acceptance criteria:
1. This should address the scenario where companies offering e.g. Dynamics 365 or more custom apps need to act on behalf of bank customers.
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
2. Support for user authentication with Qualified Certificates.

### Software Vendor
> As a **Software Vendor** providing Custom, COTS or SaaS applications that my clients use to accesses IOBWS 3.0, I want to be able to target common authentication behavior as part of the technical standard offered by all the banks, so that I do not have to implement and test against multiple subtly different endpoints.
Acceptance criteria:
1. There exist code samples that show how to connect using common platforms and frameworks.
2. The possible variations between banks do not affect the protocol exchanges between the client, authorisation server and API endpoint.
3. Possible variations in methods that still are offered by more than one bank are made part of the standard, as long as a common fallback exists. 

### User of open endpoints
> As a **Consumer of open services** such as currency data, I want my system to be able to interact with the endpoints without authentication but identify my client as to 
Acceptance criteria:

### Enterprise with the Claim Collection Agency role logs in for the first time
> As a **Claim Collection Agency**, I want my system to be able to login into the system and clearly separate my authentication as a secondary collection agency vs. my use as a primary claims collector. 
Acceptance criteria:
1. When I log in as a secondary collection role, I identify using a client ID that is related to that role.
2. When I log in as the parent enterprise to create claims as a primary claims collector, I identify using a client ID that is related to that role

### Claim Collection Agency
> As a **Claim Collection Agency**, I want my system to be able to interact with the endpoints to manipulate claims whose status is in secondary collection and transferred to a claim template in my ownership. 
Acceptance criteria:
1. When I log in, my token reflects the css.read and css.write scopes.
2. The token claims as per each service rules, will not allow me to create claims on the /claims endpoint.
3. The token claims will allow me to invoke claimsRecreationBatch(sic) that will be renamed to claimsRecreateBatch.

## Scopes
ATT. list up as part of this documentation, at least one scope per endpoint, discuss if more needed.
For IOBWS we are not chasing BG on how to issue tokens per product initiation.
Consider if there should be read (get) and read-write (get, post, delete, put) per endpoint.
Name of scopes should be [service abbrevation].[read|write][:EntityID]

/v1/claimtemplates
/v1/claimtemplates/{template-id}
/v1/claims/{claim-id}, post, get, delete, put
/v1/claims/{claim-id}/transactions
/v1/claims/{claim-id}/history

| Scope                        | Description        |
|------------------------------|--------------------|
| payments                          | Payment scope without prefix, when specific tokens are not issued for individual payments |
| pis:{PaymentId}              | Prefix for payment scope, when dynamic scopes are supported by provider |
| accounts                          | Account scope without prefix, when user access is not specified by the optional consent endpoint |
| ais:{ConsentId}              | Account consent scope |
| claimtemplates                          | Claim template scope |
| claims                          | Claim scope |
| claimscollection                          | Collection Claims scope |
| documents                          | Document scope |
| consents                          | Consent scope |

|  Payments EndPoint	                                                                                | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|
| /v1/{payment-service}/{payment-product}:                                                            |	payments                 |            
| /v1/{payment-service}/{payment-product}/{paymentId}:                                                |	payments, pis:{paymentId}     |                        
| /v1/{payment-service}/{payment-product}/info/{Query-X-Request-ID}:                                  |	payments, pis:{paymentId}     |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/status:                                         |	payments, pis:{paymentId}     |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/authorisations:                                 |	payments, pis:{paymentId}     |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/authorisations/{authorisationId}:               |	payments, pis:{paymentId}     |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/cancellation-authorisations:                    |	payments, pis:{paymentId}     |                        
| /v1/{payment-service}/{payment-product}/{paymentId}/cancellation-authorisations/{authorisationId}:  |	payments, pis:{paymentId}     |   

|              Accounts EndPoint                                                                            | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|
| /v1/accounts:                                                                                       |	accounts, ais:{consentId}     |                        
| /v1/accounts/{account-id}:                                                                          |	accounts, ais:{consentId}     |                        
| /v1/accounts/{account-id}/balances:                                                                 |	accounts, ais:{consentId}     |                        
| /v1/accounts/{account-id}/transactions:                                                             |	accounts, ais:{consentId}     |                        
| /v1/accounts/{account-id}/transactions/{transactionId}:                                             |	accounts, ais:{consentId}     |                        
| /v1/card-accounts:                                                                                  |	accounts, ais:{consentId}     |                        
| /v1/card-accounts/{account-id}:                                                                     |	accounts, ais:{consentId}     |                        
| /v1/card-accounts/{account-id}/balances:                                                            |	accounts, ais:{consentId}     |                        
| /v1/card-accounts/{account-id}/transactions:                                                        |	accounts, ais:{consentId}     | 

|              Currency EndPoint                                                                      | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|                    
| /v1/currencies:                                                                                     |     NA              |        
| /v1/currencies/sources:                                                                             |     NA              |        
| /v1/currencies/{base-currency}/rates:                                                               |     NA              |        
| /v1/currencies/{quote-currency}/rates/{base-currency}:                                              |     NA              |        
| /v1/currencies/{quote-currency}/rates/{base-currency}/history:                                      |     NA              |  
      
|              Claim Templates EndPoint                                                                            | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|                    
| /v1/claimtemplates:                                                                                 |	claimtemplates.read            |                 
| /v1/claimtemplates/{templateId}:                                                                    |	claimtemplates.read            |  

|              Claims EndPoint                                                                        | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|                           |                 
| /v1/claims/{claimId}:                                                                               |	claims.read, claims.write |                            
| /v1/claims/{claimId}/transactions:                                                                  |	claims.read         |                 
| /v1/claims/{claimId}/history:                                                                       |	claims.read         |                 
| /v1/claims/{claimId}/transfer:                                                                      |	claims.read, claims.write |                            
| /v1/claims:                                                                                         |	claims.read, claims.write |                            
| /v1/claimsRecreationBatch:                                                                          |	claims.read, claims.write |                            
| /v1/claimsRecreationBatch/{batchId}:                                                                |	claims.read, claims.write |                            
| /v1/claimsCreationBatch:                                                                            |	claims.read, claims.write |                            
| /v1/claimsCreationBatch/{batchId}:                                                                  |	claims.read, claims.write |                            
| /v1/claimsCancellationBatch:                                                                        |	claims.read, claims.write |                            
| /v1/claimsCancellationBatch/{batchId}:                                                              |	claims.read, claims.write |                            
| /v1/claimsAlterationBatch:                                                                          |	claims.read, claims.write |                            
| /v1/claimsAlterationBatch/{batchId}:                                                                |	claims.read, claims.write |                            
| /v1/claims/transactions:                                                                            |	claims.read         |                 
| /v1/claimsTransferBatch:                                                                            |	claims.read, claims.write |                            
| /v1/claims/{claimId}/documentReferences:                                                            |	claims.read, claims.write |                            
| /v1/claims/{claimId}/documentReferences/{documentStoreLocation}/{documentReferenceId}:              |	claims.read, claims.write |      

|              __??ClaimsCollection??__ EndPoint                                                                        | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|                           |                 
| /v1/claimscollection/{claimId}:                                                                               |	claimscollection.read, claimscollection.write |                              
                      
|              Documents EndPoint                                                                            | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|                           |                 
| /v1/documents/{document-store-location}/{sender-kennitala}/{documents-id}:                          |	documents.read, documents.write |                            
| /v1/documents/{documentStoreLocation}:                                                              |	documents.read, documents.write |                            
| /v1/documents/{documentStoreLocation}/types:                                                        |	documents.read            |               
 
|              Consents EndPoint                                                                            | Scope               |              
|-----------------------------------------------------------------------------------------------------|---------------------|                           |                 
| /v1/consents/                          |	consents.read, consents.write |                        
