---
title: "ÍST TS 311:2022"
author: ICS 35.240, 3.060
date: "Entry into force 30.08.2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 311]
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
 
The accompanying OpenAPI 3.0.1 definition "{{yaml_definition}}" located at [https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables](https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables), should be viewed as an integral part of ÍST {{spec_id}}, as well as those parts of the "{{yaml_definition2}}" Account Information Service (AIS) that reference /v1/card-accounts and subservent resource paths.

The document "{{fulldoc_name}}" is the source of this rendition, and versions of that document will be used for future errata and clarifications per the procedures to be laid out in the workshop agreement ÍST WA-316, IOBWS 3.0 Technical Guidelines. The rules are outlined in the README.md accompanying the Github Git repository and are accepted by the participants in TN-FMÞ alongside this specification. These guidelines establish the workgroup TN-FMÞ-VH-7 as in charge of monitoring submitted issues and pull requests made to the repository when they fall outside the purview of other regular workgroups. TN-FMÞ-VH-7 will evaluate if changes are ready to be accepted into the repository and when or if they warrant patches or minor releases to the specification. Versioning will adhere to the [Semantic Versioning](https://semver.org/spec/v2.0.0.html) [@semver2] scheme and each minor release will require a workgroup agreement under the "ÍST reglur" referenced above.

{{funding_paragraph}}

ÍST {{spec_id}} is not subject to any patent rights. The underlying OpenAPI specification is derived from version 1.3.8 of the 
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

<!-- Psd2IntroStart1 -->
The Open Banking regulation in the UK along with the PSD2 regulation issued by the European Parliament, has triggered initiatives to standardize access to payment functionality and account information on behalf of customers by third parties. One such effort, the NextGenPSD2 Framework developed by the Berlin Group [@NextGenPSD2], has been broadly accepted in the EEA. The data model references ISO 20022 [@ISO20022] and is close enough to the direction of the Icelandic market to make it suitable as the new base for the relevant parts of the IOBWS, instead of maintaining an independent linage of API specifications.

The NextGenPSD2 Framework includes information about card accounts as reflected in the card-accounts paths in {{yaml_definition2}}. These are new to IOBWS in version 3.0 and form a part of ÍST {{spec_id}}.
<!-- Psd2IntroEnd1 -->

However TN-FMÞ felt consumers of the IOBWS would benefit from being able to retrieve detailed information about both debit and credit cards. Also being able to view balances and transactions from the viewpoint of the card was felt to be closer to what stakeholders expected as the account could potentially serve multiple cards or be subject to other uses. These additional capabilities were added in {{yaml_definition2}}. They are as such not part of NextGenPSD2 nor is ÍST {{spec_id}} directly related to the PSD2 regulation though many of the elements and types are based on the NextGenPSD2 framework. Attribution applies to these as required by the CC BY 4.0 license of the NextGenPSD2 OpenApi specification.

# Scope 

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the Icelandic Online Banking Web Services (IOBWS) framework of specifications.
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist which address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST WA-316. As the consumption and implementation of each part of IOBWS are optional, the documents aim to be independent of each other.

However, due to the origin of the underlying OpenAPI specification in the Berlin Group NextGenPSD2 Framework, ÍST {{spec_id}}, TS-310 on Domestic Payments and TS-313 on Foreign Payments overlap in parts. All three share a base in the
"[{{yaml_definition2}}](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/{{yaml_definition2}})" 
definition document and the underlying schema types and API service definitions share common ancestry. Stakeholders are advised to reference the TS-310 document if more context is required.

The focus in ÍST {{spec_id}} is the following: the domestic adaptation to the relevant parts of the NextGenPSD2 framework for card accounts; as well as the information needed to introduce card related details to the IOBWS framework.

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
- **ISO 20022** is an ISO standard [@ISO20022] for electronic data interchange between financial institutions.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland.
- **NextGenPSD2 Access to Accounts Framework** (**NextGenPSD2 Framework** or just **NextGenPSD2**) is the framework established by *the Berlin Group* to define a common PSD2 compliance interface [@NextGenPSD2]. Since then, parts of the framework have extended beyond compliance and into other Open Banking aspects.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.
- **Payment Services Directive 2** (**PSD2**) was instituted by the European Parliament as EU 2015/2366 [@EU2015/2366] and meant to further open up payment services on the internal EEA market. It was introduced to Iceland law through act no. 2021/114 [@IS2021/114]. PSD2 contains regulations of new services to be operated by so-called Third-Party Payment Service Providers on behalf of a Payment Service User, by leveraging Strong Customer Authentication.
- **Primary Account Number Identifier** (**PanID**) is a scoped identifier used as a replacement for the Primary Account Number when referencing card. The intention is to avoid sharing the sensitive parts of the card data, while using a unique reference that can be used in communication with the bank.


<!-- TerminalogyEnd -->

\newpage

# Implementation

## Service Overview

<!-- SvcOverview|Start -->
When TN-FMÞ-VH-1 on Business Requirements and TN-FMÞ-VH-2 on Technical Requirements decided to include card data, the original approach was to add domestic adaptions to the existing NextGenPSD2 OpenAPI contract (see {{yaml_definition2}}). The overall implementation suffered as the complexity was high and made future tracking of NextGenPSD2 developments more diffucult.

Therefore, workgroup TN-FMÞ-VH-8 decided to keep the original NextGenPSD2 OpenAPI definition as close to the original as possible, and add the card specific functionality in a separate and independant OpenAPI definition. The {{context_short}} resources share similar generic data elements but the schemas are separate. The [table @tbl:tbl_card_services] briefly describes the available services.

---------------------------------------------------------------------------------------------------------------
\_                                        \_
----------------------------------------- ---------------------------------------------------------------------
Account Information Service               Card Accounts information reflects the details balances and
                                          transactions of an account associated with at least one card.
                                          With debit cards the information of the associated payment account
                                          cannot be expected to be scoped to only those
                                          transactions associated with the particular card under scope, 
                                          as other cards or actions can target the same account.
                                          Similar qualifications might apply to credit card accounts based
                                          on product specific behavior and functionality.

Card Information Service                  Card details and transaction by individual cards, though the same 
                                          qualifications might apply to the difficulty of 
                                          isolating information as on card accounts in general. The linage 
                                          of renewed cards results in sequential physical
                                          cards being associated with the same card account even in the 
                                          case when users view this as a single card.  
---------------------------------------------------------------------------------------------------------------
:Card services. {#tbl:tbl_card_services}

The subsequent sections describe the services in further details.
<!-- SvcOverview|End -->

### Account Information Service 

The card account information services is closely aligned with the information service for ordinary accounts. It should reflect similar details, balances and transaction reports available through the online interfaces offered by each bank.  

The [table @tbl:tbl_svcsupport2] describes the resources found in the NextGenPSD2 based {{yaml_definition}}.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Endpoints/Resources**                             **Description**
--------------------------------------------------- ---------------------------------------------------------------------------------------------------------------
card-accounts                                       Read all identifiers of the card accounts, to which an account access has been granted by the User.
                                                    In addition, relevant information about the card accounts and hyperlinks to corresponding account information 
                                                    resources are provided if the related access grants are already present.
                                                    
card-accounts\/{account-id}                         Give detailed information about the addressed card account.

card-accounts\/{account-id}\/balances               Give detailed balance information about the addressed card account.

card-accounts\/{account-id}\/transactions           Read transaction reports or transaction lists related to a given card account.
                                                    For a given card account, additional parameters are e.g. the attributes \"dateFrom\" and \"dateTo\".
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Service support in ÍST {{spec_id}} and {{yaml_definition2}}. {#tbl:tbl_svcsupport2}  

### Card Information Service 

The card information service offers access to debit and credit card details, balances and transactions related to the card as an entity. The [table @tbl:tbl_svcsupport] describes the resources found in the NextGenPSD2 based {{yaml_definition}}.

------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Endpoints/Resources**                             **Description**
--------------------------------------------------- --------------------------------------------------------------------------------------------------------------
cards                                               Read all identifiers of the card (usually a credit card), to which an access has been granted by the User.
                                                    In addition, relevant information about the cards and hyperlinks to corresponding card information resources 
                                                    are provided if the related access has been already granted.
                                                    
cards\/{cardid}                                     Read detailed information about the addressed card.

cards\/{cardid}\/balances                           Read detailed balance information about the addressed card.

cards\/{card-id}\/transactions                      Read transaction reports or transaction lists  related to a given card. 
                                                    For a given card, additional parameters are  e.g. the attributes  \"dateFrom\" and  \"dateTo\".
------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Service support in ÍST {{spec_id}} and {{yaml_definition}}. {#tbl:tbl_svcsupport} 

The calculation and presentation of card balances will reflect the underlying properties and business rules of each card product. 
This might e.g. affect multi-card accounts with the reported balances and transactions scoped to the individual card resource indicated by Id. 
Please refer to the relevant documentation provided by each bank.

### Balance Types for card accounts and cards 

In [table @tbl:tbl_svcsupport] the balance types for cards is given context in addition to the documentation in the "{{yaml_definition}}" definition.

----------------------------------------------------------------------------------
**Type**                **Description**
----------------------- ----------------------------------------------------------                 
openingBooked           Booked balance of the account at the beginning of the   
                        period as indicated by the associated *referenceDate*. 
                        It should be equal to the closing book balance from 
                        end of the business day for the the previous 
                        reporting period.   

closingBooked           For card-accounts and cards, this balance is composed of      
                        invoiced, but not yet paid entries at the end of the 
                        the last full business day of the reporting period 
                        as indicated by the associated *referenceDate*.                  
                        
expected                Includes pending items, that affect the available
                        spending limit, including those pending items that 
                        have not yet been booked,
                        invoiced items not yet paid and booked entries not 
                        yet invoiced during the current business day period
                        up to the point in time of the query. Optionally
                        the time of the last update to the calculation 
                        can be indicated by the property 
                        *lastChangeDateTime*.               

interimBooked           Balance of booked debit or credit entries calculated 
                        during the bank\'s current business day,
                        up to the time of the query or *lastChangeDateTime* if
                        supplied. If no further entries are posted or
                        or in *expected*, this balance when added to the 
                        current *closingBooked* would form a new 
                        *closingBooked* balance for the combined period.         

interimAvailable        Available balance calculated in the course of the     
                        bank\'s business day, as of the time the query is         
                        run or at *lastChangeDateTime* if so specified.
                        The available amount is based on the *expected*
                        balance combined with the *interimBooked*, 
                        including the creditLimit if so indicated by the
                        boolean property *creditLimitIncluded*. 
                        When credit limits to not apply in the case
                        of card products the property is either not
                        present or false.

forwardAvailable        Currently not supported by ÍST {{spec_id}}.

nonInvoiced             Currently not supported by ÍST {{spec_id}}. 
----------------------------------------------------------------------------------
:Balance types returned for card resources. {#tbl:tbl_cardresource} 

# Bibliography {.unnumbered}
\ 
\ 
