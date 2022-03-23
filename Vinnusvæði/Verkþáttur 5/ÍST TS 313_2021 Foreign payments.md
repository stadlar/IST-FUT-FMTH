---
title: "ÍST TS 313:2022"
author: ICS 35.240
date: "Entry into force 25-03-2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 313]
subtitle: ["Tækniforskrift - Erlendar greiðslur  ", "Technical Specification - Foreign payments"]
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
link-citations: true
bibliography: "lib/bibliography.yaml"
csl: "lib/iso690-numeric-en.csl"
fontsize: 9pt
titlefont: Arial.ttf
...

!include-header "Vinnusvæði/Verkþáttur 5/313media/participants.yaml"

\newpage

# Foreword {.unnumbered}
!include`snippetStart="<!-- ForewordStart -->", snippetEnd="<!-- ForewordEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Introduction {.unnumbered}

!include`snippetStart="<!-- IntroductionStart -->", snippetEnd="<!-- IntroductionEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

Most of the banks offered comparable web services for foreign payments and associated transactions but until the work on the IOBWS version 3.0 started, a common specification had not been in scope for the IOBWS work. As the underlying cross-border payment mechanisms are quite similar, the TN-FMÞ decided this time around to include payment functionality and the associated account and transaction information retrieval in the form of this shared specification.

The participants in the TN-FMÞ reviewed existing and emerging specifications in the global or mostly European financial industry to look for ways to merge the various domestic schemas with a more widely adopted framework.

!include`snippetStart="<!-- Start1 -->", snippetEnd="<!-- End1 -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Scope 


!include`snippetStart="<!-- ScopeDocContextStart -->", snippetEnd="<!-- ScopeDocContextEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

!include`snippetStart="<!-- ScopePaymentsDocsContextStart -->", snippetEnd="<!-- ScopePaymentsDocsContextEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"


!include`snippetStart="<!-- ScopeEndNoteStart -->", snippetEnd="<!-- ScopeEndNoteEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Normative references, definitions, and symbols 

!include`snippetStart="<!-- TerminalogyStart -->", snippetEnd="<!-- TerminalogyEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

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

The elements listed in [table @tbl:tbl_data_domestic] are used in the domestic payment products under scope for ÍST {{spec_id}}. The schema type *paymentInitiationDomestic_json* should be used to define JSON data instances.

  -------------------------------------------------------------------------
  **Data Element**                        **SEPA -        **Cross-Border - 
                                          Credit          Credit 
                                          Transfers**     Transfers**      
  --------------------------------------- --------------- -----------------
  **endToEndIdentification**              N/A             N/A

  **instructionIdentification**           Optional        Optional

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

  **creditorAddress**                     Mandatory       Mandatory

  **ultimateCreditor**                    N/A             N/A

  **ultimateCreditorId**                  N/A             N/A

  **icelandicPurposeCode**                N/A             N/A

  **chargeBearer**                        N/A             Optional

  **remittanceInformationUnstructured**   Optional        Optional

  **remittanceInformationStructured**     N/A             N/A

  **requestedExecutionDate**              N/A             N/A

  **partialPayment**                      N/A             N/A

  **serviceLevel**                        N/A             Optional

  **centralBankPurposeCode**              Mandatory       Mandatory
  -------------------------------------------------------------------------
  :Data elements for foreign payments. {#tbl:tbl_data_domestic}

To elaborate on the use of particular attributes the following [table @tbl:proper_domestic] contains additional information on top of the schema definitions. Notes on individual data elements or usage patterns follow in the subsections.
Should further information be required, consult the matching section in the ÍST TS-310 on Domestic Payments specification.

  --------------------------------------------------------------------------------------------------------
  **Field**                               **Description**
  --------------------------------------- ----------------------------------------------------------------
  **centralBankPurposeCode**              An element mandated by the Central Bank of Iceland, using a
                                          domestic coding schema [see @centralBankCodes] that does not match any of
                                          ISO 20022 references such as the ExternalPurpose1Code used
                                          used by the purposeCode element available in the NextGenPSD2
                                          framework, but not used by ÍST {{spec_id}}.

  **serviceLevel**                        Applies to SWIFT Payments and is constrained by ISO 20022
                                          ExternalServiceLevel1Code. However
                                          only URGP is suggested for use by domestic banks, which means
                                          payment will be executed as an
                                          urgent transaction cleared through
                                          a real-time gross settlement
                                          system, which is typically
                                          identified as a wire or high value
                                          transaction. The use might be further constrained and
                                          it is therefore reccomended to consult the
                                          product documentation specific to each bank and its
                                          implementation of ÍST {{spec_id}}.
  --------------------------------------------------------------------------------------------------------
  :Detailed description of ÍST {{spec_id}} payments properties. {#tbl:proper_domestic}

## Bulk Payments

Bulk payments are supported for all ÍST {{spec_id}} payment types. For a bulk payment all collected payments shall be based on the same payment product and initiated from the same debtor account, consistent with the approach of the NextGenPSD2 framework for native bulk types. The *bulkPaymentInitiationDomestic_json* schema type should be used for the top level bulk initiation according to ÍST {{spec_id}} and the *paymentInitiationBulkElementDomestic_json* type for the child payments contained in an array on the parent.

No debtor or charge accounts should be specified on child bulk payment elements, as batch booking applies to all cross-border payment bulks with the implication that there is only one withdraval on the deptor side.

  ------------------------------------------------------------------------------------------
  **Data Element**            **Type**      **Condition**   **Description**
  --------------------------- ------------- --------------- --------------------------------
  **batchBookingPreferred**    Boolean       N/A            All foreign payments are
                                                            implicitly processed as 
                                                            bulk payments, so this element
                                                            should no be included or set to
                                                            true.

  **debtorAccount**            Account       Mandatory      No child payments may contain 
                               Reference                    a debtor account, only this top
                                                            parent bulk element.

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

  **requestedExecutionDate**   ISODate       N/A            Not applicable to foreign
                                                            payments.

  **payments**                 Bulk Entry    Mandatory      The Bulk Entry is a JSON Type
                                                            which mirrors the supported
                                                            domest payment products for
                                                            single payments, excluding the
                                                            data elements: debtorAccount,
                                                            requestedExecutionDate and
                                                            chargesAccount.

  **chargesAccount**          Account       Optional        Set if fees applicable to 
                              Reference                     foreign payments should be
                                                            debited to another account
                                                            than the debtorAccount. 
  ---------------------------------------------------------------------------------------
  :Description of domestic bulk payment main body. {#tbl:bulk_domestic}

## Payment Bulk Errors

!include`snippetStart="<!-- ErrorHandlingStart -->", snippetEnd="<!-- ErrorHandlingEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"  

ÍST 310 should be referenced as to further information on how errors are displayed.

# Accounts Service

The way account transaction information is retrieved bears strong similarities to the previous versions of IOBWS while adapted from the Berlin Group NextGenPSD2 framework. The canonical source for the Account Service is ÍST 310. 

# Payment processing flow 

![IOBWS authorisation flow with confirmation](lib/media/authtflow1.eps){.calloutright #fig:auth_flow1 width="60%"}

!include`snippetStart="<!-- PaymentsProcessingBegin -->", snippetEnd="<!-- PaymentsProcessingEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"
``` {.json caption="Example of a response containing a link to the confirmation resource."}    
  { 
    "transactionStatus": "RCVD",
    "paymentId": "1234-b2b-983",
    "_links": 
      {
        "self": {"href": "/v1/payments/cross-border-credit-transfers/1234-b2b-983"},
        "status": {"href": "/v1/payments/1234-b2b-983/status"},
        "scaStatus":": {"href": "/v1/payments/1234-b2b-983/authorisations/123auth456"},  
        "confirmStraightThroughProcessingAuthorisation": {"href": "/v1/payments/1234-b2b-983/authorisations/123auth456"}
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
      "status":  {"href":"/v1/payments/cross-border-credit-transfers/1234-b2b-983/status"}
    }
  }
```

Optionally the links given can be used to check the status of payments, resulting in the response below. The transaction status expected is "ACSC", which stands for "AcceptedSettlementCompleted" indicating the debtors accounts has been settled. However, as mentioned before the full range of codes are available and could potentially apply.

``` {.json caption="Example of a payment status query response."}    
  {
  "transactionStatus": "ACSC"
  }
```


# Bibliography {.unnumbered}
\ 
\ 
