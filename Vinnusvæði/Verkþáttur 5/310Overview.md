---
aspectratio: 169 
listings: true
title: Overview of suggested changes in WA/TA 310
author: Kristinn Stefánsson  
date: 15.12.2021  
...

# Drivers

* Fix discrepancies in WA 310
* Fix issues in IOBWS3.0.yaml
* Make Payments and Accounts, Cards and currencies easier to work with
  * For API consumers 
  * For implementors 
  * For VH-7 maintainers into the future

# Other improvements

* Clarify linage with Berlin Group Next Gen
  * Transparent impact of local BGNG adaptions
  * Facilitate re-verification of TS documents 
    * WA 3201 -> TS 310 
    * TS 313

# Pull Request #127

Suggested fixes for the following issues, partly or in whole:

- IOBWS 3.0 > Missing headers for metadata #100 
- IOBWS 3.0 > Missing and Excess Payment Products #101 
- IOBWS 3.0 > Tags need normalization and cleanup #102 
- WA 310 Endurskoðun v.PSD2 hlítingar, gefa út sem TS 310. #114 
- IOBWS 3.0 > Consolidation with NG 1.3.8 #120 
  
# Pull Request #127 (cont.)

Suggested fixes for the following issues, partly or in whole:

- TS 311 Endurskoðun vegna PSD2 hlítingar #113 
- TS 313 Endurskoðun v. PSD2 hlítingar #112

# Pull Request #127 (cont.)

Also included fixes for the following issues, partly or in whole:

- CentralBankPurpose -> Simple string type
- IcelandicPurpose -> Simple string type

# Pull Request #127 (cont.)

  * Remove cards and currencies from the IOBWS3.0 payments and accounts
    * TS 312
    * TS 311 
    * Not much synergy
    * Made domain more difficult to understand 
    * Increased risk of discrepancies between the specification and YAML 
  
# Pull Request #127 (cont.)
  
* Making BGNG comparison easier:
  * psd2-api 1.3.8 <|-- psd2-api 1.3.8 localized <|-- IOBWS3.0.yaml
* Demonstration
  * psd2-api 1.3.11 localized <|-- IOBWS3.0.yaml

# PR 127 Domestic Changes (cont.)

- Path: "/v1/{payment-service}/{payment-product}/info/{Query-X-Request-ID}" - Added
- Path: "/v1/accounts"
  - Query Parameter: WithCreditLimitQuery - Added
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/accounts/{account-id}"
  - Query Parameter: WithCreditLimitQuery - Added
  - Header Parameter: ConsentId changed from Required to Optional

# PR 127 Domestic Changes (cont.)

- Path: "/v1/accounts/{account-id}/balances"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/accounts/{account-id}/transactions"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/accounts/{account-id}/transactions/{transactionId}"
  - Header Parameter: ConsentId changed from Required to Optional

# PR 127 Domestic Changes (cont.)

- Path: "/v1/card-accounts"
  - Query Parameter: WithCreditLimitQuery - Added
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/card-accounts/{account-id}"
  - Query Parameter: WithCreditLimitQuery - Added
  - Header Parameter: ConsentId changed from Required to Optional

# PR 127 Domestic Changes (cont.)

- Path: "/v1/card-accounts/{account-id}/balances"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/card-accounts/{account-id}/transactions"
  - Header Parameter: ConsentId changed from Required to Optional

# PR 127 Domestic Changes (cont.)

- Path: "/v1/{payment-service}/{payment-product}"
    requestBody:  
    paymentInitiation:  
    oneOf:  
    #/components/schemas/paymentInitiationDomestic_json - Added
    #/components/schemas/periodicPaymentInitiationDomestic_json - Added
    #/components/schemas/bulkPaymentInitiationDomestic_json - AddedComponent Changes

# PR 127 Domestic Changes (cont.)

- Schemas added for Domestic objects
  - ultimateDebtorId
  - ultimateCreditorId
  - partialPayment
  - posEntryMode
  - bank
  - transactionFeesList
  - transactionDetails
  - icelandicPurpose
  - centralBankPurpose

# PR 127 Domestic Changes (cont.)

- RequestBodies added for Domestic objects
  - paymentInitiationDomestic_json
  - periodicPaymentInitiationDomestic_json
  - bulkPaymentInitiationDomestic_json
  - paymentInitiationBulkElementDomestic_jsonResponse added
  - paymentInitiationPaymentIdResponse-200_json

# Samþykktir á fundi 15.12.2021

- Lagt til að Pull Request # 127 yrði uppleggið að feature/v6ts310and313
- Tillagan var samþykkt af öllum viðstöddum eftir umræðu um praktíska útfærslu
- Þátttakendur munu fyrir næsta fund:
  - Lesa yfir útfærslu
  - Taka saman þau atriði sem vitað er um
  - Leggja inn PR fyrir YAML breytingar
  - Nota Issue eða Comment á .md file, henti það 