---
title: "ÍST TS 313:2021"
author: ICS 03.060 and 35.240
date: "Entry into force 15-03-2021"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 313]
subtitle: ["Tækniforskrift - Innlendar Erlendar greiðslur", "Technical Specification - Foreign payments"]
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
mustache: "Vinnusvæði/Verkþáttur 5/313media/docvariables.yml"
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

Previous versions of IOBWS, released in 2007 and 2013 respectively, defined common web service interfaces for the Icelandic commercial and savings banks. This enabled the integration of external accounting, payment, and information systems with the bank's services, to act on behalf of the customers and with full access to their data, e.g. for domestic accounts and payments. 

All the banks have offered comparable services for foreign payments and associated transaction but until the work on the IOBWS version 3.0 started, they had not been under scope for the common specifications. This time around it was decided by the TN-FMÞ that it was time to open up initiation of, and information on foreign payments in the form of access to account statements.

The participants in the TN-FMÞ reviewed existing and emerging specifications in the global or mostly European financial industry to look for ways to merge the various domestic schemas with a more widely adpoted framework.

!include`snippetStart="<!-- Start1 -->", snippetEnd="<!-- End1 -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Scope 


!include`snippetStart="<!-- ScopeDocContextStart -->", snippetEnd="<!-- ScopeDocContextEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

!include`snippetStart="<!-- ScopePaymentsDocsContextStart -->", snippetEnd="<!-- ScopePaymentsDocsContextEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"


!include`snippetStart="<!-- ScopeEndNoteStart -->", snippetEnd="<!-- ScopeEndNoteEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Normative references, definitions, and symbols 

!include "Vinnusvæði/Verkþáttur 5/310and313media/terminalogy.md"

\newpage

# Implementation

## Service Overview

!include`snippetStart="<!-- PaymentSvcOverviewStart -->", snippetEnd="<!-- PaymentSvcOverviewEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

## Payment Initiation Service

### Overview {#sec:pis_overview}

The {{context_short}} products supported by ÍST {{spec_id}} are as shown in [table @tbl:tbl_svcsupport] below. All those are defined as JSON objects, and other payment types are not supported by the specification.

As instant credit transfers are the only available type in Iceland for account to account transfers, the name is simply Credit Transfers. That does not preclude additional business rules applying for e.g. high-value payments within each bank, or there being different stages in payment flows within e.g. 'end-of-business-day' periods. This could result in service consumers being exposed to transaction status codes reflecting intermediary steps in payment execution, some of which have not previously been visible or mapped in IOBWS return codes. Later changes in CB systems and CMS might also affect the scope of statuses returned so consumers, so all of the available by the specification should be expected.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **SEPA - Credit Transfers**     | Payments using the Single European Payment Area Credit Transfer (SEPA) schema.                         |
| **Cross-Border - Credit Transfers**       | Cross Border Payments, using the Society for Worldwide Interbank Financial Telecommunication (SWIFT) Network. |
:Foreign payment products. {#tbl:tbl_pis_products}

For each of the payment products, the support for payment services is given in [table @tbl:pay_avail_svc]. At this time, behaviour for periodic payments is not support by the ÍST {{spec_id} for foreign payments.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **payments**             | Supported by all implementators of {{spec_id}} in accordance with the specification, for domestic adaptation of foreign payment products.                         |
| **bulk-payments**        | Supported by all implementators of {{spec_id}} in accordance with the specification, for domestic adaptation of foreign payment products. |
| **periodic-payments**    | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract. |
:Availability of payment service. {#tbl:pay_avail_svc}

### Domestic Payment Product Data Elements 

The following elements are used in the domestic payment products under scope for ÍST {{spec_id}}:

  --------------------------------------------------------------------------------
  **Data Element**                    **SEPA -        **Cross-Border - 
                                      Credit          Credit 
                                      Transfers**     Transfers**      
  ----------------------------------- --------------- ----------------------------
  endToEndIdentification              n.a             n.a

  debtorAccount                       Mandatory       Mandatory

  debtorId                            n.a             n.a

  chargesAccount                      Optional        Optional

  ultimateDebtor                      n.a             n.a

  ultimateDebtorId                    n.a             n.a

  instructedAmount                    Mandatory       Mandatory

  creditorAccount                     Mandatory       Mandatory

  creditorAgent                       n.a.            Optional

  creditorAgentAddress                n.a.            Optional

  creditorName                        Mandatory       Mandatory

  creditorId                          n.a             n.a

  creditorAddress                     Optional        Mandatory

  ultimateCreditor                    n.a             n.a

  ultimateCreditorId                  n.a             n.a

  icelandicPurposeCode                n.a             n.a

  chargeBearer                        Optional        Optional

  remittanceInformationUnstructured   Optional        Optional

  remittanceInformationStructured     n.a             n.a

  requestedExecutionDate              n.a             n.a

  partialPayment                      n.a             n.a

  serviceLevel                        n.a.            Optional

  centralBankPurposeCode              Mandatory       Mandatory
  --------------------------------------------------------------------------------
  :Data Elements for Domestic payments. {#tbl:tbl_data_domestic}

To elaborate on the use of particular attributes the following [table @tbl:proper_domestic] contains additional information on top of the schema defenitions. Notes on individual data elements or usage patterns follow in the subsections. 


  ---------------------------------------------------------------------------------------------------------
  Field                                   Description
  --------------------------------------- -----------------------------------------------------------------
  serviceLevel                           Applies to SWIFT Payments using ISO ExternalServiceLevel1Code 
                                         but only SDVA and URGP are suggested for use by domestic banks,
                                         as described in [table @tbl:ext_svclvl_codes].
  ------------------------------------------------------------------------------------------
  :Detailed description of ÍST {{spec_id}} payments properties. {#tbl:proper_domestic}

Below are the codes suggested for use in service level preferences for SWIFT (Cross-Border) credit-transfers. The use might be further constrained so consulting specific product documentation that applies to each banks implementation of ÍST {{spec_id}} is reccomended.

  -----------------------------------------------------------------------
  Code              Name              Definition
  ----------------- ----------------- -----------------------------------
  SDVA              SameDayValue      Payment must be executed with same
                                      day value to the creditor.

  URGP              Urgent Payment    Payment must be executed as an
                                      urgent transaction cleared through
                                      a real-time gross settlement
                                      system, which is typically
                                      identified as a wire or high value
                                      transaction.
  -----------------------------------------------------------------------
  :Suggested External Service Level Codes. {#tbl:ext_svclvl_codes}


## Bulk Payments

Bulk payments are supported for all ÍST {{spec_id}} payment types. For a bulk payment all collected payments shall be based on the same payment product and initiated from the same debtor account, consistent with the approach of the NextGenPSD2 framework.

  ---------------------------------------------------------------------------------------
  **Data Element**         **Type**      **Condition**   **Description**
  ------------------------ ------------- --------------- --------------------------------
  batchBookingPreferred    Boolean       n.a        

  debtorAccount (incl.     Account       Mandatory       
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

  requestedExecutionDate   ISODate       n.a       

  requestedExecutionTime   ISODateTime   n.a        

  payments                 Bulk Entry    Mandatory       The Bulk Entry is a JSON Type
                                                         which mirrors the supported
                                                         domest payment products for
                                                         single payments, excluding the
                                                         data elements: debtorAccount,
                                                         and requestedExecutionDate. 
  ---------------------------------------------------------------------------------------
  :Description of domestic bulk payment main body. {#tbl:bulk_domestic}

# Accounts