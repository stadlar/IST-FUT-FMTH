---
title: "ÍST TS 315:2025"
author: ICS 35.240, 3.060
date: "Entry into force 28.02.2025"
subject: "Icelandic Online Banking Webservices"
keywords: [IOBWS, ÍST, TS, 315]
subtitle: ["Tækniforskrift - Kröfur", "Technical specification - Claims"]
lang: "en"
titlepage: true
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
mustache: "docs/315media/docvariables.yml"
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

!include-header "docs/315media/participants.yaml"

\newpage

# Foreword {.unnumbered}
<!-- ForewordStart -->
This ÍST Technical Specification was developed in accordance with "ÍST Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.* IST rules on Technical Specifications, Technical Reports and Workshop Agreements). The TS (Technical specification) was prepared by the technical committee TN-FMÞ (The Technical Committee on Financial Services) that operates within FUT (Sector committee for ICT standardization) following a public call for participation within TN-FMÞ. The final draft was sent to the TN-FMÞ on the {{finaldraft_date}} and approved by correspondence on the {{approve_date}}. The text of ÍST {{spec_id}} was submitted to IST for publication on {{publication_date}}.
 
The accompanying OpenAPI 3.0.1 definition "{{yaml_definition}}" located at [https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables](https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables), should be viewed as an integral part of ÍST {{spec_id}}.

The document "{{fulldoc_name}}" is the source of this rendition, and versions of that document will be used for future errata and clarifications per the procedures to be laid out in the workshop agreement ÍST TS 316, IOBWS 3.0 Technical Guidelines. The rules are outlined in the README.md accompanying the Github Git repository and are accepted by the participants in TN-FMÞ alongside this specification. These guidelines establish the workgroup TN-FMÞ-VH-7 as in charge of monitoring submitted issues and pull requests made to the repository when they fall outside the purview of other regular workgroups. TN-FMÞ-VH-7 will evaluate if changes are ready to be accepted into the repository and when or if they warrant patches or minor releases to the specification. Versioning will adhere to the [Semantic Versioning](https://semver.org/spec/v2.0.0.html) [@semver2] scheme and each minor release will require a workgroup agreement under the "ÍST reglur" referenced above.

{{funding_paragraph}}

ÍST {{spec_id}} is not subject to any patent rights. Some specific data elements in the specification can be viewed as derived from version 1.3.8 of the 
[Berlin Group's NextGenPSD2 Framework](https://www.berlin-group.org/nextgenpsd2-downloads)
and therefore the "{{yaml_definition}}" definition is also distributed under a 
[Creative Commons Attribution 4.0 International Public License (CC BY)](https://creativecommons.org/licenses/by/4.0/#).

This means the YAML Specification for ÍST {{spec_id}} can be copied and redistributed in any medium or format for any purpose, even commercially; when shared, appropriate credit must be given, a link to the license must be provided, and any changes made must be indicated. One may do this in any reasonable manner, however it must not be suggested that the licensor had endorsed it. Additionally, if you remix, transform, or build upon the specification, you may not distribute the modified specification.

The Technical Committee's participants have made every effort to ensure the reliability and accuracy of the technical and non-technical content of ÍST {{spec_id}}, but this does not guarantee its correctness, explicitly or implicitly. Users of ÍST {{spec_id}} should be aware that neither the TN-FMÞ nor ÍST can be held liable for damages or losses of any kind which may arise from its application. Users of ÍST {{spec_id}} do so on their own responsibility and at their own risk.
<!-- ForewordEnd -->

# Introduction {.unnumbered}

<!-- IntroductionStart -->
This Technical Specification (TS) presents version 3.0 of the Icelandic Online Banking Services (IOBWS) for {{context_short}}.

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the OASIS SOAP standards which were current at the time to define common web service interfaces for the Icelandic commercial and savings banks. This enabled software vendors, enterprises, and service providers to integrate their accounting, payment, and information systems with the banks’ services, allowing them to act on behalf of the customers and with full access to their data.

A goal of the IOBWS version 3.0 charter, which was set forth by TN-FMÞ in the beginning, is the transition from SOAP to a REST-like API, which is defined by a recent iteration of the [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md) [@OpenAPISpecification]. Along with support for modern authentication and authorization standards, this addresses some of the perceived complexity in adapting IOBWS to various use cases, platforms, and programming languages that have come to the forefront after the release of the previous IOBWS versions.
<!-- IntroductionEnd -->

The ÍST {{spec_id}} is the successor to the {{previous_spec}} specification. Claims have been redesigned to align with best practices in REST architecture. Dedicated endpoints for secondary collection have been removed. Claimants (such as companies) and secondary collection agencies use the same methods but have different scopes. As a result, they have different access rights, ensuring that secondary collection agencies can view only those claims that have been forwarded to them.

The ÍST {{spec_id}} specification should be viewed as standalone though part of the IOBWS version 3 framework and adopting the same REST patterns established in the OpenAPI contracts that are part of version 3. It should be emphasized that ÍST {{spec_id}} is not part of the NextGenPSD2 framework nor is it in any way related to the PSD2 regulation. The patterns shared by the IOBWS version 3 specifications may, however, result in some of the elements and types in ÍST {{spec_id}} having similarities to parts of the NextGenPSD2 framework. Attribution applies to these as required by the CC BY 4.0 license of the NextGenPSD2 OpenApi specification.

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the Icelandic Online Banking Web Services (IOBWS) framework of specifications.
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist that address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST TS 316. As the consumption and implementation of each part of IOBWS is optional, the documents aim to be independent of each other.

The focus in ÍST {{spec_id}} is the features needed to create and amend digital documents.

The intended audience for the specification document ÍST {{spec_id}} is developers who will either implement banking API services or the systems that will consume them as API clients. The reader is expected to have a basic understanding of the Icelandic financial products involved. Further documentation on business aspects of those products will be available from each bank, as they may involve service agreements and the end customers’ contractual preferences and benefits.
<!-- ScopePaymentsDocsContextEnd -->

Out of necessity, the previous IOBWS technical specifications largely consisted of expressing the intent and actual content in a human-readable format, otherwise found in the associated XML Schema and SOAP definitions. The expectation for ÍST {{spec_id}} is that the technical service definitions and JSON data schemas in the accompanying OpenAPI specification can be understood using utilities that can convert them into documentation or navigable user interfaces.

<!-- ScopeEndNoteStart -->
Consequently, the ÍST {{spec_id}} specification avoids the unnecessary repetition of information found in the technical contract “[{{yaml_definition}}](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/{{yaml_definition}})”. Instead, the document focuses on the information needed to understand the domestic context of services, schema types, and service flows required to implement ÍST {{spec_id}}.
<!-- ScopeEndNoteEnd -->

# Normative references, definitions and data elements 

<!-- TerminalogyStart -->
## Normative references

The following documents are referenced in ÍST {{spec_id}}, as part of their content constitutes the requirements of this document. If newer editions exist, only the edition cited applies.

NextGenPSD2 v1.3.8. *The Berlin Group NextGenPSD2 Access to Account Framework.*

OpenAPI v3.0.1. The OpenAPI Specification (OAS) by the OpenAPI Initiative, a Linux Foundation Collaborative Project.

## Terms and definitions

- **Claims System** is the system owned and operated by Reiknistofa bankanna (RB) for storing and displaying information about claims. This system makes it possible to track the status of claims, see which ones are in the payment process, which have been paid, and which have been sent for collection.

- **Claim** is a request for payment from a sender to a receiver. It is stored in the Claims System that is managed by Reiknistofa Bankanna (RB)
  A claim is **uniquely identified** by the five components of the claim key as shown below in [Table @tbl:claim_claimid].

    ------------- ----------- -------- ---------- -------- --------------
                  Claimant    Bank     Ledger     Claim    Due date      
                              branch   ID         ID                     
    ------------- ----------- -------- ---------- -------- --------------
    Description   10 digit    4 digit  2 digit    6 digit  8 digits
                  kennitala   branch   constant   number   in the pattern
                              number   set to 66           YYYYMMDD

    Example       1111111119  0001     66         007654   20250225 
    --------------------------------------------------------------------------
    :ClaimId with example. {#tbl:claim_claimid}  

- **Claimant** (ic. kröfuhafi) is the party that is the beneficiary or payee of the claim.
  
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by Registers Iceland (ic. Þjóðskrá Íslands) for individuals, and by the Iceland Revenue and Customs (ic. ríkisskattstjóri) for legal entities in Iceland. It is used to identify both senders and receivers.
  
- **Secondary Collection** refers to the process of forwarding an unpaid or overdue claim to a specialized collection agency after the final due date has passed. At this stage, additional fees or interest may apply, and the collection agency typically takes steps (such as contacting the debtor or negotiating new payment terms) to recover the outstanding amount.

<!-- TerminalogyEnd -->

\newpage

# Implementation

## Service Overview {#sec:svc_overview}

<!-- SvcOverview|Start -->

| **Service** | **Description**                                                                                                                                                         |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Claims      | The Claims Service offers methods to create and update claims, retrieve the status of a claim, and access the types of claims supported by the system.                  |
| Batches     | The Batches Service validates and queues bulk transactions for processing, enabling mass submission, modification, cancellation, or secondary collection of claims.     |
| Templates   | Provide standardized definitions for creating claims. These methods allow you to retrieve either all available templates or the details of a specific template.         |

The subsequent section describes the functionality offered by the service.

<!-- SvcOverview|End -->


### Claims Service 

The Claims System tracks both paid and unpaid claims. Claims are recorded under ledger 66 and can be in Icelandic or foreign currency. As a real-time system, it allows users to create, modify, cancel, view, and resend claims instantly via web services. 

Batch transactions are validated and queued for processing, supporting mass submissions of claims, modifications, cancellations, and secondary collections. Claims are displayed in online banking systems, where users can make payments.

:Service support in ÍST {{spec_id}} and {{yaml_definition}}. {#tbl:tbl_svcsupport2}

### API Endpoints

#### Claims

- **GET** `/v1/claims` – Retrieve a list of claims based on query parameters.
- **POST** `/v1/claims` – Create a new claim.
- **GET** `/v1/claims/{claimId}` – Retrieve a single claim.
- **PATCH** `/v1/claims/{claimId}` – Update a single claim.
- **GET** `/v1/claims/{claimId}/transactions` – Retrieve payments for a claim.
- **GET** `/v1/claims/transactions` – Retrieve payments for multiple claims.
- **GET** `/v1/claims/{claimId}/history` – Retrieve claim history.

#### Batches

- **POST** `/v1/batches` – Create a batch of actions.
- **GET** `/v1/batches/{batchId}` – Retrieve the status of a batch.

#### Claim Templates

- **GET** `/v1/claimtemplates` – Retrieve a list of claim templates.
- **GET** `/v1/claimtemplates/{claimTemplateId}` – Retrieve a single claim template.