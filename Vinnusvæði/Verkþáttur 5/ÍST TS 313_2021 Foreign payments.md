---
title: "ÍST TS 313:2021"
author: ICS 03.060 and 35.240
date: "Entry into force 2021-3-15"
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
listings-no-page-break: false
highlight: "zenburn"
include-before: |
  Participants in TN-FMÞ Financial services (is. Fjármálaþjónusta) during the development of  
  ÍST TS 313 Foreign payments.

  -------------------------------------------------------------------------------------------------
  Name                         Company / \              Name                        Company / \                 
                               organisation / \                                     organisation / \             
                               association                                          association                
  ---------------------------- ------------------------ --------------------------- ----------------
  Árni Geir Valgeirsson        Íslandsbanki             Ingveldur Lárusdóttir        Landsbankinn                                                                                                                                      
                                                                                                                                  
  Ásgeir Helgi Jóhannsson      Ekkibanki, Atlas lögmenn Jóhannes Þór Ágústarson      Íslandsbanki                                                                                                                                       
                                                                                                                                                                              
  Atli Guðmundsson             Rapyd, Kortaþjónustan    Kristinn Stefánsson          Arion banki                                                                                                                                    
                                                                                                                                                                              
  Bergljót Kristinsdóttir      ICEPRO                   Markús Guðmundsson           Unimaze                                                                                                                          
                                                                                                                                                                              
  Bjarni Þór Pálsson           RB                       Ólafur Tryggvason            Advania                                                                                                                      
                                                                                                                                                                              
  Björgólfur G Guðbjörnsson    Origo                    Sigrún Gunnarsdóttir         WISE                                                                                                                             
                                                                                                                                                                              
  Gísli Konráð Björnsson       Landsbankinn             Sigurður Gauti Hauksson      Alskil                                                                                                                                 
                                                                                                                                                                              
  Guðjón Karl Arnarson         RB                       Sigurður Másson              Advania                                                                                                                      
                                                                                                                                                                              
  Guðmundur Jón Halldórsson    CTL                      Styrmir Kristjánsson         Independent                                                                                                                    
                                                                                                                                                                              
  Halldór Vagn Hreinsson       Landsbankinn             Sveinn G. Gunnarsson         Landsbankinn                                                                                                                           
                                                                                                                                                                              
  Halldór Pétursson            Fjármálaeftirlitið       Védís Ingólfsdóttir          Arion banki                                                                                                                                  
                                                                                                                                                                              
  Hermann Snorrason            Landsbankinn             Védís Sigurðardóttir         Landsbankinn                                                                                                                           
                                                                                                                                                                              
  Hjálmar Brynjólfsson         Seðlabanki Íslands       Sigurvin Sigurjónsson        KPMG                                                                                                                                         
                                                                                                                                  
  Hrannar Már Hallkelsson      Arion banki                                                                                                                                      
                                                                                                                                                                                                                                                        
  -----------------------------------------------------------------------------------------------

  © Icelandic Standards (IST) 2021. All Rights Reserved.  
  
  Without the written permission of the publisher, this technical
  specification document may not be reprinted or reproduced in any form by 
  any means, mechanical or electronic, such as by photocopying, sound recording or
  other means, currently known or later invented, nor may the agreement
  be disseminated through an electronic database. 

  1\. edition

  # Foreword

  This ÍST Technical Specification was developed in accordance with "ÍST
  Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.*
  IST rules on Technical Specifications, Technical Reports and Workshop
  Agreements). The TS (Technical specification) was prepared by the
  technical committee TN-FMÞ (The Technical Committee on Financial 
  Services) that operates within FUT (Sector committee for ICT
  standardisation) following a public call for participation within
  TN-FMÞ. Committee draft was sent to TN-FMÞ on the 2020-12-08 and
  approved by correspondence on the 2020-12-22.
  The text of ÍST TS-313 was submitted to IST for publication on 2021-02-02.

  The work on the ÍST TS was primarly funded by Íslandsbanki, Arion Banki and 
  Landsbankinn, with participation by Alskil hf, Eignaumsjón hf, 
  Payday ehf, Wise lausnir ehf and Seðlabanki Íslands. 

  This ÍST TS is the result of work by the workgroup TN-FMÞ-VH-1
  Business claims.

  ÍST TS-313 is not subject to any patent rights. It is based on the Berlin Group's
  NextGenPSD2 XS2A Framework, which is distributed under a Creative Commons
  Attribution 4.0 International Public License (CC BY).

  This means that the underlying Specification for ÍST TS-313 can be copied and redistributed in any
  medium or format for any purpose, even commercially, and when shared,
  that appropriate credit must be given, a link to the license must be
  provided, and indicated if changes were made. You may do so in any
  reasonable manner, but not in any way that suggests the licensor
  endorses you or your use. In addition, if you remix, transform, or build
  upon the Specification, you may not distribute the modified
  Specification.

  The Technical Committee's participants have made every effort to ensure
  the reliability and accuracy of the technical and non-technical content
  of ÍST TS-313, but this does not guarantee, either explicitly or
  implicitly, its correctness. Users of ÍST TS-313 should be aware that
  neither the TN-FMÞ, nor IST can be held liable for damages or losses of
  any kind whatsoever which may arise from its application. Users of ÍST
  TS-313 do so on their own responsibility and at their own risk.

# Introduction {.unnumbered}

This Technical Specification (TS) is written to present a preferred way
to implement foreign payments according to the requirements of the
Icelandic banks. In addition, banks are free to have this TS in mind
when implementing their PSD2 technical specifications.

API interfaces enable accounting systems, payment systems, information
systems and other systems to exchange data with the banks without
registering in traditional online banking. An example of exchanging data
with the banks can be through the accounting systems interface. With a
click of a button in the accounting system, exchange of data is
performed by the system in the background and latest relevant data is
shown in the accounting system.

The Icelandic banks together with RB (Clearing House of Iceland),
Central Bank of Iceland, software companies, billing companies, fintech
companies and other stakeholders within the TN FMÞ at the Icelandic
Standards Council have written a standard on how the banks should
conduct electronic interconnection in the construction of interfaces
APIs. The first version of that standard was published in 2007 and was
named IOBWS (Icelandic Online Banking Web Service). Six years later,
version 2, IOBWS 2.0 of the standard was published. The work was
developed to make corrections and upgrade to business operations that
were not foreseen in the earlier standard. This document describes the
partial results of the third phase of the third IOBWS project, IOBWS
3.0.

It was decided on a TN-FMÞ meeting to give fintech companies and other
stakeholders the ability to get more detailed information about foreign
payments. This ability will support requesting information details and
statement detail about all foreign payments.

This document is based on the results from the working group of the
TN-FMÞ, VH-1 Financial claims. The following technical specification
describes domestic extensions to Berlin-group NextGenPSD2 technical
specifications version 1.3.6.

#. Scope 

The joint effort to create third version of the IOBWS (Icelandic Online
Banking Web Service) is described in ÍST-WA-310. This document describes
the foreign payments products and is a part of the third version of
IOBWS that will also support the domestic implementation of the Payment
Service Directive (EU 2015/2366, also known as PSD2).

This document reflects the agreement made by TN-FMÞ and is based on the
analysis of the working group TN-FMÞ-VH1 business claims.

#. Normative references, definitions, and symbols 

## Definitions 

-   **Kennitala**: The Icelandic identification number (Icelandic:
    kennitala, abbreviated kt.) is a unique national identification
    number used by the Icelandic government to identify individuals and
    organisations in Iceland.

-   **Icelandic IBAN** definition
    <https://en.wikipedia.org/wiki/International_Bank_Account_Number>
    ISO 13616:1997

-   **ISO 20022** is an ISO standard for electronic data interchange
    between financial institutions.

-   **eIDAS** -- Regulation (EU) No 910/2014 of the European Parliament
    and of the Council of 23 July 2014 on electronic identification and
    trust services for electronic transactions in the internal market
    and repealing Directive 1999/93/EC

-   **AISP** -- Account Information Service Provider -- Being an
    authorised AISP means that business can ask for permission to
    connect to a bank account and use that bank account information to
    provide a service.

-   **PISP** -- Payment Initiation Service Provider -- Businesses that
    are authorised PISP's can ask for permission to connect to a bank
    account and initiate payments on the customer's behalf, from their
    bank account.

-   **3D** -- 3D Secure (3DS) is an additional layer of security for
    online credit and debit card payments -- the most well-known
    examples being Verified by Visa, Mastercard Secure-Code and American
    Express Safe-Key. At the final stage of checkout, it asks the buyer
    for a password so the bank can authorise the payment.

-   **IOBWS 3.0** -- This is the acronym of the third version of the
    Icelandic Open Banking Web Services project and its product.

-   **FUT** is the IT sector council at Icelandic standards.

-   **TN-FMÞ** - Technical committee on finance services, working under
    FUT.

-   **Berlin group** -- The \'Berlin Group\' is a pan-European payments
    interoperability standards and harmonisation initiative with the
    primary objective of defining open and common scheme- and
    processor-independent standards in the inter-banking domain between
    Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the
    work carried out by e.g., the European Payments Council. As such,
    the Berlin Group has been established as a pure technical
    standardisation body, focusing on detailed technical and
    organisational requirements to achieve this primary objective.

-   **NextGenPSD2 framework - PSD2** -- With \[PSD2\] the European Union
    has published a new directive on payment services in the internal
    market. Among others \[PSD2\] contains regulations of new services
    to be operated by so-called Third-Party Payment Service Providers
    (TPP) on behalf of a Payment Service User (PSU). These new services
    are:

    -   **Payment Initiation Service** (PIS) to be operated by a Payment
        Initiation Service Provider (PISP) TPP as defined by article 66
        of \[PSD2\]

    -   **Account Information Service** (AIS) to be operated by an
        Account Information Service Provider (AISP) TPP as defined by
        article 67 of \[PSD2\], and

    -   **Confirmation of the Availability of Funds Service** to be used
        by Payment Instrument Issuing Service Provider (PIISP) TPP as
        defined by article 65 of \[PSD2\].

-   **PSU** -- Payment Service User. The end-user of payment service.

-   **SCA** -- Strong Customer Authentication. Defined by the EBA in its
    RTS on SCA as "an authentication based on the use of two or more
    elements categorised as knowledge (something only the user knows
    \[for example, a password\]), possession (something only the user
    possesses \[for example, a particular cell phone and number\]) and
    inherence (something the user is \[or has, for example, a
    fingerprint or iris pattern\]) that are independent, \[so\] the
    breach of one does not compromise the others, and is designed in
    such a way as to protect the confidentiality of the authentication
    data."

-   **Payment service directive** -- PSD2 overview.

![](./313media/image2.png){width="4.175999562554681in"
height="2.0937707786526683in"}

## Definition of the foreign payment products

The following elements are used to define the foreign payment product.
It is important to understand the meaning of each element to see how it
fits in the big picture:

The Icelandic domestic requirements are defined in Annex A.1. and A.2.

#. Icelandic domestic adaptions 

This chapter concludes the domestic adaptation to the foreign payment
products and data model changes.

## Foreign payments products

The workgroup concluded to define the following foreign products
product, defined in detail in Annex:

-   **SEPA credit transfers:** SEPA credit transfer for single or bulk
    payment. Periodic payments are not supported.

-   **Cross border credit transfers**: SWIFT payments

## Functional changes & data model changes

The Icelandic adaption to the Berlin Group data model NextGenPSD2
framework is described in the latest version of the document
IOBWS3-0.yaml located at
https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables

# Presumptions, future work, maintenance 

## Presumptions

The Icelandic financial sector wants to have unified way to perform
foreign payments within the SEPA or cross border.

## **Future work**

-   TN-FMÞ has the intention to keep working on developing this document
    amongst others developed in the IOBWS 3.0 project based on domestic
    needs and Berlin Group changes of cited documents.

-   TN-FMÞ have arranged for that the delivery of the YAML document will
    in the Github location
    https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables

## Maintenance

As other products of the IOBWS 3.0 project will the maintained by
TN-FMÞ.

TN FMÞ agrees that FUTs Github
(<https://github.com/stadlar/IST-FUT-FMTH/issues>) should be used in
this maintenance task and issues shall be raised and processed by
TN-FMÞ.

# Annex A {-}

The following annex extends the Berlin group document:

*NextGenPSD2 Access to Account Interoperability Framework -
Implementation Guidelines V1.3.6_20200203.pdf*

and has been modified to fulfil the Icelandic foreign payments
requirements.

The Icelandic foreign payment products are as follows:

## A.1 Single payment products {-}

### A.1.1 Single payment {-}

Generic Body for a payment initiation via JSON.

This generic JSON body can be used to represent valid payment
initiations for the following JSON based payment product, which were
defined in the Implementation Guidelines:

-   sepa-credit-transfers

-   cross-border-credit-transfers

  -----------------------------------------------------------------------------------------
  Data Element             Type                          SEPA credit       Cross border
                                                         transfers         credit transfers
  ------------------------ ----------------------------- ----------------- ----------------
  debtorAccount            Account Reference             Mandatory         Mandatory

  chargesAccount           Account Reference             Optional          Optional

  instructedAmount         Amount                        Mandatory         Mandatory

  creditorAccount          Account Reference             Mandatory         Mandatory

  creditorName             Max70Text                     Mandatory         Mandatory

  creditorAddress          Address                       Optional          Mandatory

  creditorAgent            BICFI                         n/a               Optional

  creditorAgentAddress     Address                       n/a               Optional

  chargeBearer             ChargeBearer                  Optional          Optional

  serviceLevel             Service Level Code            n/a               Optional
                           ExternalServiceLevel1Code\*                     

  centralBankPurposeCode   CentralBankPurpose            Mandatory         Mandatory

  remittanceInformation\   Max140Text                    Optional          Optional
  UnStructured                                                             
  -----------------------------------------------------------------------------------------

-   **ExternalServiceLevel1Code** A set of codes defined outside the
    schema. The suggested values are { SDVA, URGP }. For full list of
    codes, see §0 ISO ExternalServiceLevel1Code.

#### Example - SEPA Credit transfers

**Request**

POST
<https://psd2.openbankingapi.is/v1/payments/sepa>[-credit-transfers](https://api.testbank.com/v1/payments/sepa-credit-transfers)

  -----------------------------------------------------------------------
  Content-Type:            application/json
  ------------------------ ----------------------------------------------
  X-Request-ID:            99391c7e-ad88-49ec-a2ad-99ddcb1f7721

  PSU-IP-Address:          192.168.8.78

  PSU-GEO-Location:        GEO:52.506931;13.144558

  PSU-User-Agent:          Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0)
  -----------------------------------------------------------------------

Gecko/20100101 Firefox/54.0

Date: Sun, 06 Aug 2017 15:02:37 GMT

{

\"debtorAccount\": {\
\"iban\": \"IS40100100103307118608\"\
},\
\"costDebtorAccount\": {\
\"iban\": \"IS40100100103307118609\"\
},\
\"instructedAmount\": {\
\"currency\": \"EUR\",\
\"amount\": \"123.50\"\
},\
\"creditorAccount\": {\
\"iban\": \"DE02100100109307118603\"\
},\
\"creditorName\": \"Jón Jónsson\",\
\"creditorAddress\": {\
\"streetName\": \"Lambhagi\",\
\"buildingNumber\": \"10\",\
\"townName\": \"Reykjvík\",\
\"postCode\": \"101\",\
\"country\": \"IS\"\
},\
\"centralBankPurposeCode\":\"099\",\
\"remittanceInformationUnstructured\": \"Ref Number Merchant\"\
}

#### Example -- Cross border credit transfers

**Request**

POST
https://psd2.openbankingapi.is/v1/payments/cross-border-credit-transfers

  -----------------------------------------------------------------------
  Content-Type:            application/json
  ------------------------ ----------------------------------------------
  X-Request-ID:            99391c7e-ad88-49ec-a2ad-99ddcb1f7721

  PSU-IP-Address:          192.168.8.78

  PSU-GEO-Location:        GEO:52.506931;13.144558

  PSU-User-Agent:          Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0)
  -----------------------------------------------------------------------

Gecko/20100101 Firefox/54.0

Date: Sun, 06 Aug 2017 15:02:37 GMT

{\
\"debtorAccount\": {\
\"iban\": \"IS40100100103307118608\"\
},\
\"costDebtorAccount\": {\
\"iban\": \"IS40100100103307118609\"\
},\
\"instructedAmount\": {\
\"currency\": \"EUR\",\
\"amount\": \"123.50\"\
},\
\"creditorAccount\": {\
\"iban\": \"DK02100100109307118603\"\
},\
\"creditorName\": \"Jón Jónsson\",\
\"creditorAddress\": {\
\"streetName\": \"Lambhagi\",\
\"buildingNumber\": \"10\",\
\"townName\": \"Reykjvík\",\
\"postCode\": \"101\",\
\"country\": \"IS\"\
},\
\"creditorAgent\": \"DABADKKK\",\
\"creditorAgentAddress\": {\
\"streetName\": \" BROGADE\",\
\"buildingNumber\": \"3\",\
\"townName\": \" KØGE\",\
\"postCode\": \"4600\",\
\"country\": \"DK\"\
},\
\"serviceLevel\": \"PRPT\",\
\"centralBankPurposeCode\":\"099\",\
\"remittanceInformationUnstructured\": \"Ref Number Merchant\"\
}

## A.2 Bulk payment products {-}

Generic Body for a bulk payment initiation.

  ----------------------------------------------------------------------------
  Data Element           Type            SEPA credit     Cross border credit
                                         transfers       transfers
  ---------------------- --------------- --------------- ---------------------
  debtorAccount          Account         Mandatory       Mandatory
                         Reference                       

  chargesAccount         Account         Optional        Optional
                         Reference                       

  paymentInformationId   Max35Text       Optional        Optional

  Payments               List of Payment Mandatory       Mandatory
                         Bulk                            
  ----------------------------------------------------------------------------

The payment information id is unique identification as assigned by the
sending party to unambiguously identify this bulk payment.

### A.2.1 Bulk payment {-}

Generic body for a bulk payment initiation entry.

The bulk entry type is a type which follows the JSON formats for the
supported products for single payments excluding the data elements (if
supported):

The debtorAccount data element may not be used in any bulk entry.

Bulk payments (creditor) are required to be in the same currency, the
withdrawal account (debtor) can be in different currency.

  ------------------------------------------------------------------------------------------
  Data Element             Type                        SEPA credit       Cross border credit
                                                       transfers         transfers
  ------------------------ --------------------------- ----------------- -------------------
  instructedAmount         Amount                      Mandatory         Mandatory

  creditorAccount          Account Reference           Mandatory         Mandatory

  creditorName             Max70Text                   Mandatory         Mandatory

  creditorAddress          Address                     Optional          Optional

  creditorAgent            Max35Text                   n/a               Optional

  creditorAgentAddress     Address                     n/a               Optional

  chargeBearer             ChargeBearer                Optional          Optional

  serviceLevel             Service Level Code\         n/a               Optional
                           ExternalServiceLevel1Code                     

  centralBankPurposeCode   CentralBankPurpose          Mandatory         Mandatory

  remittanceInformation\   Max140Text                  Optional          Optional
  UnStructured                                                           
  ------------------------------------------------------------------------------------------


### A.2.2 Example  {-}

**Request**

POST
<https://psd2.openbankingapi.is/v1/bulk-payments/sepa>[-credit-transfers](https://api.testbank.com/v1/payments/sepa-credit-transfers)

  -----------------------------------------------------------------------
  Content-Type:            application/json
  ------------------------ ----------------------------------------------
  X-Request-ID:            99391c7e-ad88-49ec-a2ad-99ddcb1f7721

  PSU-IP-Address:          192.168.8.78

  PSU-GEO-Location:        GEO:52.506931;13.144558

  PSU-User-Agent:          Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0)
  -----------------------------------------------------------------------

```json
Gecko/20100101 Firefox/54.0

Date: Sun, 06 Aug 2017 15:02:37 GMT

{
  "debtorAccount": {
    "iban": "IS40100100103307118608"
  },
  " chargesAccount": {
    "iban": "IS40100100103307118609"
  },
  "paymentInformationId": "my-bulk-identification-1234",
  "payments": [
    {
      "instructedAmount": {
        "currency": "EUR",
        "amount": "123.50"
      },
      "creditorAccount": {
        "iban": "DE02100100109307118603"
      },
      "creditorName": "Jón Jónsson",
      "creditorAddress": {
        "streetName": "Lambhagi",
        "buildingNumber": "10",
        "townName": "Reykjvík",
        "postCode": "101",
        "country": "IS"
      },
      "centralBankPurposeCode": "099",
      "remittanceInformationUnstructured": "Ref Number Merchant"
    }
  ]
}
```

## A.3 Introduction   {-}

## A.4. Character Sets and Notations   {-}

For definition on character Sets and Notations as well as for request
and response notations refer to Chapter 2 of \[XS2A-IG\].

## A.5. Transport Layer   {-}

The communication between the TPP and the ASPSP is always secured by
using a TLS connection using TLS version 1.2 or higher. For the choice
of cipher suite selections, NIST recommendations on the cryptographical
strength should be followed. For ASPSPs, further cipher suite
requirements of their national IT security agency might apply.

This TLS-connection is set up by the TPP. It is not necessary to set up
a new TLS-connection for each transaction, however the ASPSP might
terminate an existing TLS-connection if required by its security
setting.

The TLS-connection must be established always including client (i.e.,
TPP) authentication. For this authentication, the TPP must use a
qualified certificate for website authentication. This qualified
certificate must be issued by a qualified trust service provider
according to the eIDAS regulation \[eIDAS\]. The content of the
certificate must be compliant with the requirements of \[EBA-RTS\]. The
certificate of the TPP has to indicate all roles the TPP is authorized
to use.

## A.6 Application Layer: Guiding Principles   {-}

Guidelines principles are defined in *NextGenPSD2 Access to Account
Interoperability Framework - Implementation Guidelines
V1.3.6_20200203.pdf*

## A.7. Payment Initiation Service  {-}

### A.7.1 Payment Initiation Flows  {-}

The payment initiation flows are described in the NextGenPSD2
implementation guidelines version 1.3.6, chapter 5.

### A.7.2 Data Overview Payment Initiation Service  {-}

The Data Overview Payment Initiation Service are described in the
NextGenPSD2 implementation guidelines version 1.3.6, chapter 5.

### A.7.3 Payment Initiation Request  {-}

#### A.7.3.1 Payment Initiation Single Payment  {-}

##### Call 

POST /v1/payments/{payment-product}

Creates a payment initiation request at the ASPSP.

##### Path Parameters 

+-----------+---------+------------------------------------------------+
| Attribute | > Type  | Description                                    |
+===========+=========+================================================+
| payment-  | >       | The addressed payment product endpoint, e.g.,  |
| product   |  String | for SEPA Credit Transfers (SCT). The default   |
|           |         | list of products supported in this standard    |
|           |         | is:                                            |
|           |         |                                                |
|           |         | -   sepa-credit-transfers                      |
|           |         |                                                |
|           |         | -   cross-border-credit-transfers              |
|           |         |                                                |
|           |         | The ASPSP will publish which of the payment    |
|           |         | products/endpoints will be supported.          |
|           |         |                                                |
|           |         | For definitions of basic non euro generic      |
|           |         | products see \[XS2A-DP\].                      |
|           |         |                                                |
|           |         | Further products might be published by the     |
|           |         | ASPSP within its XS2A documentation. These new |
|           |         | product types will end in further endpoints of |
|           |         | the XS2A Interface.                            |
+-----------+---------+------------------------------------------------+

##### Query Parameters 

No Query Parameter.

##### Request Header 

+--------------+-----------+---------------+---------------------------------+
| Attribute    | > Type    | > Conditional | Description                     |
|              |           |               |                                 |
+==============+===========+===============+=================================+
| Content-Type | > String  | > Mandatory   | application/json.               |
|              |           |               |                                 |
+--------------+-----------+---------------+---------------------------------+
| X-Request-ID | > UUID    | > Mandatory   | ID of the request, unique to    |
|              |           |               | the call, as determined by the  |
|              |           |               | initiating party.               |
|              |           |               |                                 |
|              |           |               | This is the unique ID of TPP    |
|              |           |               | for the payment initiation      |
|              |           |               | regarding PSD2 article 47 and   |
|              |           |               | EBA RTS article 29.             |
+--------------+-----------+---------------+---------------------------------+
| A            | > String  | > Conditional | Bearer Token. Is contained      |
| uthorization |           |               | only, if an OAuth2 based        |
|              |           |               | authentication was performed in |
|              |           |               | a pre-step or an OAuth2 based   |
|              |           |               | SCA was performed in a          |
|              |           |               | preceding AIS service in the    |
|              |           |               | same session.                   |
+--------------+-----------+---------------+---------------------------------+
| PSU-IP-      | > String  | > Mandatory   | The forwarded IP Address header |
|              |           |               | field consists of the           |
| Address      |           |               | corresponding HTTP request IP   |
|              |           |               | Address field between PSU and   |
|              |           |               | TPP.                            |
|              |           |               |                                 |
|              |           |               | If not available, the TPP shall |
|              |           |               | use the IP Address used by the  |
|              |           |               | TPP when submitting this        |
|              |           |               | request.                        |
+--------------+-----------+---------------+---------------------------------+

**Remark:** Note that a reference of the payment to payer/payee
following \[PSD2\], Article 46 (b), will be handled on application layer
with the data attributes related to end2end identification and
remittance information.

##### Request Body 

The payment data to be transported in the request body is dependent on
the chosen API endpoint.

##### Response Code 

The HTTP response code equals 201.

##### Response Header 

+---------------+---------+----------+--------------------------------+
| Attribute     | > Type  | > C      | > Description                  |
|               |         | ondition |                                |
+===============+=========+==========+================================+
| Location      | >       | > M      | > Location of the created      |
|               |  String | andatory | > resource (if created).       |
+---------------+---------+----------+--------------------------------+
| X-Request-ID  | > UUID  | > M      | > ID of the request, unique to |
|               |         | andatory | > the call, as determined by   |
|               |         |          | > the initiating party.        |
+---------------+---------+----------+--------------------------------+

##### Response Body 

+----------------+-------------+-------+-------------------------------+
| Attribute      | > Type      | >     | > Description                 |
|                |             |  Cond |                               |
|                |             | ition |                               |
+================+=============+=======+===============================+
| tra            | >           | >     | > The values defined in       |
| nsactionStatus | Transaction |  Mand | > Berlin-group implementation |
|                | > Status    | atory | > guideline.                  |
+----------------+-------------+-------+-------------------------------+
| paymentId      | > String    | >     | > resource identification of  |
|                |             |  Mand | > the generated payment       |
|                |             | atory | > initiation resource.        |
+----------------+-------------+-------+-------------------------------+
| t              | Amount      | > Opt | > Can be used by the ASPSP to |
| ransactionFees |             | ional | > transport transaction fees  |
|                |             |       | > relevant for the underlying |
|                |             |       | > payments.                   |
+----------------+-------------+-------+-------------------------------+
| transact       | Transaction | > Opt | > Can be used by the ASPSP to |
| ionFeesDetails | FeesList    | ional | > describe in details fees    |
|                |             |       | > associated with the payment |
|                |             |       | > initiation.                 |
+----------------+-------------+-------+-------------------------------+
| exchangeR      | Payment     | > Opt | > Exchange rate information   |
| ateInformation | E           | ional | > used by ASPSP to describe   |
|                | xchangeRate |       | > exchange rate.              |
+----------------+-------------+-------+-------------------------------+
| currenc        | Amount      | > Opt | > Might be used by the ASPSP  |
| yConversionFee |             | ional | > to transport specific       |
|                |             |       | > currency conversion fees    |
|                |             |       | > related to the initiated    |
|                |             |       | > credit transfer.            |
+----------------+-------------+-------+-------------------------------+
| transacti      | Boolean     | > Opt | > If equals true, the         |
| onFeeIndicator |             | ional | > transaction will involve    |
|                |             |       | > specific transaction cost   |
|                |             |       | > as shown by the ASPSP in    |
|                |             |       | > their public price list or  |
|                |             |       | > as agreed between ASPSP and |
|                |             |       | > PSU.                        |
|                |             |       | >                             |
|                |             |       | > If equals false, the        |
|                |             |       | > transaction will not        |
|                |             |       | > involve additional specific |
|                |             |       | > transaction costs to the    |
|                |             |       | > PSU.                        |
|                |             |       | >                             |
|                |             |       | > If this data element is not |
|                |             |       | > used, there is no           |
|                |             |       | > information about           |
|                |             |       | > transaction fees unless the |
|                |             |       | > fee amount is given         |
|                |             |       | > explicitly in the data      |
|                |             |       | > element transactionFees.    |
+----------------+-------------+-------+-------------------------------+
| \_links        | > Links     | >     | > A list of hyperlinks to be  |
|                |             |  Mand | > recognised by the TPP. The  |
|                |             | atory | > actual hyperlinks used in   |
|                |             |       | > the response depend on the  |
|                |             |       | > dynamical decisions of the  |
|                |             |       | > ASPSP when processing the   |
|                |             |       | > request.                    |
+----------------+-------------+-------+-------------------------------+

##### Example 

**Request**

POST
<https://psd2.openbankingapi.is/v1/payments/sepa>[-credit-transfers](https://api.testbank.com/v1/payments/sepa-credit-transfers)

  -----------------------------------------------------------------------
  Content-Type:            application/json
  ------------------------ ----------------------------------------------
  X-Request-ID:            99391c7e-ad88-49ec-a2ad-99ddcb1f7721

  PSU-IP-Address:          192.168.8.78

  PSU-GEO-Location:        GEO:52.506931;13.144558

  PSU-User-Agent:          Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0)
  -----------------------------------------------------------------------

Gecko/20100101 Firefox/54.0

Date: Sun, 06 Aug 2017 15:02:37 GMT

{

\"instructedAmount\": {

\"currency\": \"EUR\",

\"amount\": \"123.50\"

},

\"debtorAccount\": {

\"iban\": \"IS40100100103307118609\"

},

\"creditorName\": \"Merchant123\",

\"creditorAccount\": {

\"iban\": \"DE02100100109307118603\"

},

\"remittanceInformationUnstructured\": \"Ref Number Merchant\"\
\"centralBankPurposeCode\": \"99\"\
}

#### A.7.3.2 Payment Initiation for Bulk Payments 

This function supports the upload of bulk payments. This function is an
**optional** function of the ASPSP in the XS2A interface. It can be
offered by the ASPSP in JSON modelling of the payment data, i.e., the
body content.

##### A.7.3.2.1 Bulk Payment Initiation with JSON encoding of the Payment Instruction 

###### Call 

POST /v1/bulk-payments/{payment-product}

Creates a bulk payment initiation request at the ASPSP.

###### Path Parameters 

+-----------+---------+------------------------------------------------+
| Attribute | > Type  | Description                                    |
+===========+=========+================================================+
| payment-  | >       | The addressed payment product endpoint for     |
| product   |  String | bulk payments e.g., for a bulk SEPA Credit     |
|           |         | Transfers (SCT). Some default names are:       |
|           |         |                                                |
|           |         | -   sepa-credit-transfers                      |
|           |         |                                                |
|           |         | -   cross-border-credit-transfers              |
|           |         |                                                |
|           |         | The ASPSP will publish which of the payment    |
|           |         | products/endpoints will be supported.          |
|           |         |                                                |
|           |         | For definitions of basic non euro generic      |
|           |         | products see \[XS2ADP\].                       |
+-----------+---------+------------------------------------------------+

###### Query Parameters 

The same query parameter definition as in single payment applies.

###### Request Headers 

The same HTTP header definition as in single payment applies.

###### Request Body 

The body definition with the JSON based SEPA bulk payments is contained
in Section A.2, further definitions for non SEPA payments in
\[XS2A-DP\].

###### Response 

The responses definition is analogous to the initiation of single
payments.

### A.7.4 Get Transaction Status Request 

#### Call 

GET /v1/{payment-service}/{payment-product}/{paymentId}/status

Can check the status of a payment initiation.

#### Path Parameter 

+------------+---------+----------------------------------------------+
| Attribute  | > Type  | Description                                  |
+============+=========+==============================================+
| paym       | >       | The possible values are "payments",          |
| entservice |  String | "bulk-payments" and "periodic-payments".     |
+------------+---------+----------------------------------------------+
| paym       | >       | The payment product, under which the payment |
| entproduct |  String | under paymentId has been initiated.          |
|            |         |                                              |
|            |         | It shall be checked by the ASPSP, if the     |
|            |         | payment-product is matching the payment      |
|            |         | initiation addressed by paymentId.           |
+------------+---------+----------------------------------------------+
| paymentId  | >       | Resource Identification of the related       |
|            |  String | payment.                                     |
+------------+---------+----------------------------------------------+

#### Request Header 

+-----------+---------+---------+-------------------------------------+
| Attribute | > Type  | Co      | > Description                       |
|           |         | ndition |                                     |
+===========+=========+=========+=====================================+
| X-R       | > UUID  | Ma      | > ID of the request, unique to the  |
| equest-ID |         | ndatory | > call, as determined by the        |
|           |         |         | > initiating party.                 |
+-----------+---------+---------+-------------------------------------+
| Auth      | >       | Cond    | > Is contained only, if an OAuth2   |
| orization |  String | itional | > based authentication was          |
|           |         |         | > performed in a pre-step or an     |
|           |         |         | > OAuth2 based SCA was performed in |
|           |         |         | > the current PIS transaction or in |
|           |         |         | > a preceding AIS service in the    |
|           |         |         | > same session, if no such OAuth2   |
|           |         |         | > SCA approach was chosen in the    |
|           |         |         | > current PIS transaction.          |
+-----------+---------+---------+-------------------------------------+

#### Query Parameters 

No specific query parameters defined.

#### Request Body 

No request body.

#### Response Code 

The HTTP response code equals 200.

#### Response Header 

+---------------+---------+----------+--------------------------------+
| Attribute     | > Type  | > C      | > Description                  |
|               |         | ondition |                                |
+===============+=========+==========+================================+
| X-Request-ID  | > UUID  | > M      | > ID of the request, unique to |
|               |         | andatory | > the call, as determined by   |
|               |         |          | > the initiating party.        |
+---------------+---------+----------+--------------------------------+

#### Response Body

+--------------+---------+---------------+---------------------------+
| Attribute    | > Type  | > Condition   | > Description             |
+==============+=========+===============+===========================+
| trans        | > Tran  | > Mandatory   | > In case where the       |
| actionStatus | saction |               | > Payment Initiation      |
|              | >       |               | > Request was JSON        |
|              |  Status |               | > encoded, the status is  |
|              |         |               | > returned in this JSON   |
|              |         |               | > based encoding.         |
+--------------+---------+---------------+---------------------------+

#### Example 

**Request**

GET
https://psd2.openbankingapi.is/v1/payments/1234[-wertiq-983/status](https://api.testbank.com/v1/payments/1234-wertiq-983/status)

+--------------------+------+------------------------------------------+
| Accept:            |      | application/json                         |
+====================+======+==========================================+
| X-Request-ID:      |      | 99391c7e-ad88-49ec-a2ad-99ddcb1f7721     |
+--------------------+------+------------------------------------------+
| Date:              |      | Sun, 06 Aug 2017 15:04:07 GMT            |
|                    |      |                                          |
| **Response**       |      |                                          |
|                    |      |                                          |
| HTTP/1.x 200 Ok    |      |                                          |
+--------------------+------+------------------------------------------+
| X-Request-ID:      |      | 99391c7e-ad88-49ec-a2ad-99ddcb1f7721     |
+--------------------+------+------------------------------------------+
| Date:              |      | Sun, 06 Aug 2017 15:04:08 GMT            |
+--------------------+------+------------------------------------------+
| Content-Type:      |      | application/json                         |
+--------------------+------+------------------------------------------+

{

\"transactionStatus\": \"ACCP\"

}

### A.7.5 Get Payment Request 

GET /v1/{payment-service}/{payment-product}/{paymentId}

Returns the content of a payment object.

#### Path Parameters 

+------------+---------+----------------------------------------------+
| Attribute  | > Type  | Description                                  |
+============+=========+==============================================+
| paym       | >       | The possible values are "payments" and       |
| entservice |  String | "bulk-payments".                             |
+------------+---------+----------------------------------------------+
| paym       | >       | The payment product, under which the payment |
| entproduct |  String | under paymentId has been initiated.          |
+------------+---------+----------------------------------------------+
| paymentId  | >       | ID of the corresponding payment initiation   |
|            |  String | object as returned by a Payment Initiation   |
|            |         | Request.                                     |
+------------+---------+----------------------------------------------+

#### Query Parameters 

No specific query parameter.

#### Request Headers 

+-----------+---------+---------+-------------------------------------+
| Attribute | > Type  | Co      | > Description                       |
|           |         | ndition |                                     |
+===========+=========+=========+=====================================+
| X-R       | > UUID  | Ma      | > ID of the request, unique to the  |
| equest-ID |         | ndatory | > call, as determined by the        |
|           |         |         | > initiating party.                 |
+-----------+---------+---------+-------------------------------------+
| Auth      | >       | Cond    | > Is contained only, if an OAuth2   |
| orization |  String | itional | > based authentication was          |
|           |         |         | > performed in a pre-step or an     |
|           |         |         | > OAuth2 based SCA was performed in |
|           |         |         | > the current PIS transaction or in |
|           |         |         | > a preceding AIS service in the    |
|           |         |         | > same session, if no such OAuth2   |
|           |         |         | > SCA approach was chosen in the    |
|           |         |         | > current PIS transaction.          |
+-----------+---------+---------+-------------------------------------+

#### Request Body 

No request body.

#### Response Header 

+---------------+---------+----------+--------------------------------+
| Attribute     | > Type  | > C      | > Description                  |
|               |         | ondition |                                |
+===============+=========+==========+================================+
| X-Request-ID  | > UUID  | > M      | > ID of the request, unique to |
|               |         | andatory | > the call, as determined by   |
|               |         |          | > the initiating party.        |
+---------------+---------+----------+--------------------------------+

#### Response Code 

The HTTP response code equals 200.

#### Response Body 

The response body is dependent on the parameter {payment-service}. It
contains the view of the ASPSP on the addressed payment resource.

For JSON based {payment-services}, the payment resources may contain
e.g., in addition the transaction status data element.

#####  Response for single payment

+---------------------+---------+------------+------------------------+
| Attribute           | > Type  | >          | > Description          |
|                     |         |  Condition |                        |
+=====================+=========+============+========================+
| debtorName          | Deb     | > Optional | > Debtor name.         |
|                     | torName |            |                        |
+---------------------+---------+------------+------------------------+
| chargesAccount      | Account | > Optional | > Charges account.     |
|                     | Re      |            |                        |
|                     | ference |            |                        |
+---------------------+---------+------------+------------------------+
| debtorAccount       | Account | >          | > Debtor account.      |
|                     | Re      |  Mandatory |                        |
|                     | ference |            |                        |
+---------------------+---------+------------+------------------------+
| debtorId            | Debtor  | > Optional | > Debtor id.           |
|                     | Id      |            |                        |
+---------------------+---------+------------+------------------------+
| instructedAmount    | Amount  | >          | > Instructed amount.   |
|                     |         |  Mandatory |                        |
+---------------------+---------+------------+------------------------+
| exch                | Payment | > Optional | > Exchange rate        |
| angeRateInformation | E       |            | > information.         |
|                     | xchange |            |                        |
|                     | rate    |            |                        |
+---------------------+---------+------------+------------------------+
| creditorAccount     | Account | >          | > Creditor account.    |
|                     | Re      |  Mandatory |                        |
|                     | ference |            |                        |
+---------------------+---------+------------+------------------------+
| creditorAgent       | BICFI   | > Optional | > Creditor agent.      |
+---------------------+---------+------------+------------------------+
| creditorName        | C       | >          | > Creditor name.       |
|                     | reditor |  Mandatory |                        |
|                     | Name    |            |                        |
+---------------------+---------+------------+------------------------+
| creditorAddress     | Address | > Optional | > Creditor address.    |
+---------------------+---------+------------+------------------------+
| creditorId          | Ma      | > Optional | > Creditor id.         |
|                     | x35Text |            |                        |
+---------------------+---------+------------+------------------------+
| icelandicPurpose    | Ic      | > Optional | > Payment              |
|                     | elandic |            | > categorization.      |
|                     | Purpose |            |                        |
+---------------------+---------+------------+------------------------+
| chargeBearer        | Account | > Optional | > Who is going to bear |
|                     | Re      |            | > charges?             |
|                     | ference |            |                        |
+---------------------+---------+------------+------------------------+
| remittanceInfo      | Rem     | > Optional | > References.          |
| rmationUnstructured | ittance |            |                        |
|                     | Info    |            |                        |
|                     | rmation |            |                        |
|                     | Unstr   |            |                        |
|                     | uctured |            |                        |
+---------------------+---------+------------+------------------------+
| transactionStatus   | Tran    | > Optional | > Transaction status.  |
|                     | saction |            |                        |
|                     | Status  |            |                        |
+---------------------+---------+------------+------------------------+
| tra                 | Tran    | > Optional | > Any payment fees.    |
| nsactionFeesDetails | saction |            |                        |
|                     | F       |            |                        |
|                     | eesList |            |                        |
+---------------------+---------+------------+------------------------+

##### Response for bulk payment

+------------------+---------+----------+------------------------------+
| Attribute        | > Type  | > C      | > Description                |
|                  |         | ondition |                              |
+==================+=========+==========+==============================+
| acceptorTra      | > Date  | >        | > Timestamp of the actual    |
| nsactionDateTime |         | Optional | > card transaction within    |
|                  |         |          | > the acceptance system.     |
+------------------+---------+----------+------------------------------+
| debtorAccount    | >       | > M      | > The withdrawal account.    |
|                  | Account | andatory |                              |
|                  | > Re    |          |                              |
|                  | ference |          |                              |
+------------------+---------+----------+------------------------------+
| chargesAccount   | >       | >        | > The withdrawal charge      |
|                  | Account | Optional | > account.                   |
|                  | > Re    |          |                              |
|                  | ference |          |                              |
+------------------+---------+----------+------------------------------+
| paym             | > Ma    | >        | > Unique identification as   |
| entInformationId | x35Text | Optional | > assigned by the sending    |
|                  |         |          | > party to unambiguously     |
|                  |         |          | > identify this bulk         |
|                  |         |          | > payment.                   |
|                  |         |          | >                            |
|                  |         |          | > This attribute may be used |
|                  |         |          | > by ASPSPs or communities   |
|                  |         |          | > as an optional field.      |
+------------------+---------+----------+------------------------------+
| payments         | > List  | > M      | > List of 1 or more bulk     |
|                  | > of    | andatory | > payment.                   |
|                  | > bulk  |          |                              |
|                  | >       |          |                              |
|                  | payment |          |                              |
+------------------+---------+----------+------------------------------+
| t                | > Tran  | >        | > Status of the payment      |
| ransactionStatus | saction | Optional | > request.                   |
|                  | >       |          |                              |
|                  |  Status |          |                              |
+------------------+---------+----------+------------------------------+
| transa           | > Tran  | >        | > Detailed list of fees.     |
| ctionFeesDetails | saction | Optional | > ASPSP can use this field   |
|                  | > F     |          | > to communicate to the TPP  |
|                  | eesList |          | > the fees applied to the    |
|                  |         |          | > payment initiation request |
|                  |         |          | > that will be withdrawn     |
|                  |         |          | > from the chargesAccount.   |
+------------------+---------+----------+------------------------------+

### A.7.6 Payment Cancellation Request 

#### Call 

DELETE /v1/{payment-service}/{payment-product}/{paymentId}

It initiates the cancellation of a payment. Depending on the
payment-service, the payment product and the ASPSP\'s implementation,
this TPP call might be sufficient to cancel a payment. If an
authorization of the payment cancellation is mandated by the ASPSP, a
corresponding hyperlink will be contained in the response message. These
two cases will be separated also in using different 2xx HTTP response
codes.

#### Path Parameter 

+------------+---------+----------------------------------------------+
| Attribute  | > Type  | Description                                  |
+============+=========+==============================================+
| paym       | >       | The possible values are "payments",          |
| entservice |  String | "bulk-payments" and "periodic-payments".     |
+------------+---------+----------------------------------------------+
| paym       | >       | The payment product, under which the payment |
| entproduct |  String | under paymentId has been initiated.          |
|            |         |                                              |
|            |         | It shall be checked by the ASPSP, if the     |
|            |         | payment-product is matching the payment      |
|            |         | initiation addressed by paymentId.           |
+------------+---------+----------------------------------------------+
| paymentId  | >       | Resource Identification of the related       |
|            |  String | payment.                                     |
+------------+---------+----------------------------------------------+

#### Request Header 

+---------------+-----------+----------+-------------------------------+
| Attribute     | > Type    | C        | > Description                 |
|               |           | ondition |                               |
+===============+===========+==========+===============================+
| X-Request-ID  | > UUID    | M        | > ID of the request, unique   |
|               |           | andatory | > to the call, as determined  |
|               |           |          | > by the initiating party.    |
+---------------+-----------+----------+-------------------------------+
| Authorization | > String  | Con      | > Is contained only, if an    |
|               |           | ditional | > OAuth2 based authentication |
|               |           |          | > was performed in a pre-step |
|               |           |          | > or an OAuth2 based SCA was  |
|               |           |          | > performed in the current    |
|               |           |          | > PIS transaction or in a     |
|               |           |          | > preceding AIS service in    |
|               |           |          | > the same session, if no     |
|               |           |          | > such OAuth2 SCA approach    |
|               |           |          | > was chosen in the current   |
|               |           |          | > PIS transaction.            |
+---------------+-----------+----------+-------------------------------+

#### Query Parameters 

No specific query parameters defined.

#### Request Body 

No request body.

#### Response Code 

If the DELETE is sufficient for cancelling the payment: HTTP response
code 204.

#### Response Header 

+---------------+---------+----------+--------------------------------+
| Attribute     | > Type  | > C      | > Description                  |
|               |         | ondition |                                |
+===============+=========+==========+================================+
| X-Request-ID  | > UUID  | > M      | > ID of the request, unique to |
|               |         | andatory | > the call, as determined by   |
|               |         |          | > the initiating party.        |
+---------------+---------+----------+--------------------------------+

#### Response Body 

In case of HTTP code 204, no response body is used.

In case of HTTP code 202, the following body is used:

+--------------+----------+---------+---------------------------------+
| Attribute    | > Type   | > Co    | > Description                   |
|              |          | ndition |                                 |
+==============+==========+=========+=================================+
| trans        | > Tra    | > Ma    | > Transaction Status of the     |
| actionStatus | nsaction | ndatory | > payment resource.             |
|              | > Status |         |                                 |
+--------------+----------+---------+---------------------------------+
| \_links      | > Links  | > Cond  | > A list of hyperlinks to be    |
|              |          | itional | > recognised by the TPP. The    |
|              |          |         | > actual hyperlinks used in the |
|              |          |         | > response depend on the        |
|              |          |         | > dynamical decisions of the    |
|              |          |         | > ASPSP when processing the     |
|              |          |         | > request.                      |
+--------------+----------+---------+---------------------------------+

**Example in case the DELETE process as such is already sufficient for
cancelling the payment**

#### Request 

DELETE
https://psd2.openbankingapi.is/v1/bulk-payments/sepa[-credit](https://api.testbank.com/v1/payments/sepa-credit-transfers/123456scheduled789)-[transfers/123456scheduled789](https://api.testbank.com/v1/payments/sepa-credit-transfers/123456scheduled789)

+--------------------+------+------------------------------------------+
| Content-Type       |      | application/json                         |
+====================+======+==========================================+
| X-Request-ID       |      | 99391c7e-ad88-49ec-a2ad-99ddcb1f7769     |
+--------------------+------+------------------------------------------+
| Date               |      | Sun, 13 Aug 2017 17:05:37 GMT            |
|                    |      |                                          |
| **Response**       |      |                                          |
|                    |      |                                          |
| HTTP/1.x 204       |      |                                          |
+--------------------+------+------------------------------------------+
| X-Request-ID:      |      | 99391c7e-ad88-49ec-a2ad-99ddcb1f7769     |
+--------------------+------+------------------------------------------+
| Date:              |      | Sun, 13 Aug 2017 17:05:38 GMT            |
+--------------------+------+------------------------------------------+

## A.8. Complex Data Types and Code Lists 

In the following constructed data types are defined as used within
parameter sections throughout this document.

### A.8.1. Transactions 

+----------------+----------+---------+------------------------------+
| Attribute      | > Type   | > Co    | > Description                |
|                |          | ndition |                              |
+================+==========+=========+==============================+
| transactionId  | > String | > O     | > Can be used as access-ID   |
|                |          | ptional | > in the API, where more     |
|                |          |         | > details on a transaction   |
|                |          |         | > is offered. If this data   |
|                |          |         | > attribute is provided this |
|                |          |         | > shows that the AIS can get |
|                |          |         | > access on more details     |
|                |          |         | > about this transaction     |
|                |          |         | > using the GET Transaction  |
|                |          |         | > Details Request.           |
+----------------+----------+---------+------------------------------+
| entryReference | > M      | > O     | > Is the identification of   |
|                | ax35Text | ptional | > the transaction as used    |
|                |          |         | > e.g., for reference for    |
|                |          |         | > delta function on          |
|                |          |         | > application level. The     |
|                |          |         | > same identification as for |
|                |          |         | > example used within        |
|                |          |         | > camt.05x messages.         |
+----------------+----------+---------+------------------------------+
| endToEndId     | > M      | > O     | > Unique end to end          |
|                | ax35Text | ptional | > identity.                  |
+----------------+----------+---------+------------------------------+
| mandateId      | > M      | > O     | > Identification of          |
|                | ax35Text | ptional | > Mandates, e.g., a SEPA     |
|                |          |         | > Mandate ID.                |
+----------------+----------+---------+------------------------------+
| checkId        | > M      | > O     | > Identification of a        |
|                | ax35Text | ptional | > Cheque.                    |
+----------------+----------+---------+------------------------------+
| creditorId     | > M      | > O     | > Identification of          |
|                | ax35Text | ptional | > Creditors, e.g., a SEPA    |
|                |          |         | > Creditor ID.               |
+----------------+----------+---------+------------------------------+
| bookingDate    | >        | > O     | > The Date when an entry is  |
|                |  ISODate | ptional | > posted to an account on    |
|                |          |         | > the ASPSPs books.          |
+----------------+----------+---------+------------------------------+
| valueDate      | >        | > O     | > The Date at which assets   |
|                |  ISODate | ptional | > become available to the    |
|                |          |         | > account owner in case of a |
|                |          |         | > credit.                    |
+----------------+----------+---------+------------------------------+
| tra            | > Amount | > Ma    | > The amount of the          |
| nsactionAmount |          | ndatory | > transaction as billed to   |
|                |          |         | > the account.               |
+----------------+----------+---------+------------------------------+
| cu             | Array of | > O     | > List of exchange rate      |
| rrencyExchange | Report   | ptional | > between two currencies.    |
|                | Exchange |         |                              |
|                | Rate     |         |                              |
+----------------+----------+---------+------------------------------+
| creditorName   | > M      | > O     | > Name of the creditor if a  |
|                | ax70Text | ptional | > \"Debited\" transaction.   |
+----------------+----------+---------+------------------------------+
| creditor       | >        | > Cond  | > IBAN account number.       |
|                |  Account | itional |                              |
| Account        | > R      |         |                              |
|                | eference |         |                              |
+----------------+----------+---------+------------------------------+
| creditorAgent  | > BICFI  | > O     | > BIC FI.                    |
|                |          | ptional |                              |
+----------------+----------+---------+------------------------------+
| ultimate       | > M      | > O     | > The beneficiary.           |
| Creditor       | ax70Text | ptional |                              |
+----------------+----------+---------+------------------------------+
| debtorName     | > M      | > O     | > Name of the debtor if a    |
|                | ax70Text | ptional | > \"Credited\" transaction.  |
+----------------+----------+---------+------------------------------+
| debtorAccount  | >        | > Cond  | > IBAN account for the       |
|                |  Account | itional | > debtor.                    |
|                | > R      |         |                              |
|                | eference |         |                              |
+----------------+----------+---------+------------------------------+
| debtorAgent    | > BICFI  | > O     | > Debtor agent.              |
|                |          | ptional |                              |
+----------------+----------+---------+------------------------------+
| ultimateDebtor | > M      | > O     | > The Originator Reference   |
|                | ax70Text | ptional | > Party.                     |
+----------------+----------+---------+------------------------------+
| remittance     | > Ma     | > O     | > Reference field.           |
| Information    | x140Text | ptional |                              |
|                |          |         |                              |
| Unstructured   |          |         |                              |
+----------------+----------+---------+------------------------------+
| remittance     | Array of | > O     | > Array of reference field.  |
| Information    | Ma       | ptional |                              |
|                | x140Text |         |                              |
| Unstructured   |          |         |                              |
|                |          |         |                              |
| Array          |          |         |                              |
+----------------+----------+---------+------------------------------+
| remittance     | > Ma     | > O     | > Reference as contained in  |
| Information    | x140Text | ptional | > the structured remittance  |
|                |          |         | > reference structure        |
| Structured     |          |         | > (without the surrounding   |
|                |          |         | > XML structure).            |
+----------------+----------+---------+------------------------------+
| remittance     | Array of | > O     | > More details about the     |
| Information    | Re       | ptional | > Remittance Data Type will  |
| Structured     | mittance |         | > be published in an Errata  |
| Array          |          |         | > in due course.             |
|                |          |         | >                            |
|                |          |         | > For usage of the fields    |
|                |          |         | > e.g., for domestic         |
|                |          |         | > elements, Berlin Group     |
|                |          |         | > should be contacted. This  |
|                |          |         | > would enable to publish    |
|                |          |         | > usage of structured        |
|                |          |         | > remittance information in  |
|                |          |         | > the domestic payment       |
|                |          |         | > documentation, cp.         |
|                |          |         | > \[XS2A-DP\].               |
+----------------+----------+---------+------------------------------+
| additio        | Ma       | > O     | > Might be used by the ASPSP |
| nalInformation | x500Text | ptional | > to transport additional    |
|                |          |         | > transaction related        |
|                |          |         | > information to the PSU.    |
+----------------+----------+---------+------------------------------+
| additio        | St       | > Cond  | > Is used if and only if the |
| nalInformation | ructured | itional | > bookingStatus entry equals |
| Structured     | Ad       |         | > \"information\". Every     |
|                | ditional |         | > active standing order      |
|                | Inf      |         | > related to the dedicated   |
|                | ormation |         | > payment account result     |
|                |          |         | > into one entry.            |
+----------------+----------+---------+------------------------------+
| purposeCode    | Purpose  | > O     | > The reason for the         |
|                | Code     | ptional | > transaction.               |
+----------------+----------+---------+------------------------------+
| bankT          | Bank     | > O     | > Bank transaction code as   |
| ransactionCode | Tra      | ptional | > used by the ASPSP and      |
|                | nsaction |         | > using the sub elements of  |
|                | Code     |         | > this structured code       |
|                |          |         | > defined by ISO20022.       |
+----------------+----------+---------+------------------------------+
| p              | M        | > O     | > Proprietary bank           |
| roprietaryBank | ax35Text | ptional | > transaction code as used   |
| T              |          |         | > within a community.        |
| ransactionCode |          |         |                              |
+----------------+----------+---------+------------------------------+
| balanceAf      | Balance  | > O     | > This is the balance after  |
| terTransaction |          | ptional | > this transaction.          |
|                |          |         | > Recommended balance type   |
|                |          |         | > is interimBooked.          |
+----------------+----------+---------+------------------------------+
| \_links        | Links    | > O     | > The following links could  |
|                |          | ptional | > be used here:              |
|                |          |         | >                            |
|                |          |         | > transactionDetails for     |
|                |          |         | > retrieving details of a    |
|                |          |         | > transaction.               |
+----------------+----------+---------+------------------------------+

### A.8.2. Transaction Fees Detail 

+-----------------+----------+---------+------------------------------+
| Attribute       | > Type   | > Co    | > Description                |
|                 |          | ndition |                              |
+=================+==========+=========+==============================+
| feeType         | > Tra    | > Ma    | > Defines the fee type. Used |
|                 | nsaction | ndatory | > by the ASPSP to describe   |
|                 | > Fees   |         | > payment fees.              |
|                 | > Detail |         |                              |
+-----------------+----------+---------+------------------------------+
| value           | > Amount | > Ma    | > Defines the fee amount.    |
|                 |          | ndatory |                              |
+-----------------+----------+---------+------------------------------+

## A.9. ISO Definitions

### A.9.1. ExternalServiceLevel1Code 

The following list contains suggested values.

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

##  A.8. References 

+----------+-----------------------------------------------------------+
| \[X      | NextGenPSD2 XS2A Framework, Operational Rules, The Berlin |
| S2A-OR\] | Group Joint                                               |
|          |                                                           |
|          | Initiative on a PSD2 Compliant XS2A Interface, version    |
|          | 1.3, published 21 December 2018.                          |
+==========+===========================================================+
| \[X      | NextGenPSD2 XS2A Framework, Domestic Payment Definitions, |
| S2A-DP\] | The Berlin Group Joint Initiative on a PSD2 Compliant     |
|          | XS2A Interface, current version.                          |
+----------+-----------------------------------------------------------+

\[XS2A-COFC\] NextGenPSD2 XS2A Framework, Extended Services,
Confirmation of Funds Consent Service, Version 2.0, 01 March 2019.

\[PSD2\] Directive (EU) 2015/2366 of the European Parliament and of the
Council on payment services in the internal market, published 23
December 2015.
