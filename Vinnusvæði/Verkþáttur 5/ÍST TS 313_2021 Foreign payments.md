---
title: "ÍST TS 313:2021"
author: ICS 03.060 and 35.240
date: "Entry into force 15-03-2021"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 313]
subtitle: ["Tækniforskrift - Erlendar greiðslur", "Technical Specification - Foreign payments"]
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

This Technical Specification (TS) presents version 3.0 of the Icelandic Online Banking Web Services (IOBWS), for {{context_short}}.

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

The {{context_short}} products supported by ÍST {{spec_id}} are as shown in [table @tbl:tbl_pis_products] below. All those are defined as JSON objects, and other payment types are not supported by the specification.

Variations in procedures for foreign payments will apply within each bank e.g. concerning routing or acceptance flows. Accordingly, service consumers should expect all of the available payment processing statuses to apply per the specification.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **SEPA - Credit Transfers**     | Payments using the Single European Payment Area Credit Transfer (SEPA) schema.                         |
| **Cross-Border - Credit Transfers**       | Cross Border Payments, using the Society for Worldwide Interbank Financial Telecommunication (SWIFT) Network. |
:Foreign payment products. {#tbl:tbl_pis_products}

For each of the payment products, the support for payment services is given in [table @tbl:tbl_pay_avail_svc]. At this time, behaviour for periodic payments is not supported by the ÍST {{spec_id}} for foreign payments.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **payments**             | Supported by all implementors of {{spec_id}} in accordance with the specification, for domestic adaptation of foreign payment products.                         |
| **bulk-payments**        | Supported by all implementors of {{spec_id}} in accordance with the specification, for domestic adaptation of foreign payment products. |
| **periodic-payments**    | Explicitly not part of the {{spec_id}} specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract. |
:Availability of payment service. {#tbl:tbl_pay_avail_svc}

### Domestic Payment Product Data Elements 

The following elements are used in the domestic payment products under scope for ÍST {{spec_id}}:

  -------------------------------------------------------------------------
  **Data Element**                        **SEPA -        **Cross-Border - 
                                          Credit          Credit 
                                          Transfers**     Transfers**      
  --------------------------------------- --------------- -----------------
  **endToEndIdentification**              N/A             N/A

  **debtorAccount**                       Mandatory       Mandatory

  **debtorId**                            N/A             N/A

  **chargesAccount**                      Optional        Optional

  **ultimateDebtor**                      N/A             N/A

  **ultimateDebtorId**                    N/A             N/A

  **instructedAmount**                    Mandatory       Mandatory

  **creditorAccount**                     Mandatory       Mandatory

  **creditorAgent**                       N/A             Optional

  **creditorAgentAddress**                N/A             Optional

  **creditorName**                        Mandatory       Mandatory

  **creditorId**                          N/A             N/A

  **creditorAddress**                     Optional        Mandatory

  **ultimateCreditor**                    N/A             N/A

  **ultimateCreditorId**                  N/A             N/A

  **icelandicPurposeCode**                N/A             N/A

  **chargeBearer**                        Optional        Optional

  **remittanceInformationUnstructured**   Optional        Optional

  **remittanceInformationStructured**     N/A             N/A

  **requestedExecutionDate**              N/A             N/A

  **partialPayment**                      N/A             N/A

  **serviceLevel**                        N/A             Optional

  **centralBankPurposeCode**              Mandatory       Mandatory
  -------------------------------------------------------------------------
  :Data elements for foreign payments. {#tbl:tbl_data_domestic}

To elaborate on the use of particular attributes the following [table @tbl:proper_domestic] contains additional information on top of the schema defenitions. Notes on individual data elements or usage patterns follow in the subsections. 


  --------------------------------------------------------------------------------------------------------
  **Field**                               **Description**
  --------------------------------------- ----------------------------------------------------------------
  **serviceLevel**                        Applies to SWIFT Payments using ISO ExternalServiceLevel1Code 
                                          but only SDVA and URGP are suggested for use by domestic banks,
                                          as described in [table @tbl:ext_svclvl_codes].
  --------------------------------------------------------------------------------------------------------
  :Detailed description of ÍST {{spec_id}} payments properties. {#tbl:proper_domestic}

Below are the codes suggested for use in service level preferences for SWIFT (Cross-Border) credit-transfers. The use might be further constrained so consulting specific product documentation that applies to each banks implementation of ÍST {{spec_id}} is reccomended.

  -----------------------------------------------------------------------
  **Code**          **Name**          **Definition**
  ----------------- ----------------- -----------------------------------
  **SDVA**          SameDayValue      Payment must be executed with same
                                      day value to the creditor.

  **URGP**          Urgent Payment    Payment must be executed as an
                                      urgent transaction cleared through
                                      a real-time gross settlement
                                      system, which is typically
                                      identified as a wire or high value
                                      transaction.
  -----------------------------------------------------------------------
  :Suggested external service level codes. {#tbl:ext_svclvl_codes}


## Bulk Payments

Bulk payments are supported for all ÍST {{spec_id}} payment types. For a bulk payment all collected payments shall be based on the same payment product and initiated from the same debtor account, consistent with the approach of the NextGenPSD2 framework.

  ------------------------------------------------------------------------------------------
  **Data Element**            **Type**      **Condition**   **Description**
  --------------------------- ------------- --------------- --------------------------------
  **batchBookingPreferred**    Boolean       N/A        

  **debtorAccount (incl.       Account       Mandatory       
  type)**                      Reference                     

  **paymentInformationId**     Max35Text     Optional       Unique identification assigned 
                                                            by the sending party to
                                                            unambiguously identify this bulk
                                                            payment. Replaces 
                                                            **NameOfBatch** in IOBWS v2.0 and
                                                            **PaymentsID**, that was generated
                                                            by the receiving bank.
                                                            Note: This attribute might be
                                                            considered mandatory in future
                                                            versions of the specification.

  **requestedExecutionDate**   ISODate       N/A       

  **requestedExecutionTime**   ISODateTime   N/A        

  **payments**                 Bulk Entry    Mandatory      The Bulk Entry is a JSON Type
                                                            which mirrors the supported
                                                            domest payment products for
                                                            single payments, excluding the
                                                            data elements: debtorAccount,
                                                            and requestedExecutionDate. 
  ---------------------------------------------------------------------------------------
  :Description of domestic bulk payment main body. {#tbl:bulk_domestic}

# Accounts


!include`snippetStart="<!-- AccountsOverviewBegin -->", snippetEnd="<!-- AccountsOverviewEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"