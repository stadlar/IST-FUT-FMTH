---
title: "ÍST TS 311:2022"
author: ICS 35.240, 3.060
date: "Entry into force XX-XX-2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 310]
subtitle: ["Tækniforskrift - Yfirlit debet og kreditkorta", "Technical specification - Debit and credit cards details and statements"]
lang: "en"
titlepage: true,
# titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "lib/istfrontpage.pdf"
toc: true
toc-title: Table of contents
# toc-own-page: true
book: true
classoption: twoside
numbersections: true
first-chapter: 1
listings: true
listings-no-page-break: true
highlight: "zenburn"
codeBlockCaptions: True
mustache: "docs/311media/docvariables.yml"
figureTitle: |
  Figure #
lofTitle: |
  ## List of Figures
lotTitle: |
  ## List of Tables
tableTemplate: |
  *$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$
autoSectionLabels: True
link-citations: true
bibliography: "lib/bibliography.yaml"
csl: "lib/iso690-numeric-en.csl"
fontsize: 9pt
titlefont: Arial.ttf
...

!include-header "docs/311media/participants.yaml"

\newpage

# Foreword {.unnumbered}
<!-- ForewordStart -->
This ÍST Technical Specification was developed in accordance with "ÍST Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.* IST rules on Technical Specifications, Technical Reports and Workshop Agreements). The TS (Technical specification) was prepared by the technical committee TN-FMÞ (The Technical Committee on Financial Services) that operates within FUT (Sector committee for ICT standardization) following a public call for participation within TN-FMÞ. The final draft was sent to the TN-FMÞ on the {{finaldraft_date}} and approved by correspondence on the {{approve_date}}. The text of ÍST {{spec_id}} was submitted to IST for publication on {{publication_date}}.
 
The accompanying OpenAPI 3.0.1 definition "{{yaml_definition}}" located at [https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables](https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables), should be viewed as an integral part of ÍST {{spec_id}}. 

The document "{{fulldoc_name}}" is the source of this rendition, and versions of that document will be used for future errata and clarifications per the procedures to be laid out in the workshop agreement ÍST WA-316, IOBWS 3.0 Technical Guidelines. The rules are outlined in the README.md accompanying the Github Git repository and are accepted by the participants in TN-FMÞ alongside this specification. These guidelines establish the workgroup TN-FMÞ-VH-7 as in charge of monitoring submitted issues and pull requests made to the repository when they fall outside the purview of other regular workgroups. TN-FMÞ-VH-7 will evaluate if changes are ready to be accepted into the repository and when or if they warrant patches or minor releases to the specification. Versioning will adhere to the [Semantic Versioning](https://semver.org/spec/v2.0.0.html) [@semver2] scheme and each minor release will require a workgroup agreement under the "ÍST reglur" referenced above.

{{funding_paragraph}}

ÍST {{spec_id}} is not subject to any patent rights. The underlying OpenAPI specification is derived from version 1.3.8 of the 
[Berlin Group's NextGenPSD2 Framework](https://www.berlin-group.org/nextgenpsd2-downloads)
and therefore also distributed under a 
[Creative Commons Attribution 4.0 International Public License (CC BY)](https://creativecommons.org/licenses/by/4.0/#).

This means the YAML Specification for ÍST {{spec_id}} can be copied and redistributed in any medium or format for any purpose, even commercially; when shared, appropriate credit must be given, a link to the license must be provided, and any changes made must be indicated. One may do this in any reasonable manner, however it must not be suggested that the licensor had endorsed it. Additionally, if you remix, transform, or build upon the specification, you may not distribute the modified specification.

The Technical Committee's participants have made every effort to ensure the reliability and accuracy of the technical and non-technical content of ÍST {{spec_id}}, but this does not guarantee its correctness, explicitly or implicitly. Users of ÍST {{spec_id}} should be aware that neither the TN-FMÞ nor ÍST can be held liable for damages or losses of any kind which may arise from its application. Users of ÍST {{spec_id}} do so on their own responsibility and at their own risk.
<!-- ForewordEnd -->

# Introduction {.unnumbered}

<!-- IntroductionStart -->
This Technical Specification (TS) presents version 3.0 of the Icelandic Online Banking Services (IOBWS) for {{context_short}}.

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the OASIS SOAP standards which were current at the time to define common web service interfaces for the Icelandic commercial and savings banks. This enabled software vendors, enterprises, and service providers to integrate their accounting, payment, and information systems with the bank's services, allowing them to act on behalf of the customers and with full access to their data.
<!-- IntroductionEnd -->

Iceland, with its homogeneous financial infrastructure based on Reiknistofa bankanna (RB) as a central service hub, has enjoyed real-time gross settlements and instant credit transfers nationwide since 1987. Other universally accepted services include the common collection solution (Kröfupotturinn) for issuing and paying claims, as well as topping up credit cards, or A/B Giro. All this functionality has been available through IOBWS v1 and v2, which is comparable to the functionality enjoyed by users of the online banking Web user interfaces.

When initiating work on the previous versions, the participants in the TN-FMÞ reviewed existing and emerging specifications in the global and European financial industries. At the time, none were deemed a good fit for local adaptation; they reflected the inherent legacy in inter-bank communications outside of Iceland. This was true even in the case of the other Nordic countries. Therefore, v1 and v2 of IOBWS were somewhat specific to the current functionality available in the underlying RB systems.

Meanwhile, Europe and the broader market has been catching up and the Icelandic banks have migrated to new core banking systems; along with the Central Bank of Iceland, they have implemented new clearing and settlement mechanisms (CSM). One of the goals of IOBWS v3, set forward by TN-FMÞ, was to move closer to the standards used by systems such as ISO 20022 [@ISO20022], at least through the application of a comparable dictionary and data elements.

<!-- Start1 -->
The Open Banking regulation in the UK along with the PSD2 regulation issued by the European Parliament, has triggered initiatives to standardize access to payment functionality and account information on behalf of customers by third parties. One such effort, the NextGenPSD2 Framework developed by the Berlin Group [@NextGenPSD2], has been broadly accepted in the EEA. The data model references ISO 20022 [@ISO20022] and is close enough to the direction of the Icelandic market to make it suitable as the new base for the IOBWS, instead of maintaining an independent linage of API specifications.

Another goal of the IOBWS version 3.0 charter, which was set forth by TN-FMÞ and achieved by adopting the NextGenPSD2 Framework, is the transition from SOAP to a REST-like API, which is defined by a recent iteration of the [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md) [@OpenAPISpecification]. Along with support for modern authentication and authorization standards, this should address some of the perceived complexity in adapting IOBWS to various use cases, platforms, and programming languages that have come to the forefront after the release of the previous IOBWS versions.
<!-- End1 -->

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the Icelandic Online Banking Web Services (IOBWS) framework of specifications.
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist which address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST WA-316. As the consumption and implementation of each part of IOBWS are optional, the documents aim to be independent of each other.

However, due to the origin of the underlying OpenAPI specification in the Berlin Group NextGenPSD2 Framework, ÍST TS-310 on Domestic Payments and Deposits and ÍST TS-313 on Foreign Payments overlap quite significantly. Both are based on the
"[IOBWS3.0.yaml](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/IOBWS3.0.yaml)" 
definition document and share schema type and API service definitions. They will still be treated as separate entities, but stakeholders are advised to reference the other document if more context is required.

The focus in ÍST {{spec_id}} is the following: the domestic adaptations to the relevant parts of the NextGenPSD2 framework; as well as the information needed to tie that to earlier IOBWS versions or other such implementations, including the Core Banking systems involved.

The intended audience for the specification document ÍST {{spec_id}} is those who are implementing banking services and systems that will consume them as API clients. The reader is expected to have a basic understanding of the Icelandic financial products involved. Further documentation on business aspects of those products will be available from each bank, as they may involve service agreements and the end customers' contractual preferences and benefits.
<!-- ScopePaymentsDocsContextEnd -->

Out of necessity, the previous IOBWS technical specifications largely consisted of expressing the intent and actual content in a human-readable format, otherwise found in the associated XML Schema and SOAP definitions.
The expectation for ÍST {{spec_id}} is that the technical service definitions and JSON data schemas in the accompanying OpenAPI specification can be understood using utilities that can convert them into documentation or navigatable user interfaces.

<!-- ScopeEndNoteStart -->
Consequently, the ÍST {{spec_id}} specification avoids the unnecessary repetition of information found in the technical contract [IOBWS3.0.yaml](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/IOBWS3.0.yaml). Instead, the rest of the document focuses on the information needed to understand the domestic context of services, schema types and service flows in relation to the NextGenPSD2 framework, as well as what constitutes the common core required to implement ÍST {{spec_id}}.
<!-- ScopeEndNoteEnd -->

# Normative references, definitions and data elements 

<!-- TerminalogyStart -->
## Normative references

The following documents are referenced in ÍST {{spec_id}}, as part of their content constitutes the requirements of this document. If newer editions exist, only the edition cited applies.

ISO 13616-1:2020. *Financial services - International bank account number (IBAN). Part 1: Structure of the IBAN.*

ISO 20022. *Financial services - universal financial industry message scheme*.

NextGenPSD2 v1.3.8. *The Berlin Group NextGenPSD2 Access to Account Framework*.

OpenAPI v3.0.1. The OpenAPI Specification (OAS) by the OpenAPI Initiative, a Linux Foundation Collaborative Project.


## Terms and definitions
-   **Berlin Group** is a pan-European payments interoperability standards and harmonization initiative with the primary objective of defining open and common scheme- and processor-independent standards in the interbanking domain between Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the work carried out by e.g. the European Payments Council. As such, the Berlin Group has been established as a purely technical standardization body, focusing on detailed technical and organizational requirements to achieve this primary objective. 
- **Clearing and Settlement Mechanisms** (**CMS**) refers to the processes or systems used in the exchange between two payment service providers. In Iceland, the Central Bank acts as the interbank mediator in this scope.
- **Core Banking Systems** (**CBS**) is the umbrella term for those systems handling payments and transaction accounts in relation to this specification.
- **Electronic IDentification, Authentication and trust Services** (**eIDAS**) refers to regulation 910/2014 [@EU910/2014], which replaced previous directive 1999/93/EC. It was introduced to Iceland law through act no. 2019/55 [@IS2019/55].
- **ISO 20022** is an ISO standard [@ISO20022] for electronic data interchange between financial institutions.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland.
- **Kröfupotturinn** (often identified as **IK**) is the domestic billing and claim system supported by all current financial institutions in Iceland. Through the system, claims can be issued against any *kennitala*, and the functionality is similar to the intended *request-to-pay* system in Europe, though services in IK extend beyond that scope.
-   **NextGenPSD2 Access to Accounts Framework** (**NextGenPSD2 Framework** or just **NextGenPSD2**) is the framework established by *the Berlin Group* to define a common PSD2 compliance interface [@NextGenPSD2]. Since then, parts of the framework have extended beyond compliance and into other Open Banking aspects.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.

## Payment service directive terms

As the ÍST {{spec_id}} owes much of its core to the NextGenPSD2 framework, the terms found in the OpenAPI specification and this document may reflect that background. Some of the main definitions are included here for context.  

- **Payment Services Directive 2** (**PSD2**) was instituted by the European Parliament as EU 2015/2366 [@EU2015/2366] and meant to further open up payment services on the internal EEA market. It was introduced to Iceland law through act no. 2021/114 [@IS2021/114]. PSD2 contains regulations of new services to be operated by so-called Third-Party Payment Service Providers on behalf of a Payment Service User, by leveraging Strong Customer Authentication. Due to the lineage connecting PSD2 with IOBWS v3.0, the main terms are described:
  - **Account Information Service Provider** (**AISP**) are *TPPs* with permission to connect to a transaction account and use the information to provide a **Account Information Services** (**AIS**) as defined in article 67 of EU 2015/2366 [@EU2015/2366].
  - **Confirmation of the Availability of Funds Service** is used by Payment Instrument Issuing Service Provider (PIISP) TPP as defined by article 65 of EU 2015/2366 [@EU2015/2366].
  - **Payment Initiation Service Provider** (**PISP**) can, given customers' consent, initiate payments and transactions on their behalf from their bank account, thereby providing **Payment Initiation Service** (**PIS**) as defined by article 66 of EU 2015/2366 [@EU2015/2366].
-   **Payment Service User** (**PSU**) is the end-user of payment services and customer of the bank in the IOBWS context.
-   **Strong Customer Authentication** (**SCA**), in the scope of PSD2, refers to an authentication mechanism based on the use of two or more elements that are independent; a breach of one does not compromise the others. The recognized elements or factors can be based on:
    1) Knowledge: something only the user knows, e.g. a password.
    1) Possession: something only the user possesses, e.g. a particular cell phone and number.
    1) Inherence: something the user is or has, e.g. a fingerprint or iris pattern.
-   **Third Party Provider** (**TPP**) refers in the scope of PSD2 to the party that uses the API to initiate operations or request information on behalf of the end-customer (PSU).

## Data elements {#sec:claim_identifier}

**The International Bank Account Number** (**IBAN**) format for Icelandic accounts should follow the specification set forth in ISO 13616-1:2020 [@ISO13616-1] as shown in [Table @tbl:ice_iban] below. 
Description of the implementation of the checksum calculation is outside the scope of this document but should be discernable from the ISO standard and examples available online.

  -----------------------------------------------------------------------------------------------
                Country   Check      National    Branch     Account    Account     Account    
                Code      Digits     Bank        ID         type       Number      Holder's    
                                     Code                                          Kennitala
  ------------- --------- ---------- ----------- ---------- ---------- ----------- --------------
  Description   IS        2 digits   2 digits    2 digits   2 digits   6 digits    10 digits  

  Example       IS        14         01          59         26         007654      5510730339 
  -----------------------------------------------------------------------------------------------
  :Icelandic IBAN with example. {#tbl:ice_iban}  

<!-- TerminalogyEnd -->
**The Unique Claim Identifier** references the ID of a claim based on the collection solution Kröfupotturinn. To initiate a payment to settle a claim, or relate transaction information about a previous payment, the claim ID should be formatted as a Basic Bank Account Number (BBAN). The method is shown below in [Table @tbl:ice_claim]. Claim Payments will therefore include BBAN, rather than IBAN, as a creditor account reference.

----------------------------------------------------------------------------------------------------
              Claimant      National    Branch     Fixed      Account     Delimiter   Due    
              Id            Bank        ID         Ledger     Number                  Date    
              (kennitala)   Code                   Id                                 
------------- ------------- ----------- ---------- ---------- ----------- ----------- --------------
Description   10 digits     2 digits    2 digits   2 digits   6 digits    Plus sign   DDMMYY  

Example       5510730339    01          59         66         007654      +           311220 
----------------------------------------------------------------------------------------------------
:Claim key transformed to BBAN with example. {#tbl:ice_claim} 

\newpage

# Implementation

## Service Overview

<!-- PaymentSvcOverviewStart -->
When TN-FMÞ-VH-1 on Business Requirements and TN-FMÞ-VH-2 on Technical Requirements decided to adopt the NextGenPSD2 framework, the intent was to stay as true to the original specification as possible. 

However, as with other European adaptations of NextGenPSD2 for domestic use, additional functionality was needed to support payment operations and account information expected by the Icelandic market. The original workgroup did this by extending existing schema types in the NextGenPSD2 OpenAPI contract, while removing elements and services not directly applicable to IOBWS. The intention was to streamline the specification, but developers with previous exposure to NextGenPSD2 found it challenging to understand the implications of the changes. Furthermore, the overall implementation details remained opaque for those migrating from earlier IOBWS versions, so more transparency was needed.

Therefore, workgroup TN-FMÞ-VH-8 was charged with revising the 3.0 version of IOBWS. The group tried to address two primary concerns: Clarify how the {{context_short}} products fit into NextGenPSD2, and simplify comparison against later releases by the Berlin Group. Additionally, the result should make it straightforward to adapt future updates and consider replacing current domestic adaptations in the IOBWS with newer NextGenPSD2 data elements.

The decision by the TN-FMÞ-VH-8 was to keep most of the original NextGenPSD2 OpenAPI definition intact, including those services and types that are not currently applicable to the Icelandic context or intended uses of the IOBWS. The {{context_short}} products (see [section @sec:pis_overview] and [Table @tbl:tbl_pis_products] below) are defined separately with applicable JSON schema types, leaving the original, e.g. SEPA message types, intact. They share the generic data elements and the 'native' payment types, reusing the services and operations for payments that are at the core of the NextGenPSD2 specification.

The [Table @tbl:tbl_svcsupport] below lists the implications for the OpenAPI YAML contract. It contains the Consents and Signing Basket services, as removing or commenting those out would have impacted the contract structure. They will not be implemented as part of this specification.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Payment Initiation Service (PIS)**        | Supported by all implementors of {{spec_id}}, in accordance with the specification (see later notes on Periodic Payments).      |
| **Account Information Service (AIS)**       | Supported by all implementors of {{spec_id}}, in accordance with the specification. |
| **Confirmation of Funds Service (PIIS)**    | Supported by all implementors of {{spec_id}}, in accordance with the specification. |
| **Consent Service**                         | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
| **Signing Baskets Service (SBS)**           | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
:Service support in ÍST {{spec_id}}. {#tbl:tbl_svcsupport}  

<!-- PaymentSvcOverviewEnd -->

## Payment Initiation Service

### Overview {#sec:pis_overview}

The {{context_short}} products supported by ÍST {{spec_id}} are shown in [Table @tbl:tbl_pis_products] below. They are defined as JSON objects. Other payment types are not supported by the specification.

The only available payment type in Iceland for an account-to-account transfer between domestic banks is usually classified as an instant credit transfer. The term 'instant' does not preclude additional business rules from applying within each bank: e.g. future payments, high-value payment processing, or variations in the payment lifecycle within e.g. the 'end-of-business-day' window. This could result in consumers of the IOBWS ÍST {{spec_id}} services being exposed to intermediary transaction status codes during steps in the payment execution, some of which have not previously been visible or mapped in IOBWS return codes. Future changes in Core Banking Services and Clearing and Settlement Mechanisms might also affect statuses returned to consumers. 
All of the available status codes in the specification can be expected as return values.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Credit Transfers**     | Credit transfer of an amount between two accounts, within the same bank or between two domestic banks.                         |
| **Claim Payments**       | Make a withdrawal from an account to pay a claim (e.g. a bill). The claim can be created in any domestic bank. |
| **Payment Card Deposits** | Make a withdrawal from an account to pay onto the account behind a payment card, within the same bank or between two domestic banks.  |
:Domestic payment products. {#tbl:tbl_pis_products}

For each of the payment products, the support for payment services is shown in [Table @tbl:pay_avail_svc]. A periodic payment is distinct from future-dating a payment, which is part of creating a payment, similar to previous versions of IOBWS (see requestedExecutionDate). At this time, behavior for periodic payments is not supported by the ÍST {{spec_id}}.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **payments**             | Supported by all implementors of {{spec_id}}, in accordance with the specification, for all domestic payment products.                         |
| **bulk-payments**        | Supported by all implementors of {{spec_id}} in accordance with the specification, for all payment products. |
| **periodic-payments**    | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract. |
:Payment services available. {#tbl:pay_avail_svc}

### Domestic Payment Product Data Elements 

The elements listed in [Table @tbl:tbl_data_domestic] are used in the domestic payment products within the scope of ÍST {{spec_id}}. The schema type *paymentInitiationDomestic_json* should be used to define JSON data instances.

  --------------------------------------------------------------------------------------
  **Data Element**                         **Credit         **Claim      **Credit Card
                                           Transfers**      Payments**   Deposits**
  ---------------------------------------- ---------------- ------------ ---------------
  **endToEndIdentification**               Optional         Optional     Optional

  **instructionIdentification**            Optional         Optional     Optional

  **debtorAccount**                        Mandatory        Mandatory    Mandatory

  **debtorId**                             Optional         Optional     Optional

  **chargesAccount**                       N/A              N/A          N/A

  **ultimateDebtor**                       Optional         Optional     Optional

  **ultimateDebtorId**                     Optional         Optional     Optional

  **instructedAmount**                     Mandatory        Mandatory    Mandatory

  **creditorAccount**                      Mandatory        Mandatory    Mandatory

  **creditorAgent**                        N/A              N/A          N/A

  **creditorAgentAddress**                 N/A              N/A          N/A

  **creditorName**                         N/A              N/A          N/A

  **creditorId**                           Optional         Optional     Optional

  **creditorAddress**                      N/A              N/A          N/A

  **ultimateCreditor**                     Optional         Optional     Optional

  **ultimateCreditorId**                   Optional         Optional     Optional                         

  **icelandicPurposeCode**                 Optional         Optional     Optional

  **chargeBearer**                         N/A              N/A          N/A

  **remittanceInformationUnstructured**    Optional         Optional     Optional

  **remittanceInformationStructured**      Optional         Optional     Optional

  **requestedExecutionDate**               Optional         Optional     Optional

  **partialPayment**                       N/A              Mandatory    N/A

  **serviceLevel**                         N/A              N/A          N/A

  **centralBankPurposeCode**               N/A              N/A          N/A
  --------------------------------------------------------------------------------------
  :Data elements for domestic payments. {#tbl:tbl_data_domestic}

To elaborate on the use of particular attributes, [Table @tbl:proper_domestic] contains additional information on top of the schema definitions. Notes on individual data elements or usage patterns follow in the subsections. 

  -------------------------------------------------------------------------------------------
  Field                                   Description
  --------------------------------------- ---------------------------------------------------
  **endToEndIdentification**              Intended for ID, short message or description that
                                          will be communicated to the creditor,
                                          across different banks. It replaces the 
                                          **BillNumber**
                                          or bill number field in previous IOBWS versions 
                                          (ic. *seðilnúmer*, TNUM_I/TNUM_U). While
                                          supporting 35 characters, only the first 7
                                          can reliably flow between all possible CB systems,
                                          reports, and even client systems, due to legacy 
                                          expectations and implementations.
                                          
  **instructionIdentification**           Unique identification, assigned by the debtor
                                          to unambiguously identify the instruction and
                                          to be communicated for correlation 
                                          in payment status information, though not
                                          available in later transaction details. This
                                          field plays a similar role to 
                                          **BookingID** in earlier IOBWS versions.
                                        
  **debtorAccount**                       The account that money is being
                                          transferred from.

  **debtorId**                            For the domestic payment products, this element
                                          should contain the kennitala of the debtor 
                                          (owner of the debtorAccount).

  **ultimateDebtor**                      Identifies the party that owes the
                                          cash to the creditor, e.g. as a result of receipt
                                          of goods or services. Used in cases where it 
                                          is different from the debtor/payor.

  **ultimateDebtorId**                    Identifies the party that owes the
                                          cash to the Creditor as a result of receipt of
                                          goods or services. Ultimate debtor kennitala is 
                                          included when different from the debtor Id.

  **instructedAmount**                    Amount and currency to be transferred.

  **creditorAccount**                     The account used to transfer 
                                          money to Beneficiary's account. In the case of a
                                          claim payment, this would be contain the claim key
                                          represented as a BBAN number.

  **creditorId**                          Used for the kennitala of the creditor, whose 
                                          account is credited with the payment. As the
                                          kennitala is part of the Icelandic IBAN, and
                                          BBAN numbers, this is an optional field. 

  **creditorName**                        This is optional and ignored when 
                                          kennitala is part of the Icelandic IBAN 
                                          and BBAN numbers, or provided in creditorId. 

  **creditorAddress**                     Not needed in domestic
                                          payments where kennitala can be used as lookup 
                                          key through the National Registry.

  **ultimateCreditor**                    The creditor (for example a finance company or an
                                          intermediary in a business transaction) may be
                                          different from the ultimate creditor. The debtor
                                          can enter who the final/real beneficiary of the
                                          payment is. In the case of Payment Card Deposit
                                          using masked PAN, ultimate Creditor contains
                                          the owner of the card.

  **ultimateCreditorId**                  Contains the kennitala of the intended beneficiary of
                                          the payment. Contains kennitala of the card owner when 
                                          payment Card Deposits use 
                                          masked PAN.

  **icelandicPurposeCode**                Equivalent to the category code (ic. *textalykill*) 
                                          used to classify the transaction. Restricted to codes 
                                          available in each originating bank.

  **remittanceInformationStructured**     The debtor's information about the payment. An array 
                                          of remittance elements but currently only used for the 
                                          equivalent of the IOBWS 2.0 **Out.Reference** (ic. 
                                          *tilvísun*). This single array element must be of type 
                                          'TILV_U'. Previously the equivalent data element was 
                                          mainly used for the kennitala of the creditor, now a 
                                          separate parameter. However, it can convey other 
                                          information, so it is included.

  **remittanceInformationUnstructured**   Used for payment description visible for both parties. 
                                          Only 16 characters can reliably flow between all systems, 
                                          even if the field accepts 140 characters. Replaces 
                                          **Description** in previous IOBWS SOAP schema.

  **requestedExecutionDate**              Execution date if in the future, fully equivalent to the 
                                          IOBWS v2.0 **requestedExecutionDate** for future payments
                                          (ic. *framvirk greiðsla*).

  **partialPayment**                      Applies to Claim Payments when the debtor 
                                          intends to only pay part of the amount owed
                                          toward an existing claim. The claim needs
                                          to allow partial payment, otherwise an 
                                          error occurs. 
  ------------------------------------------------------------------------------------------
  :Detailed description of ÍST {{spec_id}} payments properties. {#tbl:proper_domestic}

The remittanceInformationStructured mentioned in [Table @tbl:proper_domestic] is currently used to carry the debtor's payment reference. For identification, the **type** is set to TILV_U, which clearly identifies this information.

``` {.json caption="Example of the *remittanceInformationStructured* data element."}
 remittanceInformationStructured: [
   {
    reference: "Maximum 16 chars"
    type: "TILV_U"
  }
 ]
```

## Bulk Payments

Bulk payments are supported for all ÍST {{spec_id}} payment types. For a bulk payment, all collected payments shall be based on the same payment product, consistent with the approach of the NextGenPSD2 framework. The *bulkPaymentInitiationDomestic_json* schema type should be used for the top-level bulk initiation, according to ÍST {{spec_id}} and the *paymentInitiationBulkElementDomestic_json* type for the child payments contained in an array on the parent.

The domestic bulk types allow for specifying separate debtor accounts on child payment elements when *batchBookingPreferred* is false on the parent and the *debtorAccount* is not included on the bulk initiation top element. When the *batchBookingPreferred* element is set to true, the *debtorAccount* must either be omitted on the child payments or set to the exact same account as on the *bulkPaymentInitiationDomestic_json* instance, or an error will be returned.

  ----------------------------------------------------------------------------------------------
  **Data Element**            **Type**      **Condition**   **Description**
  --------------------------- ------------- --------------- ------------------------------------
  **batchBookingPreferred**   Boolean       Optional        When the element is included 
                                                            and set to true, the
                                                            debtor prefers only one booking
                                                            entry and debtorAccount must
                                                            be included.
                                                            If this element equals
                                                            false, or is not included,
                                                            the debtor prefers
                                                            individual booking of payments.

  **debtorAccount**           Account       Optional        Should only be set when
                              Reference                     batchBookingPreferred is true.

  **paymentInformationId**    Max35Text     Optional        Unique identification assigned 
                                                            by the sending party to
                                                            unambiguously identify this bulk. 
                                                            Replaces **NameOfBatch**
                                                            in IOBWS 1.0 and 2.0, as well as
                                                            **PaymentsID** that was generated
                                                            by the receiving bank.
                                                            Note: This attribute might be
                                                            considered mandatory in future
                                                            versions of the specification.

  **requestedExecutionDate**  ISODate       Optional        Determines if the payments
                                                            contained in the bulk will be
                                                            executed at the given, later date.

  **payments**                Bulk Entry    Mandatory       The Bulk Entry is a JSON Type,
                                                            which mirrors the supported
                                                            domestic payment products for
                                                            single payments, excluding the
                                                            data element 
                                                            requestedExecutionDate. 
                                                            DebtorAccount should be
                                                            excluded if batch booking is 
                                                            preferred, but it is 
                                                            mandatory if
                                                            either batchBookingPreferred is 
                                                            'false' or the element missing. 

  **chargesAccount**          Account       N/A             Not applicable to domestic bulks.
                              Reference                     
  ----------------------------------------------------------------------------------------------
  :Description of domestic bulk payment main body. {#tbl:bulk_domestic}


## Payment Bulk Errors

<!-- ErrorHandlingStart -->
The NextGenPSD2 framework [@NextGenPSD2] has a structured approach to messages that convey information related to specific HTTP return codes. These should be largely transparent to consumers of ÍST {{spec_id}} services implementations. The domestic adaptation, however, defines comparable message properties on the status response for bulk payment data elements in *bulkPaymentInitiationElementDomesticWithStatus*.
<!-- ErrorHandlingEnd -->
The [listing in @lst:bulk_response] shows an example of such a response.

<!-- paymentInitiationDomesticBody_bulk-payments_with_status_json -->
```{.json caption="Example of bulk status response with errors on sub-elements." #lst:bulk_response}
!include`startLine=15038, endLine=15103, dedent=7` "Deliverables/IOBWS3.0.yaml"
```

# Accounts Service

Account transaction information retrieval strongly resembles the previous versions of IOBWS, although it is adapted from the Berlin Group NextGenPSD2 framework.

When querying information about domestic accounts, there is an option to request information on the allowed credit limit (*withCreditLimitQuery* data element). This matches what Icelandic banks offer as "yfirdráttarheimild", which refers to an applied overdraft limit. The returned data element is named *creditLimit*, to avoid confusion with the simply-named "Overdraft" used in previous IOBWS versions.

<!-- balancesDomesticExample6_RegularAccount -->
```{.json caption="Example of information about an account with credit limit" #lst:accexample6}
!include`startLine=14685, endLine=14701, dedent=7` "Deliverables/IOBWS3.0.yaml"
```

The definition of the transaction details returned as a list includes elements that are applicable to the broad range of use cases covered by the NextGenPSD2. [Table @tbl:transaction_domestic] has descriptions for the elements that are applicable to the domestic context which might need further explanation.
<!-- AccountsOverviewBegin -->

  ----------------------------------------------------------------------------------------
  **Field**                               **Rule**   **Description**
  --------------------------------------- ---------- -------------------------------------
  **transactionId**                       Mandatory  Unique identifier for this record.

  **entryReference**                      Mandatory  Payment Correlation ID.

  **endToEndId**                          Optional   Short description.

  **currencyExchange**                    Optional   Returned when the transaction
                                                     relates to any currency exchange.

  **bookingDate**                         Optional   The date when the entry was booked.

  **valueDate**                           Mandatory  The date at which assets became
                                                     available.

  **transactionAmount**                   Mandatory  Amount and currency of this record.

  **creditorId**                          Optional   Creditor ID or kennitala.

  **creditorName**                        Optional   Creditor name.

  **creditorAccount**                     Optional   Creditor account.

  **creditorAgent**                       Optional   The Business Identifier Code 
                                                     of the financial 
                                                     institution (BICFI), or
                                                     other organization identification.

  **ultimateCreditor**                    Optional   Ultimate creditor.

  **debtorName**                          Optional   Debtor name.

  **debtorAccount**                       Optional   Debtor account.

  **debtorAgent**                         Optional   The BICFI, Business Identifier Code 
                                                     of the financial institution.

  **ultimateDebtor**                      Optional   Ultimate debtor.

  **remittanceInformationUnstructured**   Optional   Payment description visible for 
                                                     both parties. 

  **remittanceInformationStructured**     Optional   Array of remittance, though only
                                                     used currently for the 16 character
                                                     debtor reference.

  **additionalInformation**               Optional   Additional transaction-related
                                                     information.

  **purposeCode**                         N/A        Not returned, as these codes
                                                     have currently not been adapted 
                                                     to the uses
                                                     that the Icelandic purpose code
                                                     covers. Future Core Banking 
                                                     or Clearing changes might
                                                     affect this.

  **bankTransactionCode**                 N/A        Not currently used for similar 
                                                     reasons to purposeCode.

  **proprietaryBankTransactionCode**      N/A        Not currently used for similar 
                                                      reasons to purposeCode and 
                                                      bankTransactionCode.

  **balanceAfterTransaction**             Optional   Balance after the transaction has
                                                     been performed.

  **\_links**                             Optional   Link to transaction details.

  **transactionTimestamp**                Mandatory  Execution datetime of the record.

  **ultimateCreditorId**                  Optional   Ultimate creditor kennitala,
                                                     as applicable.

  **debtorId**                            Optional   Debtor kennitala.

  **ultimateDebtorId**                    Optional   Ultimate debtor kennitala.

  **icelandicPurpose**                    Optional   Returns the text codes used as simple 
                                                     transaction
                                                     categorization (ic. *textalykill*),
                                                     with description.
  ----------------------------------------------------------------------------------------
  :Description of transaction details. {#tbl:transaction_domestic}

<!-- AccountsOverviewEnd -->

An example of how this would look for a domestic account is provided in [listing @lst:transexample]. For other examples please refer to the IOBWS YAML schema.

<!-- transactionsExampleDomestic4_RegularAccount_json -->
``` {.json caption="Example result of a transaction detail query." #lst:transexample}
!include`startLine=14726, endLine=14759, dedent=7` "Deliverables/IOBWS3.0.yaml"
```

# Confirmation of Funds

This service offers functionality to check if funds up to a certain amount are available on a payment account. This can be useful before initiating a payment or account transfer with associated processing overhead.

  ----------------------------------------------------------------------------------------
  **Field**                               **Rule**   **Description**
  --------------------------------------- ---------- -------------------------------------
  **account**                             Mandatory  The account number of the creditor.

  **instructedAmount**                    Mandatory  Transaction amount to be checked, as
                                                     determined to be available by the 
                                                     applicable business rules.
  ----------------------------------------------------------------------------------------
  :Description of confirmation of funds payload. {#tbl:confirmationoffunds_domestic}

ÍST {{spec_id}} only supports the elements shown in [Table @tbl:confirmationoffunds_domestic] for confirmation of funds request and consequently applies only to payment accounts. Card accounts are currently not supported and are only included in the OpenAPI schema for compatibility with the source framework. Further business rules on what funds on an account are available might apply per financial institutions and depend on account types. An example of a request for confirmation of funds is shown below.

``` {.json caption="Example result of a confirmation of funds query."}
  {  
    "account": {"iban": "IS060537260002062306671449"},
    "instructedAmount": {"currency": "ISK", "amount": "1234"}
  }
```

The answer consists of a boolean value and is only valid at the particular point in time it is returned. A positive answer does not imply or include any reservation of said amount. 

``` {.json caption="Example result of a confirmation of funds response."}
  {
    "fundsAvailable": "true"
  }
```
# Payment processing flow 

![IOBWS authorization flow with confirmation](lib/media/authtflow1.eps){.calloutright #fig:auth_flow1 width="60%"}

<!-- PaymentsProcessingBegin -->

The NextGenPSD2 framework [@NextGenPSD2] includes a handful of authentication methods that can be combined into authorization flow, mostly geared toward intermediary service providers acting on behalf of end-users. ÍST {{spec_id}} has added an "IOBWS" method for confirming authorization and defining it as the only supported transaction flow when authorizing payments. It deviates from the previous IOBWS standards by separating payment initiation and authorization. This makes it possible for consumers of IOBWS version 3 to implement variations in their business logic through a two-step process: no payments created with an initiation request will be automatically authorized and processed without an explicit confirmation in a later step. The main scenarios supported are: e.g. an immediate authorization after initiation, which will be executed using straight-through processing (STP); as well as a variation of the decoupled flow where the authorization takes place in the UI of the mobile app or online banking Web interface offered by the bank.

To simplify API usage and distinguish the IOBWS approach from e.g. the NextGenPSD2 Decoupled transaction flow, ÍST {{spec_id}} considers the authorization resources associated with a payment initiation to be implicitly created at the time of the original initiation request. This means payments can be directly confirmed without an intermediary step to create an authorization resource, which would trigger straight-through processing for an initiated payment. ÍST {{spec_id}} does not include specific authorization for cancelling payments.

In decoupled IOBWS scenarios, payments would be available for confirmation in the appropriate user interface immediately after initiation. This matches the decoupled SCA method in the NextGenPSD2 framework, but without having to explicitly create the authorization resources. The end result also closely aligns with how most banks handle similar cases in support of earlier IOBWS versions.

[Figure @fig:auth_flow1] shows an example of an accounting system using the IOBWS flow. The system would use OAuth 2.0 Client Credentials Grant Flow and authenticate itself over the transport using mutual TLS (mTLS) with an eIDAS compliant certificate, identifying the legal entity or person the system is representing. Certificates issued by Auðkenni ehf. under the "Traustur búnaður" intermediary issuing certificate are supported by all IOBWS service providers.

The first initiation would receive a response in line with the one below, with the header ASPSP-SCA-Approach containing the method "IOBWS".


<!-- PaymentsProcessingEnd -->

``` {.json caption="Example of a response containing a link to the confirmation resource."}    
  { 
    "transactionStatus": "RCVD",
    "paymentId": "1234-b2b-983",
    "_links": 
      {
        "self": {"href": "/v1/payments/claim-payments/1234-b2b-983"},
        "status": {"href": "/v1/payments/1234-b2b-983/status"},
        "scaStatus":": {"href": "/v1/payments/1234-b2b-983/authorisations/123auth456"},  
        "confirmIobwsStraightThroughProcessingAuthorisation": {"href": "/v1/payments/1234-b2b-983/authorisations/123auth456"}
      }
  }
```

Confirmation of the payment initiation is a PUT update to the authorization resource, using the "iobwsAuthorisationConfirmation" type. The confirmation message is an optional description that can potentially be used by service implementors for display in a UI available to users, e.g. for decoupled authorizations to communicate the method used to approve these payments.

``` {.json caption="Example of an IOBWS authorisation confirmation,"}    
  { 
    "confirmationMessage": "Confirmed by the automatic ERP system."
  }
```

The response to the confirmation is shown below:

``` {.json caption="Example of authorisation confirmation return."}    
  { 
    "scaStatus": "finalised",
    "_links":{
      "status":  {"href":"/v1/payments/claim-payments/1234-b2b-983/status"}
    }
  }
```

Optionally, the links provided can be used to check the status of payments, resulting in the response below. The transaction status "ACCC" stands for "AcceptedSettlementCompleted" in the case when both debtor and creditor accounts have been settled. As mentioned before, the full range of codes are available and could potentially apply.

``` {.json caption="Example of a payment status query response."}    
  {
  "transactionStatus": "ACCC"
  }
```

# Appendix

## Mapping from older implementations

The ISO 20022 data model uses different terms than the previous versions of IOBWS. The following sections contain a non-authoritative guide on mapping the older implementations to the new version of IOBWS.

### Payments

*Payments* is the IOBWS 2.0 bulk entity, containing the same child *Payment* data entities that can be used to issue individual payments.

  ---------------------------------------------------------------------------------------
  **Entity/Element**          **Equivalent data element**   **Comment**                  
  --------------------------- ----------------------------- -----------------------------
  RollbackOnError             *No equivalent.*              Bulks are executed as a whole
                                                            and not rolled back, but 
                                                            individual errors reported on
                                                            each payment in the results.

  IsOneToMany                 batchBookingPreferred         

  DateOfForwardPayment        requestedExecutionDate        

  NameOfBatch                 paymentInformationId          
  ---------------------------------------------------------------------------------------

### Payments Out

Encapsulates the debtor side of the payment transfer in the previous version, for a single payment
or child payments in a payment bulk.

  -----------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data element**       **Comment**
  -------------------- --------------------------------- ----------------------------
  Account              debtorAccount \> iban             The withdrawal should
                                                         reference the IBAN number of
                                                         the debtor account owner.

  AccountOwnerID       debtorId                          

  CategoryCode         icelandicPurposeCode              

  Reference            remittanceInformationStructured   

  BillNumber           endToEndIdentification            

  Receipt              *No equivalent.*                  

  SecurityCode         *No equivalent.*                  Strong authentication
                                                         replaces this as a security
                                                         mechanism.
  -----------------------------------------------------------------------------------

### Payments In

Encapsulates the credit side of the payment transfer.

  -----------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data element**         **Comment**
  -------------------- ----------------------------------- --------------------------
  ABGiro                                                   See [subsection
                                                           @sec:abgiro].

  CGiro                                                    See [subsection
                                                           @sec:cgiro].

  Claim                                                    See [subsection
                                                           @sec:claim].

  Transfer                                                 See [subsection
                                                           @sec:transfer].

  Amount               instructedAmount                    

  Receipt              *No equivalent*                     

  Description (sic)    remittanceInformationUnstructured   

  BookingID            instructionIdentification           
  -----------------------------------------------------------------------------------

### ABGiro {#sec:abgiro}

The *AB-Giro* data entity represented an AB-giro target in the previous version.

  ---------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data        **Comment**
                       element**                
  -------------------- ------------------------ -----------------------------------
  Account              creditorAccount \> bban  As in the older schemas, AB Giro is
                                                identified with a BBAN number.

  Reference            *No equivalent*          Usually used for debtorId, which
                                                is now a separate field.

  BillNumber           endToEndIdentification   

  CategoryCode         icelandicPurposeCode     
  ---------------------------------------------------------------------------------

### CGiro {#sec:cgiro}

The *C-Giro* data entity represented a C-giro target in the previous version.

  ---------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data        **Comment**
                       element**                
  -------------------- ------------------------ -----------------------------------
  Account              creditorAccount \> bban  As in the older schemas, C Giro is
                                                identified with a BBAN compliant
                                                number.

  AccountOwnerID       creditorId               

  BillNumber           endToEndIdentification   

  CategoryCode         icelandicPurposeCode     
  ---------------------------------------------------------------------------------

### Claim {#sec:claim}

The *Claim* data entity represented a request-to-pay instrument (ic. innheimtukröfu) in the previous version.

  ----------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data    **Comment**
                       element**            
  -------------------- -------------------- ----------------------------------------
  Account                                   See data element [Table @tbl:ice_claim].

  Claimant                                  See [Table @tbl:ice_claim].

  PayorID              ultimateCreditorId   The creditor could be
                                            another party than the *kröfugreiðandi*
                                            entity whose *kennitala* is sometimes
                                            used as part of the claim key.

  DueDate                                   See [Table @tbl:ice_claim].

  IsDeposit            partialPayment       
  ----------------------------------------------------------------------------------

### Bond {#sec:bond}

The *Bond* data entity represented a bond (ic. skuldabréf/víxill) in the previous version.

  -------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data    **Comment**
                       element**            
  -------------------- -------------------- -------------------------------------
  Account              creditorAccount \>   As in the older schemas, bonds are
                       bban                 identified with a BBAN compliant
                                            number.

  PayorID              ultimateCreditorId   The creditor could potentially be
                                            another party than the *kennitala*
                                            set as the payee of the bond.

  DueDate              *No equivalent.*     
  -------------------------------------------------------------------------------

### Transfer

The *Transfer* data entity represented the target for account-to-account transfers in the previous version.

  ---------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data        **Comment**
                       element**                
  -------------------- ------------------------ -----------------------------------
  Account              creditorAccount \> bban  The target account can be
                                                identified with a BBAN compliant
                                                number or full IBAN.

  AccountOwnerID       creditorId               

  CategoryCode         icelandicPurposeCode     

  Reference            *No equivalent*          Usually used for debtorId, which
                                                is now a separate field

  BillNumber           endToEndIdentification   
  ---------------------------------------------------------------------------------

## Domestic adaptations of the NextGenAPI framework

As mentioned, one of the guiding principles for ÍST {{spec_id}} was to make the specification for domestic payments and accounts easy to compare against the original Berlin Group NextGenPSD2 document, as well as future versions. However, the OpenAPI definition in the first iteration of version 3.0 involved cards and currencies, making the overall contract even more complex than the original. The base then referenced NextGenPSD2 version 1.3.6. Though it was desirable to upgrade to 1.3.8, it turned out to be a considerable task. To facilitate maintenance of the specification throughout minor version updates, as well as simplify implementations of IOBWS, the cards and currencies APIs were split into their own separate contracts, and the domestic adaptations were reworked on top of an intact version 1.3.6. This approach was validated by upgrading to NextGenPSD2 version 1.3.8 without undue difficulties.

To make it even easier to do, see the deltas in e.g. text comparison tools, localized version of the source NextGenPSD2 API specifications are located in the appropriate "Stuðningsefni/Berlin-group/v.1.3.8" folder. Alongside that document, an intermediary document was created with some of the most common and repeated adaptations. The relationship between these documents looks like the following, though the actual filenames are longer:

> psd2-api 1.3.8 <|-- psd2-api 1.3.8 localized <|-- IOBWS3.0.yaml

The 'localized' document makes comparison in the final IOBWS3.0.yaml more transparent. The following sections show the breakdown of *all adaptations* made for Icelandic payments and accounts:


### The localized file 

Changes between "psd2-api 1.3.8 2020-12-14v2.yaml" and "psd2-api 1.3.8 2020-12-14v2-localized.yaml" (see Stuðningsefni/Berlin-group/v.1.3.8).

  - Tag "Common Services" was removed completely, both the definition and all usage in Tags.
  - Tags on Consents services changed from "Account Information Service (AIS)" to "Consent Service".
  - "Signing Baskets (SBS)" Tag renamed to "Signing Baskets Service (SBS)".  

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
    - #/components/schemas/paymentInitiationDomestic_json - added  
    - #/components/schemas/periodicPaymentInitiationDomestic_json - added  
    - #/components/schemas/bulkPaymentInitiationDomestic_json - added

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
- icelandicPurposeCode
- centralBankPurposeCode
- bicfiOrIdentification

*Request bodies added for Domestic objects:*

- paymentInitiationDomestic_json
- periodicPaymentInitiationDomestic_json
- bulkPaymentInitiationDomestic_json
- paymentInitiationBulkElementDomestic_json
- iobwsAuthorisationConfirmation
- paymentInitiationPaymentIdResponse-200_json
- 
*Response bodies added for Domestic objects:*

- paymentInitiationDomesticWithStatusResponse
- periodicPaymentInitiationDomesticWithStatusResponse
- bulkPaymentInitiationDomesticWithStatusResponse
- bulkPaymentInitiationElementDomesticError
- bulkPaymentInitiationElementDomesticWithStatus

*See YAML for various examples added to demonstrate use of Domestic objects.*

# Bibliography {.unnumbered}
\ 
\ 
