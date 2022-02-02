---
title: "ÍST TS 310:2020"
author: ICS 03.060 and 35.240
date: "Entry into force: 22.02.2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 310]
subtitle: ["Tækniforskrift - Innlendar greiðslur og innlán", "Technical Specification - Domestic payments and deposits"]
lang: "en"
titlepage: true,
# titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "lib/istfrontpage.pdf"
toc: true
toc-title: Table of contents
# toc-own-page: true
book: true
classoption: oneside
numbersections: true
first-chapter: 1
listings-no-page-break: true
highlight: "zenburn"
codeBlockCaptions: True
mustache: "Vinnusvæði/Verkþáttur 5/310media/docvariables.yml"
figureTitle: |
  Figure #
lofTitle: |
  ## List of Figures
lotTitle: |
  ## List of Tables
tableTemplate: |
  *$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$
autoSectionLabels: True

...

!include-header "Vinnusvæði/Verkþáttur 5/310media/participants.yaml"

\newpage

!include "Vinnusvæði/Verkþáttur 5/310and313media/foreword.md"

# Introduction {.unnumbered}

This Technical Specification (TS) present version 3.0 of the Icelandic Online Banking Services (IOBWS), for {{context_short}}.

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the most recent OASIS SOAP standards at the time, to define common web service interfaces for the Icelandic commercial and savings banks. This enabled software vendors, enterprises and service providers to integrate their accounting, payment, and information systems with the bank's services, to act on behalf of the customers and with full access to their data.

Iceland, with its homogeneous financial infrastructure based on the centralized Banks' Data Centre (Reiknistofa bankanna, or RB), has enjoyed real-time gross settlements and instant credit transfers nationwide since 1987. Other universally accepted services count the common collection solution (Kröfupotturinn) for issuing and paying claims, topping up creditcards, or A/B Giro. All this functionality has been available through IOBWS v1 and v2, comparable to the functionality enjoyed by users of the online banking Web UIs.

When initiating work on the previous versions, the participants in the TN-FMÞ reviewed existing and emerging specifications in the global or mostly European financial industry. None were deemed a good fit at the time for local adaptation, as they reflected inherent the legacy in inter-bank communications outside of Iceland, even in the case of the other Nordic countries. Therefore, v1 and v2 of IOBWS were somewhat specific to the current functionality available in the underlying RB systems.

Meanwhile, the broader market especially in Europe has been catching up, and the Icelandic banks' have migrated to new core banking systems and with the Central Banki of Iceland, implemented a new clearing and settlement mechanisms (CSM). One of the goals of IOBWS v3, set forward by TN-FMÞ, was to move closer to the standards used by those systems such as ISO 20022, at least through application of a comparable dictionary and data elements. 

<!-- Start1 -->
As it has turned out, the Open Banking regulation in UK and the PSD2 regulation issued by the European Parliment has given rise to initiatives to standardize access to payment functionality and account information, on behalf of customers by third parties. One such effort, the NextGenPSD2 Framework developed by the Berlin Group, has met a broad acceptance in the EEA. The data model references ISO 20022, and is close enough to where the Icelandic market is evolving as to make it a relatively straightforward to adapt the IOBWS to use it as a base, instead of continuing to maintain an independant linage of API specifications. 

Another goal of the IOBWS v3 charter set forth by TN-FMÞ, that is achieved by adopting the NextGenPSD2 Framework, is the transition from SOAP to a REST-like API, defined by a recent version of the [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md), with support for newer, open authentication and authorization standards. This hopefully solve some of the complexity involved with previous incarnations of the IOBWS.
<!-- End1 -->

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the auspices of the Icelandic Online Banking Web Services (IOBWS).
<!-- ScopeDocContextEnd -->

"<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist that address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the ÍST WA-316 workshop agreement. Aside from that, as the consumption and implementation of each atomic specification is optional, the documents aim to be independent of each other.

However, due to the origin of the underlying OpenAPI specification in the Berlin Group NextGenPSD2 Framework, ÍST TS-310 on Domestic Payments and Deposits, and ÍST TS-313 on Foreign Payments, overlap quite significantly. Both are based on the 
"[IOBWS3.0.yaml](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/IOBWS3.0.yaml)" 
definition document, and share schema types and API resources. They will still be treated as separate entities but stakeholders are advised to reference the other document if more context is required.

The approach in both {{spec_id}} is to focus on the domestic adaptations to the relevant parts of the NextGenPSD2 framework, and the information needed to tie that to earlier IOBWS versions or other such implementations, and even the Core Banking systems involved. 

The intended audience for the specification document ÍST {{spec_id}} is the implementors of banking services as well as of those systems that will consume them as API clients. The reader is expected to have a basic understanding of the Icelandic financial products involved but also that when needed, further documentation on those will be available from the banks in question as they can involve different service agreements and the end customers' contractual preferences and benefits.
<!-- ScopePaymentsDocsContextEnd -->

The previous IOBWS technical specifications did in large parts consist of transforming the XML Schema and SOAP definitions into human-readable format. 
The expectation is that for technical contracts using OpenAPI specifications, a plethora of utilities, and API tools exist to convert them into documentation or even navigatable UIs. 


<!-- ScopeEndNoteStart -->
Consequently, this specification avoids unnecessary repetition of information found in the accompanying technical contract, as much as possible, and the reader should not expect the specification to replace user-centric documentation, such as by describing overall flows, schema types, or even examples, other than in line with goals of this document. 
<!-- ScopeEndNoteEnd -->

# Normative references, definitions and symbols 

!include "Vinnusvæði/Verkþáttur 5/310and313media/terminalogy.md"

\newpage

# Implementation

## Service Overview

<!-- PaymentSvcOverviewStart -->
Part of the decision to adapt the NextGenPSD2 framework, agreed upon by TN-FMÞ-VH-1 on Technical Requirements and TN-FMÞ-VH-2 on Business Requirments, called for staying as true to the specification as possible.

Still, some adaptations and additional parameters were needed to support payment functionality and account information expected by the Icelandic market. The original approach was to add them to the existing schema types, while some NextGenPSD2 services not applicable to IOBWS usage were removed, in the original 3.0 version. The end-result, though, made both comparison with the original somewhat cumbersome for consumers with previous exposure to NextGenPSD2, while remaining opague for those looking to migrate from earlier IOBWS versions.

When workgroup TN-FMÞ-VH-8 was charged with iterating on the first 3.0 version of IOBWS, it therefore had two primary concern; Make understanding how the {{context_short}} products fit into NextGenPSD2 straightforward, and facilitate easier comparison against future releases by the Berlin Group in order to weigh potential additions to or replacements of, the current domestic adaptations.

After weighing a few approaches, the decision by TN-FMÞ-VH-8 was to keep most of the original NextGenPSD2 OpenAPI definition intact, even those services and types that are not currently applicable to the Icelandic context or intended uses of the IOBWS. The {{context_short}} products (see [section @sec:pis_overview] and [table @tbl:tbl_pis_products] below) are defined separately with applicable json schema types, leaving the original e.g. SEPA message types intact. They, same as the 'native' payment types still share the generic data elements, services, and operations for payments at the core of the NextGenPSD2 specification.   

The [table @tbl:tbl_svcsupport] below list the implications for the OpenAPI YAML contract. It contains e.g. Constent and Signing Basket services, whose removal or commenting out would have a high impact on the contract structure. They will, however, not be implemented as part of this specification, though this does not preclude their use in other contexts. 

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Payment Initiation Service (PIS)**        | Supported by all implementators of {{spec_id}} in accordance with the specification (see later notes on Periodic Payments).      |
| **Account Information Service (AIS)**       | Supported by all implementators of {{spec_id}} in accordance with the specification. |
| **Confirmation of Funds Service (PIIS)**    | Supported by all implementators of {{spec_id}}, in accordance with the specification. |
| **Consent Service**                         | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
| **Signing Baskets Service (SBS)**           | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
:Service support in ÍST {{spec_id}}. {#tbl:tbl_svcsupport}
<!-- PaymentSvcOverviewEnd -->

## Payment Initiation Service

### Overview {#sec:pis_overview}

The {{context_short}} products supported by ÍST {{spec_id}} are as shown in [table @tbl:tbl_svcsupport] below. All those are defined as JSON objects, and other payment types are not supported by the specification.

As instant credit transfers are the only available type in Iceland for account to account transfers, the name is simply Credit Transfers. That does not preclude additional business rules applying for e.g. high-value payments within each bank, or there being different stages in payment flows within e.g. 'end-of-business-day' periods. This could result in service consumers being exposed to transaction status codes reflecting intermediary steps in payment execution, some of which have not previously been visible or mapped in IOBWS return codes. Later changes in CB systems and CMS might also affect the scope of statuses returned so consumers, so all of the available by the specification should be expected.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Credit Transfers**     | Instant credit transfer of an amount between two accounts within the same bank or between two domestic banks.                         |
| **Claim Payments**       | Make a withdrawal from account to pay a claim (e.g. a bill). The claim can be created in any domestic bank. |
| **Payment Card Deposits** | Make a withdrawal from account to pay onto the account behind a payment card, within the same bank or between two domestic banks.  |
:Domestic payment products. {#tbl:tbl_pis_products}

For each of the payment products, the support for payment services is given in [table @tbl:pay_avail_svc]. Periodic payments are distinct from future dating a payment, which are supported in a similar manner to previous versions of IOBWS as part of creating a payment (see requestedExecutionDate). At this time, behaviour for periodic payments is not support by the ÍST {{spec_id}.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **payments**             | Supported by all implementators of {{spec_id}} in accordance with the specification, for all domestic payment products.                         |
| **bulk-payments**        | Supported by all implementators of {{spec_id}} in accordance with the specification, for all payment products. |
| **periodic-payments**    | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract. |
:Availability of payment service. {#tbl:pay_avail_svc}

### Domestic Payment Product Data Elements 

The following elements are used in the domestic payment products under scope for ÍST {{spec_id}}:

  --------------------------------------------------------------------------------------
  **Data Element**                         **Credit         **Claim      **Credit Card
                                           Transfers**       Payments**    Deposits**
  ---------------------------------------- ---------------- ------------ ---------------
  endToEndIdentification                   Optional         Optional     Optional

  debtorAccount                            Mandatory        Mandatory    Mandatory

  debtorId                                 Optional         Optional     Optional

  chargesAccount                           n.a              n.a          n.a

  ultimateDebtor                           Optional         Optional     Optional

  ultimateDebtorId                         Optional         Optional     Optional

  instructedAmount                         Mandatory        Mandatory    Mandatory

  creditorAccount                          Mandatory        Mandatory    Mandatory

  creditorAgent                            n.a              n.a          n.a

  creditorAgentAddress                     n.a              n.a          na.

  creditorName                             n.a              n.a          n.a

  creditorId                               Optional         Optional     Optional

  creditorAddress                          n.a              n.a          n.a

  ultimateCreditor                         Optional         Optional     Optional

  ultimateCreditorId                       Optional         Optional     Optional                         

  icelandicPurposeCode                     Optional         Optional     Optional

  chargeBearer                             n.a              n.a          n.a

  remittanceInformationUnstructured        Optional         Optional     Optional

  remittanceInformationStructured          Optional         Optional     Optional

  requestedExecutionDate                   Optional         Optional     Optional

  partialPayment                           n.a.             Mandatory    n.a.

  serviceLevel                             n.a              n.a          n.a

  centralBankPurpose                      n.a              n.a          n.a
  --------------------------------------------------------------------------------------
  :Data Elements for Domestic payments. {#tbl:tbl_data_domestic}

To elaborate on the use of each attribute the following [table @tbl:proper_domestic] contains additional information on top of the schema defenitions. Notes on individual data elements or usage patterns follow in the subsections. 

  -------------------------------------------------------------------------------------------
  Field                                   Description
  --------------------------------------- ---------------------------------------------------
  endToEndIdentification                  Intended for ID, short message or description that
                                          will be communicated to the creditor,
                                          across different banks. Is replaces the bill number
                                          (is. *seðilnúmer*, TNUM_I/TNUM_U). While
                                          supporting 35 characters, only the first 7 chars
                                          can reliably flow between all possible CB systems,
                                          reports, and even client systems, due to legacy 
                                          expectations and implementations.

  debtorAccount                           Debtor account is the account money is being
                                          transfer from.

  debtorId                                For the domestic payment products, this element
                                          should contain the kennitala of the debtor,
                                          owner of the deptorAccount.

  ultimateDebtor                          Ultimate Debtor identifies the party that owes the
                                          cash to the creditor, e.g. as a result of receipt 
                                          of goods or services. Used in those cases where it
                                          is different from the debtor/payor.

  ultimateDebtorId                        Ultimate Debtor identifies the party that owes the
                                          cash to the Creditor as a result of receipt of
                                          goods or services. Ultimate debtor kennitala is 
                                          included when different from the debtor Id.

  instructedAmount                        Amount and currency to be transferred.

  creditorAccount                         Creditor account is the account used to transfer
                                          money to Beneficiary's account. In the case of a
                                          claim payment, this would be contain the claim key
                                          represented as a BBAN number.

  creditorId                              Used for the kennitala of the creditor, whose 
                                          account is credited with the payment. As the
                                          kennitala is part of the Icelandic IBAN, and
                                          BBAN numbers, this is an optional field. 

  creditorName                            The creditor name is optional and ignored when
                                          kennitala is part of the Icelandic IBAN, 
                                          and BBAN numbers, or provided in creditorId. 

  creditorAddress                         The creditor address is not needed in domestic
                                          payments where kennitala can be used as lookup 
                                          key through the National Registry.

  ultimateCreditor                        The creditor (for example a finance company or an
                                          intermediary in a business transaction), may be
                                          different from the ultimate creditor. The debtor
                                          can enter who the final/real beneficiary of the
                                          payment is. In the case of Payment Card Deposit
                                          using masked PAN, ultimate Creditor contains
                                          the owner of the card.

  ultimateCreditorId                      In the case of Payment Card Deposits using
                                          masked PAN the Ultimate Creditor ID contains kennitala
                                          of the card owner.

  icelandicPurposeCode                    The purpose is the equivalent of the category code 
                                          (is. *textalykill*) used to classify the transaction. 
                                          Restricted to codes available in each originating bank.

  remittanceInformationStructured         The debtors's information about the payment. An array but
  Array of Remittance                     Currently only used for the equivalent of the IOBWS v2.0 
                                          **Out.Reference** (is. *tilvísun*), that was mainly used 
                                          for the kennitala of the creditor, now a separate 
                                          parameter. Can convey other information and therefore 
                                          included.

  remittanceInformationUnStructured       Is used for payment description visible for both parties. 
                                          Only 16 characters can currently be expected
                                          to reliably flow between all systems, even if the 
                                          field accepts 140 characters.

  requestedExecutionDate                  Execution date if in the future, fully equivalent to the 
                                          IOBWS v2.0 **requestedExecutionDate** for future payments
                                          (is. *framvirk greiðsla*).

  executionDate                           Execution date if in the future, equivalent to the 
                                          IOBWS v2.0 **requestedExecutionDate** for future payments
                                          (is. *framvirk greiðsla*).

  partialPayment                          Applies to Claim Payments when the deptor
                                          intends to only pay part of the amount owed,
                                          towards an existing claim. The claim needs
                                          to allow partial payment, else an error occurs. 
  ------------------------------------------------------------------------------------------
  :Description of domestic payments properties. {#tbl:proper_domestic}

## Bulk Payments

Bulk payments are supported for all the domestic payment types. Only a single payment type is supported in each bulk payment initiation, consistent with the approach of the NextGenPSD2 framework.

  ---------------------------------------------------------------------------------------
  **Data Element**         **Type**      **Condition**   **Description**
  ------------------------ ------------- --------------- --------------------------------
  batchBookingPreferred    Boolean       optional        When the element is true, the
                                                         debtor prefers only one booking
                                                         entry. If this element equals
                                                         false, the debtor prefers
                                                         individual booking of all
                                                         contained individual
                                                         transactions. The bank will
                                                         follow this preference according
                                                         to contracts agreed on with the
                                                         debtor.

  debtorAccount (incl.     Account       mandatory       
  type)                    Reference                     

  paymentInformationId     Max35Text     Optional        Unique identification assigned 
                                                         by the sending party to
                                                         unambiguously identify this bulk
                                                         payment. Replaces 
                                                         **NameOfBatch** in IOBWS v2.0 and
                                                         **PaymentsID**, that was generated
                                                         by the receiving bank.
                                                         Note: This attribute might be
                                                         considered mandatory in future
                                                         versions of the specification.

  requestedExecutionDate   ISODate       optional        Determines if the payments
                                                         contained in the bulk will be
                                                         executed at a later date.
                                                         This field may not be used
                                                         together with the field
                                                         requestedExecutionTime.

  requestedExecutionTime   ISODateTime   optional        Determines if the payments
                                                         contained in the bulk will be
                                                         executed at the addressed
                                                         date and time. This field 
                                                         cannot be together in 
                                                         combination with
                                                         *requestedExecutionDate*.

  payments                 Bulk Entry    mandatory       The Bulk Entry is a JSON Type
                                                         which mirrors the supported
                                                         domest payment products for
                                                         single payments, excluding the
                                                         data elements: debtorAccount,
                                                         and requestedExecutionDate. 
  ---------------------------------------------------------------------------------------
  :Description of domestic bulk payment main body. {#tbl:bulk_domestic}

# Accounts


  ------------------------------------------------------------------------------------
  **Field**                           **Rule**   **Description**
  ----------------------------------- ---------- -------------------------------------
  transactionId                       M          Unique identifier for this record

  transactionTimestamp                M,IS       Execution datetime of the record

  entryReference                      M          Payment Correlation ID

  endToEndId                          O          Short description

  mandateId                           NA         Identification of Mandates

  checkId                             NA         Not used

  currencyExchange                    C          List. If transaction caused by any
                                                 foreign exchange

  bookingDate                         O          The Date when an entry is booked

  valueDate                           M          The Date at which assets become
                                                 available

  transactionAmount                   M          Amount and currency of this record

  creditorId                          O          Creditor id

  creditorName                        O          Creditor name

  creditorAccount                     O          Creditor account

  creditorAgent                       O          BICFI

  ultimateCreditor                    O          Ultimate creditor

  ultimateCreditorId                  O,IS       Ultimate creditor id

  debtorId                            O,IS       Debtor Id

  debtorName                          O          Debtor name

  debtorAccount                       O          Debtor account

  debtorAgent                         O          BICFI

  ultimateDebtor                      O          Ultimate debtor

  ultimateDebtorId                    O,IS       Ultimate debtor Id

  remittanceInformationUnstructured   O          My description

  remittanceInformationStructured     O          Reference field 16 characters

  additionalInformation               O          Additional transaction related
                                                 information

  purposeCode                         NA         Not used

  icelandicPurposeCode                O,IS       Text code used as simple transaction
                                                 categorization

  bankTransactionCode                 NA         Not used

  proprietaryBankTransactionCode      NA         Not used

  balanceAfterTransaction             O          Balance after the transaction has
                                                 been performed

  \_links                             O          Link to transaction details
  ------------------------------------------------------------------------------------
  :Description of transaction details. {#tbl:transaction_payments_domestic}

Field rules

-   M = Mandatory

-   O = Optional

-   C = Conditional

-   NA = Not applicable / Not used

-   IS = Icelandic

-  **Credit Limit Query supported**: It is possible to query account information to get information on the allowed credit limit (withCreditLimitQuery).

# Appendix

## Errors

## Mapping from older implementations

Those familiar with previous versions of IOBWS might want to 

## Domestic adaptations of the NextGenAPI framework

As mentioned, one of the guiding principles for ÍST {{spec_id}} was to make the specification for domestic payments and accounts easy to compare against the original Berlin Group NextGenPSD2 document, and its future versions. In the first iteration of version 3.0, the OpenAPI definition however involved cards and currencies, making the overall contract even more complex than the original. The base was then referencing NextGenPSD2 version 1.3.6 but though upgrading to 1.3.8 was desired, it had turned out to be a considerable task. To facilitate maintenance of the specification througout minor version updates, as well as simplifying implementations of IOBWS, the cards and currencies APIs were split into their own separate contracts, and the domestic adaptations reworked on top of an intact version 1.3.6. This approach was then validated, by upgrading to NextGenPSD2 version 1.3.8 without undue roadblocks.

To make it even easier to do see the deltas in e.g. text comparison tools, localized version of the source NextGenAPI specifications are stored in appropriate "Stuðningsefni/Berlin-group/v.1.3.8" folder. Alongside that document, there was created an intermediary document with some of the most common and repeated adaptations. The relationship between these documents looks like the following, though the actual filenames are longer:

> psd2-api 1.3.8 <|-- psd2-api 1.3.8 localized <|-- IOBWS3.0.yaml

The 'localized' document makes comparision in the final IOBWS3.0.yaml more transparent but in the following sections we further breakdown *all adaptations* made for Icelandic payments and accounts:

### The localized file 

Changes between "psd2-api 1.3.8 2020-12-14v2.yaml" and "psd2-api 1.3.8 2020-12-14v2-localized.yaml" (see Stuðningsefni/Berlin-group/v.1.3.8)
.
- Tag "Common Services" was removed completely, botht the definition and  allusage in Tags.
- Tags on Consents services changed from "Account Information Service (AIS)" to "Consent Service"
- "Signing Baskets (SBS)" Tag renamed to "Signing Baskets Service (SBS)"

 ### The IOWBS3.0 specification document

Changes between "psd2-api 1.3.8 2020-12-14v2-localized.yaml" and "IOBWS3.0.yaml"  (see final in /Deliverables).

**Services:**

- Path: "/v1/accounts"
  - Query Parameter: WithCreditLimitQuery - added
  - Header Parameter: ConsentId changed from Required to Optional
  - Path: "/v1/accounts/{account-id}"
  - Query Parameter: WithCreditLimitQuery - added
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/accounts/{account-id}/balances"
  - Header Parameter: ConsentId changed from Required to Optional
  - Path: "/v1/accounts/{account-id}/transactions"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/accounts/{account-id}/transactions/{transactionId}"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/card-accounts"
  - Query Parameter: WithCreditLimitQuery - added
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/card-accounts/{account-id}"
  - Query Parameter: WithCreditLimitQuery - added
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/card-accounts/{account-id}/balances"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/card-accounts/{account-id}/transactions"
  - Header Parameter: ConsentId changed from Required to Optional
- Path: "/v1/{payment-service}/{payment-product}"
  - Only json, domestic types listed as 'oneOf' the accepted products
  - Header Parameter: Idempotency-Key - added
  
**Components:**

- paymentInitiation:  
  - oneOf:  
    - #/components/schemas/paymentInitiationDomestic_json - Added  
    - #/components/schemas/periodicPaymentInitiationDomestic_json - Added  
    - #/components/schemas/bulkPaymentInitiationDomestic_json - Added

- accountDetails
  - creditLimit - added
  
- transactions:
  - transactionTimestamp - added
  - description - added
  - ultimateCreditorId - added
  - debtorId - added
  - ultimateDebtorId - added
  - icelandicPurpose - added
  
- cardTransaction:
  - posEntryMode - added

*Schema types added for domestic payments and account information:*
- ultimateDebtorId
- ultimateCreditorId
- partialPayment
- posEntryMode
- bank
- transactionFeesList
- transactionFeesDetail
- icelandicPurpose
- centralBankPurpose
- bicfiOrIdentification

*Request bodies added for Domestic objects:*
- paymentInitiationDomestic_json
- periodicPaymentInitiationDomestic_json
- bulkPaymentInitiationDomestic_json
- paymentInitiationBulkElementDomestic_jsonResponse added
- paymentInitiationPaymentIdResponse-200_json
