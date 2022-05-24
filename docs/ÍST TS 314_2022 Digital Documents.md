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

The ÍST {{spec_id}} is the successor to the {{previous_spec}} specification. It was not the aim of TN-FMÞ to substantially alter the functionality of the previous service that only offered information on foreign exchange rates. It should be viewed as a standalone serive though of the IOBWS specifications in the version 3 update, it most closely aligns with TS-313 and to a lesser degree TS-310. Readers looking for more context can consult those documents. ÍST {{spec_id}} is not part of NextGenPSD2 framework nor is it in any way related to the PSD2 regulation. The drive to consolidate the IOBWS specifications may however result in many of the elements and types in ÍST {{spec_id}} having similarities to parts of the NextGenPSD2 framework. Attribution applies to these as required by the CC BY 4.0 license of the NextGenPSD2 OpenApi specification.

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

ISO 13616-1:2020. *Financial services - International bank account number (IBAN). Part 1: Structure of the IBAN.*

ISO 20022. *Financial services - universal financial industry message scheme*.

NextGenPSD2 v1.3.8. *The Berlin Group NextGenPSD2 Access to Account Framework*.

OpenAPI v3.0.1. The OpenAPI Specification (OAS) by the OpenAPI Initiative, a Linux Foundation Collaborative Project.


## Terms and definitions
-   **Berlin Group** is a pan-European payments interoperability standards and harmonization initiative with the primary objective of defining open and common scheme- and processor-independent standards in the interbanking domain between Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the work carried out by e.g. the European Payments Council. As such, the Berlin Group has been established as a purely technical standardization body, focusing on detailed technical and organizational requirements to achieve this primary objective.
- **CurrencyCode**: is an ISO 4217 standard for all currencies in the world.
- **ISO 20022** is an ISO standard [@ISO20022] for electronic data interchange between financial institutions.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland.
- **NextGenPSD2 Access to Accounts Framework** (**NextGenPSD2 Framework** or just **NextGenPSD2**) is the framework established by *the Berlin Group* to define a common PSD2 compliance interface [@NextGenPSD2]. Since then, parts of the framework have extended beyond compliance and into other Open Banking aspects.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.
- **Payment Services Directive 2** (**PSD2**) was instituted by the European Parliament as EU 2015/2366 [@EU2015/2366] and meant to further open up payment services on the internal EEA market. It was introduced to Iceland law through act no. 2021/114 [@IS2021/114]. PSD2 contains regulations of new services to be operated by so-called Third-Party Payment Service Providers on behalf of a Payment Service User, by leveraging Strong Customer Authentication.

<!-- TerminalogyEnd -->

\newpage

# Implementation

## Service Overview

<!-- SvcOverview|Start -->
The foreign currency exchange rate service is relatively simple and briefly described in [table @tbl:tbl_offered_services].

---------------------------------------------------------------------------------------------------------------
\_                                        \_
----------------------------------------- ---------------------------------------------------------------------
Currencies Information Service            The Currency Information Service offers methods to retrieve a list 
                                          of available currencies and the sources of currency information 
                                          available from the bank in question. Based on the source, available
                                          rates for a currency can be queried as well as a specified rate 
                                          for a single currency given a base currency. Historical rates for 
                                          a base currency can be queried but different service levels might
                                          apply between bank implementations.
---------------------------------------------------------------------------------------------------------------
:Service on offer. {#tbl:tbl_offered_services}

The subsequent section describe the services in further details.
<!-- SvcOverview|End -->

### Currencies Information Service 

The card account information services is closely aligned with the information service for ordinary accounts. It should reflect similar details, balances and transaction reports available through the online interfaces offered by each bank.  

The [table @tbl:tbl_svcsupport2] describes the resources found in the NextGenPSD2 based {{yaml_definition}}.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Endpoints/Resources**                                 **Description**
------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------
currencies                                              List all currencies offered by the bank.
                                                    
currencies\/sources                                     Retrieve all the sources of currency information available.

currencies\/{base-currency}\/rates                      Get available rates for a currency based on source.

currencies\/{quote-currency}\/rates\/{base-currency}    Get a specified rate for a currency based on a base currency

currencies\/{quote-currency}\/rates                     Get a list of historical rates for a currency based on a base currency
\/{base-currency}\/history
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Service support in ÍST {{spec_id}} and {{yaml_definition}}. {#tbl:tbl_svcsupport2}  

# Bibliography {.unnumbered}
\ 
\ 
