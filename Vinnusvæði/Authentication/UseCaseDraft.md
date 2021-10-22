# Use Cases for IOBWS 3.0 Authentication

## Centralised Financial System
> As an **Financial System**, I want to connect to IOBWS 3.0 services so that I can e.g. manage Claims, iniate Payments and fetch Account transactions in batches or directly on behalf of users.
Acceptance criteria:
1. Support for Búnaðarskilríki issued under Fullgilt Auðkenni, the current gold standard for authenticating and authorising centralised software to act on behalf of organisational units.
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
3. Support for on-line scenarios, where the organisation authenticates the interactive employee that instigates the action.

## Onpremise System
> As **a users of a on-premise Financial System**, I want to be able to authorise the system to connect to IOBWS 3.0 services and manage Claims, iniate Payments and fetch Account transactions on my behalf in non-interactive sessions.
Acceptance criteria:
1. Support for OIDC and OAuth 2.0, code flow with offline_access, using MTLS to identify the client/server using Búnaðarskilríki issued under Fullgilt Auðkenni. 

## On-premise employee
> As a **company employee** I want to e.g. iniate payment instructions, create claims and interact with IOBWS 3.0 so that I can manage my day-to-day activities through e.g. the companies ERP system.
Acceptance criteria:
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
2. Support for user authentication with Qualified Certificates.

## Financial Services
> As e.g. **an independant Accounting firm** offering services to multiple clients, I want to be able to access their accounts and products through IOBWS 3.0, so I can manage their financials and accounting.
Acceptance criteria:
1. Support for assuming multiple identities. 
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
2. Support for user authentication with Qualified Certificates.
3. The scopes should be known, based on the endpoints defined in IOBWS 3.0.

## Financial Software as a Service
> As the IOBWS 3.0 **customer of a bank**, I want to be able to authorise SaaS software hosted in public clouds to act on my behalf, so I can allow the service to manage my financials and the products I have access to such as Claims.
Acceptance criteria:
1. This should address the scenario where companies offering e.g. Dynamics 365 or more custom apps need to act on behalf of bank customers.
2. Support for OIDC and OAuth 2.0, code flow with PKCE as the commmon demoninator. 
2. Support for user authentication with Qualified Certificates.

## Software Vendor
> As a **Software Vendor** providing Custom, COTS or SaaS applications that my clients use to accesses IOBWS 3.0, I want to be able to target common authentication behavior as part of the technical standard offered by all the banks, so that I do not have to implement and test against multiple subtly different endpoints.
Acceptance criteria:
1. There exist code samples that show how to connect using common platforms and frameworks.
2. The possible variations between banks do not affect the protocol exchanges between the client, authorisation server and API endpoint.
3. Possible variations in methods that still are offered by more than one bank are made part of the standard, as long as a common fallback exists. 

## User of open endpoints
> As a **Consumer of open services** such as currency data, I want my system to be able to interact with the endpoints without authentication but identify my client as to 
Acceptance criteria:
1. 

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

| Origin	                     |  EndPoint	                                                                                          |  Scope	              |
|------------------------------|------------------------------------------------------------------------------------------------------|-----------------------| 
| IOBWS3.0.yaml:98:            |	/v1/{payment-service}/{payment-product}:                                                            |	pis	                  |  
| IOBWS3.0.yaml:230:           |	/v1/{payment-service}/{payment-product}/{paymentId}:                                                |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:402:           |	/v1/{payment-service}/{payment-product}/info/{Query-X-Request-ID}:                                  |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:487:           |	/v1/{payment-service}/{payment-product}/{paymentId}/status:                                         |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:565:           |	/v1/{payment-service}/{payment-product}/{paymentId}/authorisations:                                 |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:777:           |	/v1/{payment-service}/{payment-product}/{paymentId}/authorisations/{authorisationId}:               |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:1002:          |	/v1/{payment-service}/{payment-product}/{paymentId}/cancellation-authorisations:                    |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:1210:          |	/v1/{payment-service}/{payment-product}/{paymentId}/cancellation-authorisations/{authorisationId}:  |	pis:{paymentId}	      |              
| IOBWS3.0.yaml:1444:          |	/v1/accounts:                                                                                       |	ais:{consentId}	      |              
| IOBWS3.0.yaml:1540:          |	/v1/accounts/{account-id}:                                                                          |	ais:{consentId}	      |              
| IOBWS3.0.yaml:1633:          |	/v1/accounts/{account-id}/balances:                                                                 |	ais:{consentId}	      |              
| IOBWS3.0.yaml:1719:          |	/v1/accounts/{account-id}/transactions:                                                             |	ais:{consentId}	      |              
| IOBWS3.0.yaml:1810:          |	/v1/accounts/{account-id}/transactions/{transactionId}:                                             |	ais:{consentId}	      |              
| IOBWS3.0.yaml:1904:          |	/v1/card-accounts:                                                                                  |	ais:{consentId}	      |              
| IOBWS3.0.yaml:1987:          |	/v1/card-accounts/{account-id}:                                                                     |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2072:          |	/v1/card-accounts/{account-id}/balances:                                                            |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2160:          |	/v1/card-accounts/{account-id}/transactions:                                                        |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2255:          |	/v1/cards:                                                                                          |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2320:          |	/v1/cards/{card-id}:                                                                                |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2386:          |	/v1/cards/{card-id}/balances:                                                                       |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2455:          |	/v1/cards/{card-id}/transactions:                                                                   |	ais:{consentId}	      |              
| IOBWS3.0.yaml:2528:          |	/v1/currencies:                                                                                     |	cur.read	            |        
| IOBWS3.0.yaml:2570:          |	/v1/currencies/sources:                                                                             |	cur.read	            |        
| IOBWS3.0.yaml:2614:          |	/v1/currencies/{base-currency}/rates:                                                               |	cur.read	            |        
| IOBWS3.0.yaml:2659:          |	/v1/currencies/{quote-currency}/rates/{base-currency}:                                              |	cur.read	            |        
| IOBWS3.0.yaml:2706:          |	/v1/currencies/{quote-currency}/rates/{base-currency}/history:                                      |	cur.read	            |        
| IOBWS-Claims3.0.yaml:33:     |	/v1/claimtemplates:                                                                                 |	cts.read, cts.write	  |                  
| IOBWS-Claims3.0.yaml:95:     |	/v1/claimtemplates/{templateId}:                                                                    |	cts.read, cts.write	  |                  
| IOBWS-Claims3.0.yaml:156:    |	/v1/claims/{claimId}:                                                                               |	ccs.read, ccs.write	  |                  
| IOBWS-Claims3.0.yaml:327:    |	/v1/claims/{claimId}/transactions:                                                                  |	ccs.read	            |        
| IOBWS-Claims3.0.yaml:386:    |	/v1/claims/{claimId}/history:                                                                       |	ccs.read	            |        
| IOBWS-Claims3.0.yaml:446:    |	/v1/claims/{claimId}/transfer:                                                                      |	ccs.read, ccs.write	  |                  
| IOBWS-Claims3.0.yaml:504:    |	/v1/claims:                                                                                         |	ccs.read, ccs.write	  |                  
| IOBWS-Claims3.0.yaml:628:    |	/v1/claimsRecreationBatch:                                                                          |		                    |
| IOBWS-Claims3.0.yaml:687:    |	/v1/claimsRecreationBatch/{batchId}:                                                                |		                    |
| IOBWS-Claims3.0.yaml:743:    |	/v1/claimsCreationBatch:                                                                            |		                    |
| IOBWS-Claims3.0.yaml:803:    |	/v1/claimsCreationBatch/{batchId}:                                                                  |		                    |
| IOBWS-Claims3.0.yaml:859:    |	/v1/claimsCancellationBatch:                                                                        |		                    |
| IOBWS-Claims3.0.yaml:919:    |	/v1/claimsCancellationBatch/{batchId}:                                                              |		                    |
| IOBWS-Claims3.0.yaml:975:    |	/v1/claimsAlterationBatch:                                                                          |		                    |
| IOBWS-Claims3.0.yaml:1035:   |	/v1/claimsAlterationBatch/{batchId}:                                                                |		                    |
| IOBWS-Claims3.0.yaml:1091:   |	/v1/claims/transactions:                                                                            |		                    |
| IOBWS-Claims3.0.yaml:1158:   |	/v1/claimsTransferBatch:                                                                            |		                    |
| IOBWS-Claims3.0.yaml:1218:   |	/v1/claims/{claimId}/documentReferences:                                                            |		                    |
| IOBWS-Claims3.0.yaml:1335:   |	/v1/claims/{claimId}/documentReferences/{documentStoreLocation}/{documentReferenceId}:              |		                    |
| IOBWS-Documents3.0.yaml:26:  |	/v1/documents/{document-store-location}/{sender-kennitala}/{documents-id}:                          |	doc.read, doc.write	  |                  
| IOBWS-Documents3.0.yaml:154: |	/v1/documents/{documentStoreLocation}:                                                              |	doc.read, doc.write	  |                  
| IOBWS-Documents3.0.yaml:268: |	/v1/documents/{documentStoreLocation}/types:                                                        |	doc.read, doc.write	  |                  