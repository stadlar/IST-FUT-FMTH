---
title: "ÍST TS 310:2022"
author: ICS 35.240
date: "Entry into force 25-03-2022"
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
classoption: twoside
numbersections: true
first-chapter: 1
listings: true
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
link-citations: true
bibliography: "lib/bibliography.yaml"
csl: "lib/iso690-numeric-en.csl"
fontsize: 9pt
titlefont: Arial.ttf
...

!include-header "Vinnusvæði/Verkþáttur 5/310media/participants.yaml"

\newpage

# Foreword {.unnumbered}
<!-- ForewordStart -->
This ÍST Technical Specification was developed in accordance with "ÍST Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.* IST rules on Technical Specifications, Technical Reports and Workshop Agreements). The TS (Technical specification) was prepared by the technical committee TN-FMÞ (The Technical Committee on Financial Services) that operates within FUT (Sector committee for ICT standardisation) following a public call for participation within TN-FMÞ. The final draft was sent to the TN-FMÞ on the {{finaldraft_date}} and approved by correspondence on the {{approve_date}}. The text of ÍST {{spec_id}} was submitted to IST for publication on {{publication_date}}.
 
The accompanying OpenAPI 3.0.1 definition "IOBWS3.0.yaml" located at [https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables](https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables), should be viewed as an integral part of ÍST {{spec_id}}. 

The document "{{fulldoc_name}}" is the source of this rendition, and versions of that document will be used for future errata and clarifications per the procedures to be laid out in the workshop agreement ÍST WA-316, IOBWS 3.0 Technical Guidelines. The  rules are outlined in the README.md accompanying the Github Git repository and are accepted by the participants in TN-FMÞ alongside this specification. These guidelines establish the workgroup TN-FMÞ-VH-7 as in charge of ongoing monitoring of submitted issues or pull requests made to the repository, which fall outside the permit of other regular workgroups. TN-FMÞ-VH-7 will evaluate if changes are ready to be accepted into the repository, and when or if, they warrant patches or minor releases to the specification. Versioning will adhere to the [Semantic Versioning](https://semver.org/spec/v2.0.0.html)[@semver2] scheme and each minor release will require a Workgroup agreement under the "ÍST reglur" referenced above.

{{funding_paragraph}}

ÍST {{spec_id}} is not subject to any patent rights. The underlying OpenAPI specification is derived from version 1.3.8 of the 
[Berlin Group's NextGenPSD2 Framework](https://www.berlin-group.org/nextgenpsd2-downloads)
, and therefore also distributed under a 
[Creative Commons Attribution 4.0 International Public License (CC BY)](https://creativecommons.org/licenses/by/4.0/#).

This means the YAML Specification for ÍST {{spec_id}} can be copied and redistributed in any medium or format for any purpose, even commercially, but when shared appropriate credit must be given, a link to the license must be provided, and an indication given if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use. In addition, if you remix, transform, or build upon the specification, you may not distribute the modified specification.

The Technical Committee's participants have made every effort to ensure the reliability and accuracy of the technical and non-technical content of ÍST {{spec_id}}, but this does not guarantee, either explicitly or implicitly, its correctness. Users of ÍST {{spec_id}} should be aware that neither the TN-FMÞ nor ÍST can be held liable for damages or losses of any kind whatsoever which may arise from its application. Users of ÍST {{spec_id}} do so on their own responsibility and at their own risk.
<!-- ForewordEnd -->

# Introduction {.unnumbered}

<!-- IntroductionStart -->
This Technical Specification (TS) presents version 3.0 of the Icelandic Online Banking Services (IOBWS), for {{context_short}}.

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the most recent OASIS SOAP standards at the time, to define common web service interfaces for the Icelandic commercial and savings banks. This enabled software vendors, enterprises and service providers to integrate their accounting, payment, and information systems with the bank's services, to act on behalf of the customers and with full access to their data.
<!-- IntroductionEnd -->

Iceland, with its homogeneous financial infrastructure based on the centralized Banks' Data Centre (Reiknistofa bankanna, or RB), has enjoyed real-time gross settlements and instant credit transfers nationwide since 1987. Other universally accepted services count the common collection solution (Kröfupotturinn) for issuing and paying claims, topping up credit cards, or A/B Giro. All this functionality has been available through IOBWS v1 and v2, comparable to the functionality enjoyed by users of the online banking Web UIs.

When initiating work on the previous versions, the participants in the TN-FMÞ reviewed existing and emerging specifications in the global or mostly European financial industry. None were deemed a good fit at the time for local adaptation, as they reflected inherent the legacy in inter-bank communications outside of Iceland, even in the case of the other Nordic countries. Therefore, v1 and v2 of IOBWS were somewhat specific to the current functionality available in the underlying RB systems.

Meanwhile, the broader market especially in Europe has been catching up and the Icelandic banks have migrated to new core banking systems and with the Central Bank of Iceland, implemented new clearing and settlement mechanisms (CSM). One of the goals of IOBWS v3, set forward by TN-FMÞ, was to move closer to the standards used by those systems such as ISO 20022 [@ISO20022], at least through the application of a comparable dictionary and data elements. 

<!-- Start1 -->
The Open Banking regulation in the UK and the PSD2 regulation issued by the European Parliament has triggered initiatives to standardize access to payment functionality and account information, on behalf of customers by third parties. One such effort, the NextGenPSD2 Framework developed by the Berlin Group [@NextGenPSD2], has met a broad acceptance in the EEA. The data model references ISO 20022 [@ISO20022] and is close enough to the direction of the Icelandic market to make it relatively straightforward to adapt it as the new base for the IOBWS, instead of continuing to maintain an independent linage of API specifications. 

Another goal of the IOBWS version 3 charter set forth by TN-FMÞ and achieved by adopting the NextGenPSD2 Framework is the transition from SOAP to a REST-like API defined by a recent iteration of the [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md) [@OpenAPISpecification]. Along with support for modern authentication and authorization standards, this should address some of the perceived complexity in adapting IOBWS to various use cases, platforms and programming languages that have come to the fore after the release of the previous IOBWS versions.
<!-- End1 -->

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the auspices of the Icelandic Online Banking Web Services (IOBWS).
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist that address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST WA-316. As the consumption and implementation of each part of IOBWS are optional, the documents aim to be independent of each other.

However, due to the origin of the underlying OpenAPI specification in the Berlin Group NextGenPSD2 Framework, ÍST TS-310 on Domestic Payments and Deposits, and ÍST TS-313 on Foreign Payments, overlap quite significantly. Both are based on the 
"[IOBWS3.0.yaml](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/IOBWS3.0.yaml)" 
definition document, and share schema type and API service definitions. They will still be treated as separate entities but stakeholders are advised to reference the other document if more context is required.

The approach in ÍST {{spec_id}} is to focus on the domestic adaptations to the relevant parts of the NextGenPSD2 framework, and the information needed to tie that to earlier IOBWS versions or other such implementations, and even the Core Banking systems involved. 

The intended audience for the specification document ÍST {{spec_id}} is the implementors of banking services as well as of those systems that will consume them as API clients. The reader is expected to have a basic understanding of the Icelandic financial products involved. Further documentation on business aspects of those products will be available from the banks in question as they can involve service agreements and the end customers' contractual preferences and benefits.
<!-- ScopePaymentsDocsContextEnd -->

The previous IOBWS technical specifications did out of necessity, largely consist of expressing the intent and actual content, otherwise found in the associated XML Schema and SOAP definitions, in a human-readable format. 
The expectation is that for ÍST {{spec_id}}, the technical service definitions and JSON data schemas in the accompanying OpenAPI specification can more readily be understood using one or more of the numerous utilities that can convert them into documentation or even navigatable UIs. 

<!-- ScopeEndNoteStart -->
Consequently, the ÍST {{spec_id}} specification avoids the unnecessary repetition of information found in the technical contract [IOBWS3.0.yaml](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/IOBWS3.0.yaml). Instead, the rest of the document focuses on the essential information needed to understand the domestic context of services, schema types and service flows in relation to the NextGenPSD2 framework, and what constitutes the common core required to implement ÍST {{spec_id}}.
<!-- ScopeEndNoteEnd -->

# Normative references, definitions and data elements 

<!-- TerminalogyStart -->
## Normative references

The following documents are referred to in ÍST {{spec_id}} as part of their content constitutes the requirements of this document. Only the edition cited applies if newer editions exist.  
  
ISO 13616-1:2020. *Financial services - International bank account number (IBAN). Part 1: Structure of the IBAN.*  
  
ISO 20022. *Financial services - universal financial industry message scheme*.  
  
NextGenPSD2 v1.3.8. *The Berlin Group NextGenPSD2 Access to Account Framework*.  

OpenAPI v3.0.1. The OpenAPI Specification (OAS) by the OpenAPI Initiative, a Linux Foundation Collaborative
Project.


## Terms and definitions
- **Berlin Group** is a pan-European payments interoperability standards and harmonisation initiative with the primary objective of defining open and common scheme- and processor-independent standards in the interbanking domain between Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the work carried out by e.g. the European Payments Council. As such, the Berlin Group has been established as a pure technical standardisation body, focusing on detailed technical and organisational requirements to achieve this primary objective.
- **Clearing and Settlement Mechanisms** (**CMS**) refers to the processes or systems used in the exchange between two payment service providers. In Iceland, the Central Bank acts as the interbank mediator in this scope.
- **Core Banking Systems** (**CBS**) is the umbrella term for those systems handling payments and transaction accounts in relation to this specification.
- **Electronic IDentification, Authentication and trust Services** (**eIDAS**) refers to regulation 910/2014 [@EU910/2014], which replaced previous directive 1999/93/EC. It was introduced to Iceland law through act no. 2019/55 [@IS2019/55].
- **ISO 20022** is an ISO standard [@ISO20022] for electronic data interchange between financial institutions.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland.
- **Kröfupotturinn** (often identified as **IK**) is the domestic billing and claim system supported by all current financial institutions in Iceland. Through the system, claims can be issued against any *kennitala*, and the functionality is similar to the intended *request-to-pay* system in Europe, though services in IK extend beyond that scope.
- **NextGenPSD2 Access to Accounts Framework** (**NextGenPSD2 Framework** or just **NextGenPSD2**) is the framework established by *the Berlin Group* to define a common PSD2 compliance interface [@NextGenPSD2]. Since then parts of the framework have extended beyond compliance, into other Open Banking aspects.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.

## Payment service directive terms

As the ÍST {{spec_id}} owes much of its core to the NextGenPSD2 framework, the terms found in the OpenAPI specification and this document may reflect that background. Some of the main definitions are included here for context.  

- **Payment Services Directive 2** (**PSD2**) was instituted by the European Parliament as EU 2015/2366 [@EU2015/2366] and meant to further open up payment services on the internal EEA market. It was introduced to Iceland law through act no. 2021/114 [@IS2021/114]. PSD2 contains regulations of new services to be operated by so-called Third-Party Payment Service Providers on behalf of a Payment Service User, by leveraging Strong Customer Authentication. Due to the linage connecting PSD2 with IOBWS v3.0, the main terms are described:
  - **Account Information Service Provider** (**AISP**) are *TPPs* with permission to connect to a transaction account and use the information to provide a **Account Information Services** (**AIS**) as defined in article 67 of EU 2015/2366 [@EU2015/2366].
  - **Confirmation of the Availability of Funds Service** to be used by Payment Instrument Issuing Service Provider (PIISP) TPP a defined by article 65 of EU 2015/2366 [@EU2015/2366].
  - **Payment Initiation Service Provider** (**PISP**) can, given customers consent, initiate payments and transactions on their behalf, from their bank account, thereby providing **Payment Initiation Service** (**PIS**) as defined by article 66 of EU 2015/2366 [@EU2015/2366].
  - **Payment Service User** (**PSU**). The end-user of payment services, and customer of the bank in the IOBWS context.
  - **Strong Customer Authentication** (**SCA**), refers in the scope of PSD2 to an authentication mechanism based on the use of two or more elements that are independent, so a breach of one does not compromise the others. The recognized elements or factors can be based on: 
    1) Knowledge, something only the user knows e.g. a password.
    1) Possession, something only the user possesses e.g. a particular cell phone and number.
    1) Inherence, something the user is or has e.g. a fingerprint or iris pattern.
  - **Third Party Provider** (**TPP**) is referenced in the OpenAPI specification reflecting the PSD2 background when the client system is initiating operations or requesting information on behalf of the end-consumer.

## Data elements {#sec:claim_identifier}

**The International Bank Account Number** (**IBAN**) format for Icelandic accounts should follow the specification set forth in ISO 13616-1:2020 [@ISO13616-1] as shown in the [table @tbl:ice_iban] below. 
Description of the implementation of the checksum calculation is outside the scope of this document but should be discernable from the ISO standard and examples available online.

  -----------------------------------------------------------------------------------------------
                Country   Check      National    Branch     Account    Account     Account    
                Code      Digits     Bank        ID         type       Number      Holders    
                                     Code                                          Kennitala
  ------------- --------- ---------- ----------- ---------- ---------- ----------- --------------
  Description   IS        2 digits   2 digits    2 digits   2 digits   6 digits    10 digits  

  Example       IS        14         01          59         26         007654      5510730339 
  -----------------------------------------------------------------------------------------------
  :Icelandic IBAN with example {#tbl:ice_iban}
<!-- TerminalogyEnd -->

**The Unique Claim Identifier** references the ID of a claim based on the collection solution Kröfupotturinn. To initiate a payment to settle a claim, or relate transaction information about a previous payment, the claim ID should be formatted as a BBAN, Basic Bank Account Number. The method is shown below in [table @tbl:ice_claim]. Claim Payments will therefore only include BBAN, not IBAN as a creditor account reference.

----------------------------------------------------------------------------------------------------
              Claimant      National    Branch     Fixed      Account     Delimiter   Due    
              Id            Bank        ID         ledger     Number                  Date    
              (kennitala)   Code                   Id                                 
------------- ------------- ----------- ---------- ---------- ----------- ----------- --------------
Description   10 digits     2 digits    2 digits   2 digits   6 digits    Plus sign   DDMMYY  

Example       5510730339    01          59         66         007654      +           311220 
----------------------------------------------------------------------------------------------------
:Claim key transformed to BBAN with example {#tbl:ice_claim}

\newpage

# Implementation

## Service Overview

<!-- PaymentSvcOverviewStart -->
When the decision was made by TN-FMÞ-VH-1 on Business Requirments and TN-FMÞ-VH-2 on Technical Requirements, to adopt the NextGenPSD2 framework the intant was to stay as true to the original specification as possible.

However, not unlike other European adaptations of NextGenPSD2 for domestic use additional functionality was needed to support payment operations and account information expected by the Icelandic market. The original workgroup did so by extending existing schema types in the NextGenPSD2 OpenAPI contract while removing elements and services not directly applicable to IOBWS. The intention was to streamline the specification but developers with previous exposure to NextGenPSD2 found it challenging to understand the implications of the changes. Furthermore, the overall implementation details still remained opaque for those migrating from earlier IOBWS versions so more transparancy was needed.

Workgroup TN-FMÞ-VH-8 was therefore charged with revising the 3.0 version of IOBWS. The group tried to address two primary concerns; Clarify how the {{context_short}} products fit into NextGenPSD2 as well as simplifying comparison against later releases by the Berlin Group. The result should additionally make it straightforward to adapt future updates and consider replacing current domestic adaptations in the IOBWS with newer NextGenPSD2 data elements.

The decision made by the TN-FMÞ-VH-8 was therefore to keep most of the original NextGenPSD2 OpenAPI definition intact, even those services and types that are not currently applicable to the Icelandic context or intended uses of the IOBWS. The {{context_short}} products (see [section @sec:pis_overview] and [table @tbl:tbl_pis_products] below) are defined separately with applicable JSON schema types, leaving the original e.g. SEPA message types intact. They share the generic data elements along with the 'native' payment types, reusing the services, and operations for payments that are at the core of the NextGenPSD2 specification.   

The [table @tbl:tbl_svcsupport] below list the implications for the OpenAPI YAML contract. It contains the Constents and Signing Basket services, as removing or commenting those out would have had a high impact on the contract structure. They will, however, not be implemented as part of this specification, though this does not preclude their use in other contexts. 

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Payment Initiation Service (PIS)**        | Supported by all implementors of {{spec_id}} in accordance with the specification (see later notes on Periodic Payments).      |
| **Account Information Service (AIS)**       | Supported by all implementors of {{spec_id}} in accordance with the specification. |
| **Confirmation of Funds Service (PIIS)**    | Supported by all implementors of {{spec_id}}, in accordance with the specification. |
| **Consent Service**                         | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
| **Signing Baskets Service (SBS)**           | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
:Service support in ÍST {{spec_id}}. {#tbl:tbl_svcsupport}  

<!-- PaymentSvcOverviewEnd -->

## Payment Initiation Service

### Overview {#sec:pis_overview}

The {{context_short}} products supported by ÍST {{spec_id}} are as shown in [table @tbl:tbl_pis_products] below. All those are defined as JSON objects, and other payment types are not supported by the specification.

Instant credit transfers are the only available type in Iceland for an account to account transfer between domestic banks. The reference to 'instant' does not preclude additional business rules applying for e.g. high-value payment processing within each bank, or variations in the payment lifecycle within e.g. the 'end-of-business-day' window. This could result in consumers of the IOBWS ÍST {{spec_id}} services being exposed to intermediary transaction status codes during steps in the payment execution, some of which have not previously been visible or mapped in IOBWS return codes. Later changes in Core Banking Services and Clearing and Settlement Mechanisms might also affect statuses returned so consumers, so all of the available by the specification should be expected.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Credit Transfers**     | Instant credit transfer of an amount between two accounts within the same bank or between two domestic banks.                         |
| **Claim Payments**       | Make a withdrawal from an account to pay a claim (e.g. a bill). The claim can be created in any domestic bank. |
| **Payment Card Deposits** | Make a withdrawal from an account to pay onto the account behind a payment card, within the same bank or between two domestic banks.  |
:Domestic payment products. {#tbl:tbl_pis_products}

For each of the payment products, the support for payment services is given in [table @tbl:pay_avail_svc]. Periodic payments are distinct from future dating a payment, which is supported in a similar manner to previous versions of IOBWS as part of creating a payment (see requestedExecutionDate). At this time, behaviour for periodic payments is not supported by the ÍST {{spec_id}}.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **payments**             | Supported by all implementors of {{spec_id}} in accordance with the specification, for all domestic payment products.                         |
| **bulk-payments**        | Supported by all implementors of {{spec_id}} in accordance with the specification, for all payment products. |
| **periodic-payments**    | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract. |
:Availability of payment service. {#tbl:pay_avail_svc}

### Domestic Payment Product Data Elements 

The elements listed in [table @tbl:tbl_data_domestic] are used in the domestic payment products under scope for ÍST {{spec_id}}. The schema type *paymentInitiationDomestic_json* should be used to define JSON data instances.

  --------------------------------------------------------------------------------------
  **Data Element**                         **Credit         **Claim      **Credit Card
                                           Transfers**       Payments**    Deposits**
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

  **partialPayment**                       N/A.             Mandatory    N/A.

  **serviceLevel**                         N/A              N/A          N/A

  **centralBankPurposeCode**               N/A              N/A          N/A
  --------------------------------------------------------------------------------------
  :Data elements for domestic payments. {#tbl:tbl_data_domestic}

To elaborate on the use of particular attributes the following [table @tbl:proper_domestic] contains additional information on top of the schema definitions. Notes on individual data elements or usage patterns follow in the subsections. 

  -------------------------------------------------------------------------------------------
  Field                                   Description
  --------------------------------------- ---------------------------------------------------
  **endToEndIdentification**              Intended for ID, short message or description that
                                          will be communicated to the creditor,
                                          across different banks. Is replaces the 
                                          **BillNumber**
                                          or bill number field in previous IOBWS version 
                                          (ic. *seðilnúmer*, TNUM_I/TNUM_U). While
                                          supporting 35 characters, only the first 7 chars
                                          can reliably flow between all possible CB systems,
                                          reports, and even client systems, due to legacy 
                                          expectations and implementations.
                                          
  **instructionIdentification**           Unique identification, assigned by the debtor
                                          to unambiguously identify the instruction and
                                          to be communicated for correlation 
                                          in payment status information, though not
                                          available in later transaction details. This
                                          field therefore plays a similar role to 
                                          **BookingID** in earlier IOBWS versions.
                                        
  **debtorAccount**                       Debtor account is the account money is being
                                          transfer from.

  **debtorId**                            For the domestic payment products, this element
                                          should contain the kennitala of the debtor,
                                          owner of the deptorAccount.

  **ultimateDebtor**                      Ultimate Debtor identifies the party that owes the
                                          cash to the creditor, e.g. as a result of receipt 
                                          of goods or services. Used in those cases where it
                                          is different from the debtor/payor.

  **ultimateDebtorId**                    Ultimate Debtor identifies the party that owes the
                                          cash to the Creditor as a result of receipt of
                                          goods or services. Ultimate debtor kennitala is 
                                          included when different from the debtor Id.

  **instructedAmount**                    Amount and currency to be transferred.

  **creditorAccount**                     Creditor account is the account used to transfer
                                          money to Beneficiary's account. In the case of a
                                          claim payment, this would be contain the claim key
                                          represented as a BBAN number.

  **creditorId**                          Used for the kennitala of the creditor, whose 
                                          account is credited with the payment. As the
                                          kennitala is part of the Icelandic IBAN, and
                                          BBAN numbers, this is an optional field. 

  **creditorName**                        The creditor name is optional and ignored when
                                          kennitala is part of the Icelandic IBAN, 
                                          and BBAN numbers, or provided in creditorId. 

  **creditorAddress**                     The creditor address is not needed in domestic
                                          payments where kennitala can be used as lookup 
                                          key through the National Registry.

  **ultimateCreditor**                    The creditor (for example a finance company or an
                                          intermediary in a business transaction), may be
                                          different from the ultimate creditor. The debtor
                                          can enter who the final/real beneficiary of the
                                          payment is. In the case of Payment Card Deposit
                                          using masked PAN, ultimate Creditor contains
                                          the owner of the card.

  **ultimateCreditorId**                  Contains the kennitala of the intended beneficiary of
                                          the payment. In the case of Payment Card Deposits using
                                          masked PAN the Ultimate Creditor ID contains kennitala
                                          of the card owner.

  **icelandicPurposeCode**                The purpose is the equivalent of the category code 
                                          (ic. *textalykill*) used to classify the transaction. 
                                          Restricted to codes available in each originating bank.

  **remittanceInformationStructured**     The debtors's information about the payment. An array 
                                          of remittance elements but currently only used for 
                                          the equivalent of the IOBWS 2.0 
                                          **Out.Reference** (ic. *tilvísun*). This single
                                          array element must be of type 'TILV_U'
                                          Previously the equivalent data element was
                                          mainly used for the kennitala of the creditor, now
                                          a separate parameter. It can however convey other 
                                          information and therefore included.

  **remittanceInformationUnStructured**   Is used for payment description visible for both parties. 
                                          Only 16 characters can currently be expected
                                          to reliably flow between all systems, even if the 
                                          field accepts 140 characters. Replaces **Description**
                                          in previous IOBWS SOAP schema.

  **requestedExecutionDate**              Execution date if in the future, fully equivalent to the 
                                          IOBWS v2.0 **requestedExecutionDate** for future payments
                                          (ic. *framvirk greiðsla*).

  **executionDate**                       Execution date if in the future, equivalent to the 
                                          IOBWS v2.0 **requestedExecutionDate** for future payments
                                          (ic. *framvirk greiðsla*).

  **partialPayment**                      Applies to Claim Payments when the deptor
                                          intends to only pay part of the amount owed,
                                          towards an existing claim. The claim needs
                                          to allow partial payment, else an error occurs. 
  ------------------------------------------------------------------------------------------
  :Detailed description of ÍST {{spec_id}} payments properties. {#tbl:proper_domestic}

The remittanceInformationStructured mentioned in [table @tbl:proper_domestic] is only used currently to carry the deptor's payment reference. For identification the **type** is set to TILV_U, which helps clearly identify this information.

``` {.json caption="Example of the *remittanceInformationStructured* data element."}
 remittanceInformationStructured: [
   {
    reference: "Maximum 16 chars"
    type: "TILV_U"
  }
 ]
```

## Bulk Payments

Bulk payments are supported for all ÍST {{spec_id}} payment types. For a bulk payment all collected payments shall be based on the same payment product, consistent with the approach of the NextGenPSD2 framework. The *bulkPaymentInitiationDomestic_json* schema type should be used for the top level bulk initiation according to ÍST {{spec_id}} and the *paymentInitiationBulkElementDomestic_json* type for the child payments contained in an array on the parent.

The domestic bulk types allow for specifying separate debtor accounts on child payment elements, when *batchBookingPreferred* is false on the parent and the *debtorAccount* consequently not included on the bulk initiation top element. When the *batchBookingPreferred* element is set to true, the *debtorAccount* must be either not included on the child payments or set to the exact same account as on the *bulkPaymentInitiationDomestic_json* instance, or an error will be returned.

  ----------------------------------------------------------------------------------------------
  **Data Element**            **Type**      **Condition**   **Description**
  --------------------------- ------------- --------------- ------------------------------------
  **batchBookingPreferred**   Boolean       Optional        When the element is included 
                                                            and set to true, the
                                                            debtor prefers only one booking
                                                            entry, and debtorAccount must
                                                            be included.
                                                            If this element equals
                                                            false, or is not included,
                                                            the debtor prefers
                                                            individual booking of payments,
                                                            and each must include debtorAccount.

                                                            supplied here but preferrably
                                                            not on the individual payments 
                                                            in the child collection.

  **paymentInformationId**    Max35Text     Optional        Unique identification assigned 
                                                            by the sending party to
                                                            unambiguously identify this bulk. 
                                                            Replaces **NameOfBatch**
                                                            in IOBWS 2.0 and 3.0, as well as
                                                            **PaymentsID** that was generated
                                                            by the receiving bank.
                                                            Note: This attribute might be
                                                            considered mandatory in future
                                                            versions of the specification.

  **requestedExecutionDate**  ISODate       Optional        Determines if the payments
                                                            contained in the bulk will be
                                                            executed at the given, later date.

  **payments**                Bulk Entry    Mandatory       The Bulk Entry is a JSON Type
                                                            which mirrors the supported
                                                            domest payment products for
                                                            single payments, excluding the
                                                            data element 
                                                            requestedExecutionDate. 
                                                            DebtorAccount should also be
                                                            excluded if batch booking is 
                                                            preferred, but mandatory if
                                                            either batchBookingPreferred is 
                                                            'false' or the element missing. 

  **chargesAccount**          Account       N/A             
                              Reference                     
  ----------------------------------------------------------------------------------------------
  :Description of domestic bulk payment main body. {#tbl:bulk_domestic}


## Payment Error reporting

<!-- ErrorHandlingStart -->
The NextGenPSD2 framework [@NextGenPSD2] has a very structured approach to messages that convey information related to specific HTTP return codes, with specific types to handle different codes per each service. These should be largely transparent to consumer of ÍST {{spec_id}} services implementations. As these   
<!-- ErrorHandlingEnd -->

# Accounts Service

The way account transaction information is retrieved bears strong similarities to the previous versions of IOBWS while adapted from the Berlin Group NextGenPSD2 framework.

When querying information about domestic accounts, there exists an option to additionally request information on the allowed credit limit (*withCreditLimitQuery* data element). This matches what Icelandic banks offer as "yfirdráttarheimild", which refers to an applied overdraft limit. The returned data element is named *creditLimit*, to avoid confusion associtated the simply named "Overdraft" used in previous IOBWS versions. 

<!-- balancesDomesticExample6_RegularAccount -->
```{.json caption="Example of information about an account with credit limit" #lst:accexample6}
!include`startLine=14695, endLine=14711, dedent=7` "Deliverables/IOBWS3.0.yaml"
```

<!-- AccountsOverviewBegin -->
The definition of the transaction details returned as a list, includes elements that are applicable to the relatively broad range of use cases the NextGenPSD2 covers. In [table @tbl:transaction_domestic] the elements that are applicable to the domestic context and might need further explanation are given further description. 

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

  **creditorId**                          Optional   Creditor ID, or kennitala.

  **creditorName**                        Optional   Creditor name.

  **creditorAccount**                     Optional   Creditor account.

  **creditorAgent**                       Optional   The BICFI, Business Identifier Code 
                                                     of the financial institution, or
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

  **additionalInformation**               Optional   Additional transaction related
                                                     information.

  **purposeCode**                         N/A        Not returned as these codes
                                                     have currently not been adapted 
                                                     to the uses
                                                     that the Icelandic purpose code
                                                     covers. Future Core
                                                     Banking or Clearing changes might
                                                     affect this.

  **bankTransactionCode**                 N/A        Not used currently for similar
                                                     reasons as purposeCode.

  **proprietaryBankTransactionCode**      N/A        Not used currently, similar to
                                                     the previous purposeCode and
                                                     bankTransactionCode.

  **balanceAfterTransaction**             Optional   Balance after the transaction has
                                                     been performed

  **\_links**                             Optional   Link to transaction details

  **transactionTimestamp**                Mandatory  Execution datetime of the record.

  **ultimateCreditorId**                  Optional   Ultimate creditor kennitala
                                                     as applicable.

  **debtorId**                            Optional   Debtor kennitala.

  **ultimateDebtorId**                    Optional   Ultimate debtor kennitala.

  **icelandicPurpose**                    Optional   Returns the text codes used as simple 
                                                     transaction
                                                     categorization, (ic. *textalykill*),
                                                     with description.
  ----------------------------------------------------------------------------------------
  :Description of transaction details. {#tbl:transaction_domestic}

<!-- AccountsOverviewEnd -->

An example of how this would look for a domestic account is provided in [listing @lst:transexample]. For other examples please refer to the IOBWS YAML schema.

<!-- transactionsExampleDomestic4_RegularAccount_json -->
``` {.json caption="Example result of a transaction detail query." #lst:transexample}
!include`startLine=14736, endLine=14769, dedent=7` "Deliverables/IOBWS3.0.yaml"
```

# Confirmation of Funds

The service offers functionality to check if funds up to a certain amount are available on a payment account. This can be useful when such a check is desired before initiating a payment or account transfer with all the associated processing overhead. 

  ----------------------------------------------------------------------------------------
  **Field**                               **Rule**   **Description**
  --------------------------------------- ---------- -------------------------------------
  **account**                             Mandatory  The account number of the creditor.

  **instructedAmount**                    Mandatory  Transaction amount to be checked, as
                                                     determined to be available by the 
                                                     applicable business rules.
  ----------------------------------------------------------------------------------------
  :Description of confirmation of funds payload. {#tbl:confirmationoffunds_domestic}

ÍST {{spec_id}} only supports the elements shown in [table @tbl:confirmationoffunds_domestic] for confirmation of funds request and consequently applies only to payment accounts. Card accounts are currently not supported and are only included in the OpenAPI schema for compatibility with the source framework. Further business rules on what constitutes availability of funds might apply per financial institutions for particular account types. An example of a request for confirmation of funds is shown below.

``` {.json caption="Example result of a confirmation of funds query. TODO: Verify"}
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

![IOBWS authorisation flow with confirmation](lib/media/authtflow1.eps){.calloutright #fig:auth_flow1 width="60%"}

<!-- PaymentsProcessingBegin -->

The NextGenPSD2 framework [@NextGenPSD2] includes a handful of authentication methods that can be combined into authorisation flow mostly geared towards intermediary service providers acting on behalf of end-users. ÍST {{spec_id}} addresses the needs of IOBWS by adding an "IOBWS" method for confirming authorisation and defining that as the only supported transaction flow when authorising payments. It deviates from what was supported in the previous IOBWS standards by separating payment initiation and authorisation. This makes it possible for consumers of IOBWS version 3 to implement variations in their business logic through a two-step process. No payments created with an initiation request will be automatically authorised and processed without an explicit confirmation in a later step. The main scenarios supported are e.g. an immediate authorisation after initiation which will be executed using straight-through processing (STP), as well as a variation of the decoupled flow where the authorisation takes place in the UI of the mobile app or online banking Web interface offered by the bank.

To simplify the usage of the APIs and to distinguish the IOBWS approach from e.g. the NextGenPSD2 Decoupled transaction flow, ÍST {{spec_id}} considers the authorisation resources associated with a payment initiation to be implicitly created at the time of the original initiation request. This means payments can be directly confirmed without an intermediary step to create an authorisation resource, which would then trigger straight-through processing for an initiated payment. ÍST {{spec_id}} does not include specific authorisation for cancelling payments. 

In decoupled IOBWS scenarios, payments would be available for confirmation in the appropriate user interface immediately after initiation. This matches the decoupled SCA method in the NextGenPSD2 framework but without having to explicitly create the authorisation resources. The end result also closely aligns with how most banks handle similar cases in support of earlier IOBWS versions.

In [@fig:auth_flow1] an example of accounting system is shown using the IOBWS flow. The system would use OAuth 2.0 Client Credentials Grant Flow and authenticate itself over the transport using mutual TLS (mTLS) with an eIDAS compliant certificate, identifying the legal entity or person the system it is representing. Certificates issued by Auðkenni ehf. under the "Traustur búnaður" intermediary are the common denominator supported by all IOBWS service providers.

The first initiation would receive a response in line with the one below, and the header ASPSP-SCA-Approach contains the method "IOBWS".

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

The confirmation of the payment initiation takes the form a PUT update to the authorisation resource, using the "iobwsAuthorisationConfirmation" type. The confirmation message is an optional description that might potentially be used by service implementors for display in a UI available to users e.g. for decoupled authorisations, to communicate the method used to approve these payments. 

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

Optionally the links given can be used to check the status of payments As domestic payments are instant credit transfers, the transaction status expected is "ACCC", which stands for "AcceptedSettlementCompleted", indicating both debtor and creditor accounts have been settled. However, as mentioned before the full range of codes are available and could potentially apply.

``` {.json caption="Example of a payment status query response."}    
  {
  "transactionStatus": "ACCC"
  }
```

# Appendix

## Mapping from older implementations

The ISO 20022 data model uses  guide the conversion from previous versions of IOBWS an overview of the mapping from the previous entities and data elements, over to the new implementation. In most regards everything is a straightforward 1:1 translation, b
### Payments

*Payments* is the IOBWS 2.0 bulk entity, containing the same child *Payment* data entities that can be used to issue individual payments.

  ---------------------------------------------------------------------------------------
  **Entity/Element**          **Equivalent data element**   **Comment**                  
  --------------------------- ----------------------------- -----------------------------
  RollbackOnError             *No equivalent.*              Bulks are executed as a whole
                                                            ad not rolled back, but 
                                                            individual errors reported on
                                                            each payment in the results.

  IsOneToMany                 batchBookingPreferred         

  DateOfForwardPayment        requestedExecutionDate        

  NameOfBatch                 paymentInformationId          
  ---------------------------------------------------------------------------------------

### Payments Out

Encpsulates the debtor side of the payment transfer, for a single payment
or child-payment in a bulk.

  -----------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data element**       **Comment**
  -------------------- --------------------------------- ----------------------------
  Account              debtorAccount \> iban             The withdrawal should
                                                         reference the iban number of
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

  Description (sic)    remittanceInformationUnStructured   

  BookingID            instructionIdentification           
  -----------------------------------------------------------------------------------

### ABGiro {#sec:abgiro}

When paying an AB Giró use the following pattern.

  ---------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data        **Comment**
                       element**                
  -------------------- ------------------------ -----------------------------------
  Account              creditorAccount \> bban  As in the older schemas, AB Giro is
                                                identified with a bban number.

  Reference            *No equivalent*          Usually used for debtorId, which
                                                now is a separate field.

  BillNumber           endToEndIdentification   

  CategoryCode         icelandicPurposeCode     
  ---------------------------------------------------------------------------------

### CGiro {#sec:cgiro}

When paying C-Giro, use the following pattern.

  ---------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data        **Comment**
                       element**                
  -------------------- ------------------------ -----------------------------------
  Account              creditorAccount \> bban  As in the older schemas, AB Giro is
                                                identified with a bban compliant
                                                number.

  AccountOwnerID       creditorId               

  BillNumber           endToEndIdentification   

  CategoryCode         icelandicPurposeCode     
  ---------------------------------------------------------------------------------

### Claim {#sec:claim}

The format for claim is *Claim* inniheldur upplýsingar um
innheimtukröfu.

  ----------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data    **Comment**
                       element**            
  -------------------- -------------------- ----------------------------------------
  Account                                   See data element [table @tbl:ice_claim].

  Claimant                                  [table @tbl:ice_claim]

  PayorID              ultimateCreditorId   The creditor could potentially be
                                            another party than the *kröfugreiðandi*
                                            entity whose *kennitala* is sometimes
                                            used as part of the claim key.

  DueDate                                   [table @tbl:ice_claim]

  IsDeposit            partialPayment       
  ----------------------------------------------------------------------------------

### Bond {#sec:bond}

Klasinn *Bond* inniheldur upplýsingar um skuldabréf/víxil.

  -------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data    **Comment**
                       element**            
  -------------------- -------------------- -------------------------------------
  Account              creditorAccount \>   As in the older schemas, bonds are
                       bban                 identified with a bban compliant
                                            number.

  PayorID              ultimateCreditorId   The creditor could potentially be
                                            another party than the *kennitala*
                                            set as the payee of the bond.

  DueDate              *No equivalent.*     
  -------------------------------------------------------------------------------

### Transfer

Klasinn *Transfer* inniheldur upplýsingar um millifærslu.

  ---------------------------------------------------------------------------------
  **Entity/Element**   **Equivalent data        **Comment**
                       element**                
  -------------------- ------------------------ -----------------------------------
  Account              creditorAccount \> bban  The target account can be
                                                identified with a bban compliant
                                                number or full iban.

  AccountOwnerID       creditorId               

  CategoryCode         icelandicPurposeCode     

  Reference            *No equivalent*          Usually used for debtorId, which
                                                now is a separate field

  BillNumber           endToEndIdentification   
  ---------------------------------------------------------------------------------

## Domestic adaptations of the NextGenAPI framework

As mentioned, one of the guiding principles for ÍST {{spec_id}} was to make the specification for domestic payments and accounts easy to compare against the original Berlin Group NextGenPSD2 document, and its future versions. In the first iteration of version 3.0, the OpenAPI definition however involved cards and currencies, making the overall contract even more complex than the original. The base was then referencing NextGenPSD2 version 1.3.6 but though upgrading to 1.3.8 was desired, it had turned out to be a considerable task. To facilitate maintenance of the specification througout minor version updates, as well as simplifying implementations of IOBWS, the cards and currencies APIs were split into their own separate contracts, and the domestic adaptations reworked on top of an intact version 1.3.6. This approach was then validated, by upgrading to NextGenPSD2 version 1.3.8 without undue roadblocks.

To make it even easier to do see the deltas in e.g. text comparison tools, localized version of the source NextGenPSD2 API specifications are stored in appropriate "Stuðningsefni/Berlin-group/v.1.3.8" folder. Alongside that document, there was created an intermediary document with some of the most common and repeated adaptations. The relationship between these documents looks like the following, though the actual filenames are longer:

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

# Bibliography {.unnumbered}
\ 
\ 
