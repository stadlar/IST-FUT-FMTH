---
title: "ÍST TS 312:2022"
author: ICS 35.240, 3.060
date: "Entry into force 30.08.2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 312]
subtitle: ["Tækniforskrift - Gengi gjaldmiðla", "Technical specification - Currency Exchange Rates"]
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
mustache: "docs/312media/docvariables.yml"
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

!include-header "docs/312media/participants.yaml"

\newpage

# Foreword {.unnumbered}
<!-- ForewordStart -->
This ÍST Technical Specification was developed in accordance with "ÍST Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.* IST rules on Technical Specifications, Technical Reports and Workshop Agreements). The TS (Technical specification) was prepared by the technical committee TN-FMÞ (The Technical Committee on Financial Services) that operates within FUT (Sector committee for ICT standardization) following a public call for participation within TN-FMÞ. The final draft was sent to the TN-FMÞ on the {{finaldraft_date}} and approved by FUT on the {{approve_date}}. The text of ÍST {{spec_id}} was submitted to IST for publication on {{publication_date}}.
 
The accompanying OpenAPI 3.0.1 definition "{{yaml_definition}}" located at [https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables](https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables), should be viewed as an integral part of ÍST {{spec_id}}.

The document "{{fulldoc_name}}" is the source of this rendition, and versions of that document will be used for future errata and clarifications per the procedures to be laid out in the workshop agreement ÍST WA 316, IOBWS 3.0 Technical Guidelines. The rules are outlined in the README.md accompanying the Github Git repository and are accepted by the participants in TN-FMÞ alongside this specification. These guidelines establish the workgroup TN-FMÞ-VH-7 as in charge of monitoring submitted issues and pull requests made to the repository when they fall outside the purview of other regular workgroups. TN-FMÞ-VH-7 will evaluate if changes are ready to be accepted into the repository and when or if they warrant patches or minor releases to the specification. Versioning will adhere to the [Semantic Versioning](https://semver.org/spec/v2.0.0.html) [@semver2] scheme and each minor release will require a workgroup agreement under the "ÍST reglur" referenced above.

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

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the OASIS SOAP standards which were current at the time to define common web service interfaces for the Icelandic commercial and savings banks. This enabled software vendors, enterprises, and service providers to integrate their accounting, payment, and information systems with the bank's services, allowing them to act on behalf of the customers and with full access to their data. 

A goal of the IOBWS version 3.0 charter, which was set forth by TN-FMÞ in the beginning, is the transition from SOAP to a REST-like API, which is defined by a recent iteration of the [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md) [@OpenAPISpecification]. Along with support for modern authentication and authorization standards, this addresses some of the perceived complexity in adapting IOBWS to various use cases, platforms, and programming languages that have come to the forefront after the release of the previous IOBWS versions.
<!-- IntroductionEnd -->

The ÍST {{spec_id}} is the successor to the {{previous_spec}} specification. It was not the aim of TN-FMÞ to substantially alter the functionality of the previous service, which only offered information on foreign exchange rates. It should be viewed as a standalone specification though part of the overall IOBWS version 3 update, where it most closely aligns with ÍST TS 313 and to a lesser degree ÍST TS 310. Readers looking for more context can consult those documents. ÍST {{spec_id}} is not part of NextGenPSD2 framework nor is it in any way related to the PSD2 regulation. The drive to consolidate the IOBWS specifications may however result in many of the elements and types in ÍST {{spec_id}} having similarities to parts of the NextGenPSD2 framework. Attribution applies to these as required by the CC BY 4.0 license of the NextGenPSD2 OpenApi specification.

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the Icelandic Online Banking Web Services (IOBWS) framework of specifications.
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist which address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST WA 316. As the consumption and implementation of each part of IOBWS are optional, the documents aim to be independent of each other.

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

The sources returned by the bank can vary based on implementations, but at least two types should be expected.

1. General (Bank exchange rate, ic. *almennt gengi*) should be returned by all banks.
2. Notes (Banknote exchange rate, ic. *seðlagengi*) is optional but the name is standard.

Other source types are expected to be handled by consumers of the services, with only those mentioned given standardized names as part of ÍST {{spec_id}}.

# Bibliography {.unnumbered}
\ 
\ 
