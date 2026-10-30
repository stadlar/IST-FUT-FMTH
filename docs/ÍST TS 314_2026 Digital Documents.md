---
title: "ÍST TS 314:2026"
author: ICS 35.240, 3.060
date: "Entry into force 02-12-2026"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 314]
subtitle: ["Tækniforskrift - Rafræn skjöl", "Technical specification - Digital Documents"]
lang: "en"
titlepage: true
# titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "lib/istfrontpage.pdf"
backcover: "lib/istbackpage.pdf"
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

!include`snippetStart="<!-- ForewordStart -->", snippetEnd="<!-- ForewordEnd -->"` "docs/commonMedia/preliminary.md"

# Introduction {.unnumbered}

!include`snippetStart="<!-- IntroductionStart -->", snippetEnd="<!-- IntroductionEnd -->"` "docs/commonMedia/preliminary.md"

The ÍST {{spec_id}} is the successor to the {{previous_spec}} specification, defining services that encapsulate the system previously known as *Birtingur* and now as *ARK-kerfið*. This system has since the year 2000 enabled enterprises in Iceland to upload information for display based on templates in all of the domestic banks' online user interfaces. This edition, IOBWS version 3.2, redesigns the contract to align with the underlying RB Documents API and with the REST patterns established in ÍST TS 315 Claims. Documents are created and retrieved individually, batches are modelled as a separate resource, cross-references are addressable resources, and error responses follow the common IOBWS error model. See [subsection @sec:svc_overview] for further details.

The ÍST {{spec_id}} specification should be viewed as standalone though part of the IOBWS version 3 framework and adapting the same REST patterns established in the OpenAPI contracts that are part of version 3. It should be emphasized that ÍST {{spec_id}} is not part of NextGenPSD2 framework nor is it in any way related to the PSD2 regulation. The patterns shared by the IOBWS version 3 specifications may however result in some of the elements and types in ÍST {{spec_id}} having similarities to parts of the NextGenPSD2 framework. Attribution applies to these as required by the CC BY 4.0 license of the NextGenPSD2 OpenApi specification.

# Scope

<!-- ScopeDocContextStart -->
ÍST {{spec_id}} defines web application programming interfaces implemented by Icelandic commercial and savings banks to expose shared functionality and information for {{context_short}}, under the Icelandic Online Banking Web Services (IOBWS) framework of specifications.
<!-- ScopeDocContextEnd -->

<!-- ScopePaymentsDocsContextStart -->
Other ÍST Technical Specifications exist that address related but discrete units of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and shared concerns are addressed in the workshop agreement ÍST TS 316. As the consumption and implementation of each part of IOBWS are optional, the documents aim to be independent of each other.

The focus in ÍST {{spec_id}} is the features needed to create and amend digital documents.

The intended audience for the specification document ÍST {{spec_id}} is developers who will either implement banking API services or the systems that will consume them as API clients. The reader is expected to have a basic understanding of the Icelandic financial products involved. Further documentation on business aspects of those products will be available from each bank, as they may involve service agreements and the end customers' contractual preferences and benefits.
<!-- ScopePaymentsDocsContextEnd -->

Out of necessity, the previous IOBWS technical specifications largely consisted of expressing the intent and actual content in a human-readable format, otherwise found in the associated XML Schema and SOAP definitions. 
The expectation for ÍST {{spec_id}} is that the technical service definitions and JSON data schemas in the accompanying OpenAPI specification can be understood using utilities that can convert them into documentation or navigable user interfaces.

<!-- ScopeEndNoteStart -->
Consequently, the ÍST {{spec_id}} specification avoids the unnecessary repetition of information found in the technical contract "[{{yaml_definition}}](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/{{yaml_definition}})". Instead, the document focuses on the information needed to understand the domestic context of services, schema types and service flows required to implement ÍST {{spec_id}}.
<!-- ScopeEndNoteEnd -->

# Normative references, definitions and data elements 

<!-- TerminalogyStart -->
## Normative references

The following documents are referenced in ÍST {{spec_id}}, as part of their content constitutes the requirements of this document. If newer editions exist, only the edition cited applies.

NextGenPSD2 v1.3.8. *The Berlin Group NextGenPSD2 Access to Account Framework*.

OpenAPI v3.0.1. The OpenAPI Specification (OAS) by the OpenAPI Initiative, a Linux Foundation Collaborative Project.

## Terms and definitions

- **ARK-kerfið** is the system owned and operated by Reiknistofa bankanna (RB), for storing and displaying data based on specified templates or whole documents. Previously the system was owned by Greiðsluveitan ehf and known domestically under the name Birtingur.
- **Birtingur**: see *ARK-kerfi*.
- **Checkfree**: see *ARK-kerfi*.
- **Document** is a PDF or XML file submitted by a sender for display to an owner. It is identified by an identifier assigned by the implementation, which clients must treat as an opaque string.
- **Document type** is a registration, per sender, of the category, file type and contact email that documents are created under.
- **Sender** is the enterprise, identified by kennitala, that submits documents.
- **Owner** is the customer, identified by kennitala, to whom a document is displayed.
- **Batch** is a set of documents submitted in one request and processed asynchronously.
- **Cross-reference** links a document to another object, such as a claim, credit transfer or payment request, identified by a key type and a key.
- **Durable medium** (ic. *varanlegur miðill*) refers in the context of ÍST {{spec_id}} to the storage of a document digitally, as a record that cannot be altered and is stored long-term. Current systems guarantee this for at least 7 years. The definition refers to usage in Icelandic law, where the record is permanent after the display to the user and is enforced in the contractual relationship between those institutions with permissions to interface with the ARK-system and RB.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland. It is used to identify the sender and receiver of digital documents.
- **NextGenPSD2 Access to Accounts Framework** (**NextGenPSD2 Framework** or just **NextGenPSD2**) is the framework established by *the Berlin Group* to define a common PSD2 compliance interface [@NextGenPSD2]. Since then, parts of the framework have extended beyond compliance and into other Open Banking aspects.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.

<!-- TerminalogyEnd -->

\newpage

# Implementation

## Service Overview {#sec:svc_overview}

<!-- SvcOverview|Start -->
The functionality offered by the service endpoints is described in the [table @tbl:tbl_offered_services].

| **Service**      | **Description**                                                                                                   |
|------------------|-------------------------------------------------------------------------------------------------------------------|
| Document Types   | Register and list the document types a sender may create documents under.                                         |
| Documents        | Create a single document, search documents and retrieve a single document.                                        |
| Batches          | Submit documents in bulk, search batches and retrieve batch status and items.                                     |
| Cross-References | Create, read, update and delete cross-references between documents and other objects such as claims and payments. |

:Service on offer. {#tbl:tbl_offered_services}

The subsequent section describes the functionality offered by the service.
<!-- SvcOverview|End -->

### Document Service

Documents are created one at a time or in batches and are retrieved by identifier or by search. Storage in the *ARK-system* is a durable medium and this edition offers no operation to alter a document after creation.

The batch endpoints are included as a design target. The underlying implementation is not yet available and the batch contract may change in a later edition.

### API Endpoints

#### Document Types

- **GET** `/v1/senders/{sender-id}/document-types` – Retrieve the document types registered for a sender.
- **POST** `/v1/senders/{sender-id}/document-types` – Register document types for a sender.

#### Documents

- **POST** `/v1/documents` – Create a single document.
- **GET** `/v1/documents` – Search documents by owner, sender, type and date.
- **GET** `/v1/documents/{document-id}` – Retrieve a single document.

#### Batches

- **GET** `/v1/batches` – Search batches.
- **POST** `/v1/batches` – Create a batch of documents.
- **GET** `/v1/batches/{batch-id}` – Retrieve the status of a batch.
- **GET** `/v1/batches/{batch-id}/items` – Retrieve the documents in a batch.

#### Cross-References

- **POST** `/v1/crossreferences` – Create cross-references.
- **POST** `/v1/crossreferences/bulk-delete` – Delete cross-references in bulk.
- **GET** `/v1/crossreferences/{key-type}/{key}` – Retrieve the cross-references for a key.
- **GET** `/v1/documents/{document-id}/crossreferences` – Retrieve the cross-references for a document.
- **GET** `/v1/documents/{document-id}/crossreferences/{key-type}/{key}` – Retrieve a single cross-reference.
- **PATCH** `/v1/documents/{document-id}/crossreferences/{key-type}/{key}` – Update a single cross-reference.
- **DELETE** `/v1/documents/{document-id}/crossreferences/{key-type}/{key}` – Delete a single cross-reference.

# Bibliography {.unnumbered}
\ 
\ 
