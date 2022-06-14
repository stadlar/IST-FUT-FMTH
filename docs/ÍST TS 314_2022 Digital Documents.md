---
title: "ÍST TS 314:2022"
author: ICS 35.240, 3.060
date: "Entry into force XX-XX-2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 314]
subtitle: ["Tækniforskrift - Rafræn skjöl", "Technical specification - Digital Documents"]
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
mustache: "docs/314media/docvariables.yml"
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

!include-header "docs/314media/participants.yaml"

\newpage

# Foreword {.unnumbered}
!include`snippetStart="<!-- ForewordStart -->", snippetEnd="<!-- ForewordEnd -->"` "docs/ÍST TS 312_2022 Currency Exchange Rates.md"

# Introduction {.unnumbered}

!include`snippetStart="<!-- IntroductionStart -->", snippetEnd="<!-- IntroductionEnd -->"` "docs/ÍST TS 312_2022 Currency Exchange Rates.md"

The ÍST {{spec_id}} is the successor to the {{previous_spec}} specification, that described services to encapsulate the system previously known as *Birtingur* but now as *Ark-kerfið*, used for uploading data and documents for later display to the bank's customers in their and other banks UIs. The specification should be viewed as a standalone specification though part of the IOBWS version 3 framework and adapting the same REST patterns established in the OpenAPI contracts that are part of version 3. The TN-FMÞ did not aim to substantially alter the functionality of the previous service, but [subsection @sec:svc_overview] list the main additions. It should be emphasized that ÍST {{spec_id}} is not part of NextGenPSD2 framework nor is it in any way related to the PSD2 regulation. The patterns shared by the IOBWS version 3 specifications may however result in some of the elements and types in ÍST {{spec_id}} having similarities to parts of the NextGenPSD2 framework. Attribution applies to these as required by the CC BY 4.0 license of the NextGenPSD2 OpenApi specification.

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the Icelandic Online Banking Web Services (IOBWS) framework of specifications.
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist which address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST WA-316. As the consumption and implementation of each part of IOBWS are optional, the documents aim to be independent of each other.

The focus in ÍST {{spec_id}} is the information needed for consuming information about foreign currency rates though the variations in client usage patterns and bank specific implementations detail result in many different use cases for said information.

The intended audience for the specification document ÍST {{spec_id}} is developers who will either implement banking API services or the systems that will consume them as API clients. The reader is expected to have a basic understanding of the Icelandic financial products involved. Further documentation on business aspects of those products will be available from each bank, as they may involve service agreements and the end customers' contractual preferences and benefits.
<!-- ScopePaymentsDocsContextEnd -->

Out of necessity, the previous IOBWS technical specifications largely consisted of expressing the intent and actual content in a human-readable format, otherwise found in the associated XML Schema and SOAP definitions. 
The expectation for ÍST {{spec_id}} is that the technical service definitions and JSON data schemas in the accompanying OpenAPI specification can be understood using utilities that can convert them into documentation or navigatable user interfaces.

<!-- ScopeEndNoteStart -->
Consequently, the ÍST {{spec_id}} specification avoids the unnecessary repetition of information found in the technical contract "[{{yaml_definition}}](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/{{yaml_definition}})". Instead, the the document focuses on the information needed to understand the domestic context of services, schema types and service flows required to implement ÍST {{spec_id}}.
<!-- ScopeEndNoteEnd -->

# Normative references, definitions and data elements 

<!-- TerminalogyStart -->
## Normative references

The following documents are referenced in ÍST {{spec_id}}, as part of their content constitutes the requirements of this document. If newer editions exist, only the edition cited applies.

NextGenPSD2 v1.3.8. *The Berlin Group NextGenPSD2 Access to Account Framework*.

OpenAPI v3.0.1. The OpenAPI Specification (OAS) by the OpenAPI Initiative, a Linux Foundation Collaborative Project.


## Terms and definitions
- **Ark-kerfið* is the system owned and operated by Reiknistofa bankanna, for storing and displaying data based on specified templates or whole documents. Previously owned Greiðsluveitan ehf and known by the name Birtingur.
- **Birtingur**: see *Ark-kerfi*.
- **Checkfree**: see *Ark-kerfi*.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland.
- **NextGenPSD2 Access to Accounts Framework** (**NextGenPSD2 Framework** or just **NextGenPSD2**) is the framework established by *the Berlin Group* to define a common PSD2 compliance interface [@NextGenPSD2]. Since then, parts of the framework have extended beyond compliance and into other Open Banking aspects.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.

<!-- TerminalogyEnd -->

\newpage

# Implementation

## Service Overview {#sec:svc_overview}

<!-- SvcOverview|Start -->
The functionality offered by the service endpoints is described in the [table @tbl:tbl_offered_services].

---------------------------------------------------------------------------------------------------------------
\_                                        \_
----------------------------------------- ---------------------------------------------------------------------
Document Service                          The Document Service offers methods to initiate and
                                          update a document, retrive thes status of a document and the types
                                          of documents supported by the system.
---------------------------------------------------------------------------------------------------------------
:Service on offer. {#tbl:tbl_offered_services}

The subsequent section describe the services in further details.
<!-- SvcOverview|End -->

### Document Service 

The card account information services is closely aligned with the information service for ordinary accounts. It should reflect similar details, balances and transaction reports available through the online interfaces offered by each bank.  

The [table @tbl:tbl_svcsupport2] describes the resources found in the NextGenPSD2 based {{yaml_definition}}.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Endpoints/Resources**                                                        **Description**
------------------------------------------------------------------------------ ---------------------------------------------------------------------------------------------------------------
documents\/{document-store-location}                                           Create a new document batch by store, or get information on previously 
                                                                               created document batches by query parameters. Under ÍST {{spec_id}} all banks will support
                                                                               one common document store location 'arksystem', referring to the *Ark-kerfi*.
                                                    
documents\/{document-store-location}\/{sender-kennitala}\/{documents-id}       Retrieve information on a document batch by ID or update a batch by ID, if allowed.

{document-store-location}/types                                                Get available document types based on store.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Service support in ÍST {{spec_id}} and {{yaml_definition}}. {#tbl:tbl_svcsupport2}  

# Bibliography {.unnumbered}
\ 
\ 
