---
title: "ÍST TS 310:2020"
# author: ICS. 3.060
date: "Gildistaka: 22.02.2022"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 310]
subtitle: ["Tækniforskrift - Innlendar greiðslur og innlán", "Technical Specification - Domestic payments and deposits"]
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
mustache: "Vinnusvæði/Verkþáttur 5/310media/docvariables.yml"
figureTitle: |
  Figure #
lofTitle: |
  ## List of Figures
lotTitle: |
  ## List of Tables
tableTemplate: |
  *$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$
autoSectionLabels: True

include-before: |
  Participants in ÍST Workshop VS-3 Innlendar greiðslur og innlán (e.
  Domestic payments and deposits) and participants in working groups preparing the workshop agreement.

    -----------------------------------------------------------------------------------
    Name                  Company / \                 Name               Company / \                 
                          organisation / \                               organisation / \             
                          association                                    association                
    -------------------- ---------------------------- ------------------ --------------
    Árni Björnsson       Samband sparisjóða á Íslandi Ingibergur S.      Unimaze
                                                      Stefnisson         
    Arnar Freyr          Íslandsbanki                 Íris Dögg          Kvika
    Björnsson                                         Kristmundsdóttir   

    Ásgeir Helgi         Atlas lögmenn                Jóhannes Þór       Íslandsbanki
    Jóhannsson                                        Ágústarson         

    Ásgeir Örn           Samtök                       Jóhann             Landsbankinn
    Ásgeirsson           fjártæknifyrirtækja/Meniga   Þorvarðarson       

    Atli Mar Gunnarsson  Arion banki                  Jökull Huxley      Landsbankinn
                                                      Yngvason           

    Bjarki Jóhannsson    Creditinfo                   Kjartan Ásþórsson  Kvika

    Bjarni Þór Pálsson   RB                           Kristinn           Arion banki
                                                      Stefánsson         

    Björn Ingi Björnsson Arion banki                  Markús Guðmundsson Sendill

    Bragi Þór            RB                           Ólafur Bergsson    Íslandsbanki
    Guðmundsson                                                          

    Daníel Snorrason     Seðlabanki Íslands           Ólafur Eiríksson   Landsbankinn

    Einar Eiríksson      Origo                        Páll Arnar         Creditinfo
                                                      Guðmundsson        

    Elfa D.              Arion banki                  Sigrún             WISE
    Marteinsdóttir                                    Gunnarsdóttir      

    Gísli Konráð         Landsbankinn                 Sigurbjörn         TCM innheimta
    Björnsson                                         Þorbjörnsson       

    Guðjón Karl Arnarson RB                           Sigurður Gauti     Alskil
                                                      Hauksson           

    Guðmundur Jón        DataPlato ehf                Sigurjón Örn       Valitor
    Halldórsson                                       Kárason            

    Gunnar Stefánsson    Arion banki                  Snorri Karlsson    Íslandsbanki

    Halla Árnadóttir     RB                           Snorri Jónsson     Íslandsbanki

    Halldór Vagn         Landsbankinn                 Stefán Orri        Íslandsbanki
    Hreinsson                                         Stefánsson         

    Halldóra G.          Landsbankinn                 Styrmir            Sjálfstæður
    Steindórsdóttir                                   Kristjánsson       

    Helena Pálsdóttir    FME                          Sveinn G.          Landsbankinn
                                                      Gunnarsson         

    Helena Rúriksdóttir  Arion banki                  Þorsteinn          Wise
                                                      Guðmundsson        

    Hermann Snorrason    Landsbankinn                 Þorsteinn Lemke    Uniconta

    Hjálmar Brynjólfsson FME                          Védís              Arion banki
                                                      Ingólfsdóttir      

    Hrannar Már          Arion banki                  Védís              Landsbankinn
    Hallkelsson                                       Sigurðardóttir     

    Ingibjartur Jónsson  Valitor                      Ingvi Rafn         Íslandsbanki
                                                      Guðmundsson        

    Ingvaldur Einarsson  Uniconta                                        
    -----------------------------------------------------------------------------------

    © Icelandic Standards (IST) 2020, 2022. All Rights Reserved.
   
    Without the written permission of the publisher, this technical
    specification document may not be reprinted or reproduced in any form by 
    any means, mechanical or electronic, such as by photocopying, sound recording or
    other means, currently known or later invented, nor may the agreement
    be disseminated through an electronic database. 
   
    1\. edition

# thanks: thanks
# top-level-division: chapter
# header-includes:
# - \renewcommand{\chaptername}{}
# - \renewcommand{\thechapter}{}
...

\newpage

  TODO
- [] Finalize the final of participants @gudval  
- [] Update final dates in foreword  
- [] Should end2enddescription be described?  
- [] Merki reiknings
- []

\newpage

# Foreword {.unnumbered}
  This ÍST Technical Specification was developed in accordance with "ÍST Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.* IST rules on Technical Specifications, Technical Reports and Workshop Agreements). The TS (Technical specification) was prepared by the technical committee TN-FMÞ (The Technical Committee on Financial Services) that operates within FUT (Sector committee for ICT standardisation) following a public call for participation within TN-FMÞ. The final draft was sent to the TN-FMÞ on the {{finaldraft_date}} and approved by correspondence on the {{approve_date}}. The text of ÍST {{spec_id}} was submitted to IST for publication on {{publication_date}}.
 
  The accompanying OpenAPI 3.0.1 definition "IOBWS3.0.yaml" located at https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables, should be viewed as an integral part of ÍST {{spec_id}}. The document "{{fulldoc_name}}", is the source of this rendition, and versions of that document will be used for future errata and clarifications in accordance with the guidelines laid out in WA-316. Those rule are outlined in the README.md accompanying the Github Git repository and have been accepted by the participants in TN-FMÞ alongside this specification. These guidelines establishe workgroup TN-FMÞ-VH-7 as in charge of monitoring submitted issues and pull requests made to the repository, which fall the permit of other regular workgroups. VH-7 will determine if the changes are to be accepted and if they warrant patches or minor releases to the specification, reflected in its Semver 2 versioning. Each release will be based on a Workgroup agreement in accordance with the "ÍST reglur" referenced above.

  The work on the ÍST TS was primarly funded by Íslandsbanki, Arion Banki and Landsbankinn. It is the result the workgroup TN-FMÞ-VH-8. In parts the work is the earlier workshop agreement WA-310 authored by TN-FMÞ-VH-1 on Technical requirements and TN-FMÞ-VH-2 on Business requirements, with participation of an external consultant. WA-310 was approved within TN-FMÞ on the 2019-12-12. ÍST {{spec_id}} should, however, not be viewed as a direct succesor to that agreement, which focused on laying groundwork for PSD2 compliance. Instead {{spec_id}} is the next version of the Icelandic Online Banking Services, replacing TS 161:2013 *Greiðslur* and TS 164:2013 *Yfirlit bankareikninga*.

  ÍST {{spec_id}} is not subject to any patent rights. The underlying OpenAPI specification is derived from version 1.3.8 of the 
  [Berlin Group's NextGenPSD2 Framework](https://www.berlin-group.org/nextgenpsd2-downloads)
  , and therefore also distributed under a 
  [Creative Commons Attribution 4.0 International Public License (CC BY)](https://creativecommons.org/licenses/by/4.0/#).

  This means the YAML Specification for ÍST {{spec_id}} can be copied and redistributed in any medium or format for any purpose, even commercially, but when shared appropriate credit must be given, a link to the license must be provided, and an indication given if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use. In addition, if you remix, transform, or build upon the specification, you may not distribute the modified specification.

  The Technical Committee's participants have made every effort to ensure the reliability and accuracy of the technical and non-technical content of ÍST {{spec_id}}, but this does not guarantee, either explicitly or implicitly, its correctness. Users of ÍST {{spec_id}} should be aware that neither the TN-FMÞ, nor ÍST can be held liable for damages or losses of any kind whatsoever which may arise from its application. Users of ÍST {{spec_id}} do so on their own responsibility and at their own risk.

# Introduction {.unnumbered}

This Technical Specification (TS) present version 3.0 of the Icelandic Online Banking Services (IOBWS), for domestic payments and deposits.

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the most recent OASIS SOAP standards at the time, to define common web service interfaces for the Icelandic the commercial and savings banks. This enabled software vendors, enterprises and service providers to integrate their accounting, payment, and information systems with the bank's services, to act on behalf of the customers and with full access to their data.

Iceland, with its homogeneous financial infrastructure based on the centralized Banks' Data Centre (Reiknistofa bankanna, or RB), has enjoyed real-time gross settlements and instant credit transfers nationwide since 1987. Other universally accepted services count the common collection solution (Kröfupotturinn) for issuing and paying claims, topping up creditcards, or A/B Giro. All this functionality has been available through IOBWS v1 and v2, comparable to the functionality enjoyed by users of the online banking Web UIs.

When initiating work on the previous versions, the participants in the TN-FMÞ reviewed existing and emerging specifications in the global or mostly European financial industry. None were deemed a good fit at the time for local adaptation, as they reflected inherent the legacy in inter-bank communications outside of Iceland, even in the case of the other Nordic countries. Therefore v1 and v2 of IOBWS were somewhat specific to the current functionality available in the underlying RB systems.

Meanwhile, the broader market especially in Europe has been catching up, and the Icelandic banks' have migrated to new core banking systems that make adopting specifications based on or compatable with technology standard such as ISO 20022, both feasible and desirable. The Open Banking regulation in UK and the PSD2 regulation issued by the European Parliment gave rise to initiatives to standardize access to payment functionality and account information, on behalf of customers by third parties. One such effort, the NextGenPSD2 Framework developed by the Berlin Group, has met a broad acceptance in the EEA. The data model references ISO 20022, and is close enough to where the Icelandic market is evolving as to make it a relatively straightforward to adapt IOBWS to use it as a base, instead of continuing to maintain an independant linage of API specifications. 

Another goal with v3 that is achieved by adopting the NextGenPSD2 Framework, is the transition from SOAP to a REST-like API, defined by a recent version of the [Open API Specification](TODO: REFERENCE IN TERMS), with support for newer, open authentication and authorization standards, that hopefully solve some of the complexity involved with previous incarnations of the IOBWS.

# Scope 

ÍST TS-310 defines web application programming interfaces to be implemented by Icelandic commercial and savings banks, when exposing common functionality and information for domestic payments and deposits. 

Related ÍST TS documents address other parts of the overall IOBWS framework, either as new additions or upgrades to the previous specifications. Some crosscutting guidelines and common concerns are addressed in the ÍST WA-316 workshop agreement. Aside from that, as both the implementation and consumption of each individual specifications is optional, the documents try to be independent of each other.

However, due to the origin of the underlying OpenAPI specification in the Berlin Group NextGenPSD2 Framework, ÍST TS-310 on Domestic Payments and Deposits, and ÍST TS-313 on Foreign Payments, ovelap quite significantly. Both are based on the 
"[IOBWS3.0.yaml](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/IOBWS3.0.yaml)" 
definition document, and share schema types and API resources. They will still be treated separately.

The intended audience for this specification document ÍST TS-310 are the implementors of banking services as well as of those systems that will consume them as API clients. The reader is expected to have basic understanding of the Icelandic financial products involved and that when needed, further documentation on those aspects will be supplied by banks exposing each procuct's services.

The previous IOBWS technical specifications did in large parts consist of transforming the XML Schema and SOAP definitions into human readable format. The expectations is that for technical contracts using OpenAPI specifications, a plethora of utilities, and API tools exist to convert them into documentation or even navigatable UIs.

Consequently, this specification will avoid unecessarily repeating information found in the accompanying technical contract as much as possible, and the reader should not expect the specification to replace user centric documentation, such as by describing overall flows, schema types or even examples, other than in line with goals of this document. 

The approach in both TS-310 and TS-313 is instead to focus on the domestic adaptations to the relevant parts of the NextGenPSD2 framework, and the information needed to tie that to earlier IOBWS versions, and even the Core Banking systems involved. 

# Normative references, definitions and symbols 

## Terminalog and Definitions 

- **Kennitala**: The Icelandic ID number (often abbreviated as kt.) is a unique national identificatio number used by the Icelandic government to identify individuals, an with a comparable schema, legal entities in Iceland.

- **Icelandic IBAN** definition <https://en.wikipedia.org/wiki/International_Bank_Account_Number> ISO 13616:1997.

- **ISO 20022** is an ISO standard for electronic data interchange between financial institutions.

- **Clearing and Settlement Mechanisms** (CMS) are the

- **Core Banking Systems** (CBS) are the

- **eIDAS** Regulation (EU) No 910/2014 of the European Parliament and of the Council of 23 July 2014 on electronic identification and trust services for electronic transactions in the internal market and repealing Directive 1999/93/EC

- **IOBWS** The acronym for the Icelandic Open Banking Web Services, often used to refer to the project as well as its product.

- **FUT** is the IT sector council at Icelandic standards.

- **Berlin Group** is a pan-European payments interoperability standards and harmonisation initiative with the primary objective of defining open and common scheme- and processor-independent standards in the interbanking domain between Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the work carried out by e.g. the European Payments Council. As such, the Berlin Group has been established as a pure technical standardisation body, focusing on detailed technical and organisational requirements to achieve this primary objective.

- **PSD2** an acronym for the revised Payment Service Directive (EU 2015/2366) instituted by the European Parliament, meant to further open up payment services  on the internal EEA market.  Among other changes \[PSD2\] contains regulations of new services to be operated by so-called Third-Party Payment Service Providers (TPP) on behalf of a Payment Service User (PSU), by leveraging Strong Customer Authentication (SCA):

  - **Payment Initiation Service** (PIS) to be operated by a Payment Initiation Service Provider (PISP) TPP as defined by article 66 of \[PSD2\].

  - **Account Information Service** (AIS) to be operated by a Account Information Service Provider (AISP) TPP as defined b article 67 of \[PSD2\].

  - **Confirmation of the Availability of Funds Service** to be use by Payment Instrument Issuing Service Provider (PIISP) TPP a defined by article 65 of \[PSD2\].

  - **PSU**: Payment Service User. The end-user of payment service.

  - **SCA**: Strong Customer Authentication. Defined by the EBA in its RTS on SCA as "an authentication based on the use of two or more elements categorised as knowledge (something only the user knows \[for example, a password\]), possession (something only the user possesses \[for example, a particular cell phone and number\]) and inherence (something the user is \[or has, for example, a fingerprint or iris pattern\]) that are independent, \[so\] the breach of one does not compromise the others, and is designed in such a way as to protect the confidentiality of the authentication data."

\newpage

# Implementation

## Service Overview

The original mandate agreed by TN-FMÞ-VH-1, TN-FMÞ-VH-2 and iterated in the workgroup TN-FMÞ-VH-8, calls for ÍST TS-310 to stay as true to the NextGenPSD2 specification as possible. Domestic adaptations should only be used when the absolutely necessary, and it should remain straightforward to compare against future version released by the Berlin Group. 

Another previously mentioned general goal of IOBWS v3, is to move closer to standards such ISO 20022 that, if not immediately comparable to the NextGenPSD2 json types, can be found in its use of the ISO 20022 dictionary and data elements. are in alignment with the data models used by current banking, core banking (CB), and clearing and settlement mechanisms (CSM) in Iceland, or the near future. ISO 20022 types are referenced 

Overall, only a few additional parameters are needed to support the functionality and products, expected in IOBWS by the Icelandic market. Some of these needs might be addressed in future versions of NextGenPSD2
After weighing a few approaches, the decision is to keep most of the NextGenPSD2 OpenAPI definition intact, even those services and types that are not currently applicable to the Icelandic context or intended use of the IOBWS.
The domestic payment  products (see subsequent section) are defined separately, with applicable json schema types, instead of polluting the original SEPA (or potentially Pain) message types with new, the  implementation is be more straightforward for all stakeholders, while still reusing the generic services resources and operations for payments in the NextGenPSD2 specification.   The table below list the implications for the YAML contract. It includes e.g. Constent and Signing Basket services, whose removal or commenting out would have a high impact on the contract structure. They will not be implemented as part of this specification.
 This will make comparison between version easy and faciliate tactical decisions when and if the part of TS-310 specific to Iceland, should be updated.  
 [@tbl:svcsupport]

 As the overriding goal of IOBWS v3 is to move closer to standards such ISO 20022 that are in alignment with
the overall direction domestic core- and interbanking systems have been taking. Despite this, 
a few additional parameters were needed to support existing data flows, expected functionality, or to comply 
with domesic financial regulation. 

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Payment Initiation Service (PIS)**        | Supported by all implementators of TS-310 in accordance with the specification (see later notes on Periodic Payments).      |
| **Account Information Service (AIS)**       | Supported by all implementators of TS-310 in accordance with the specification. |
| **Confirmation of Funds Service (PIIS)**    | Supported by all implementators of TS-310, in accordance with the specification.  |
| **Consent Service**                         | Explicitly not part of the TS-310 specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
| **Signing Baskets Service (SBS)**           | Explicitly not part of the TS-310 specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
:Service support in ÍST TS-310. {#tbl:svcsupport}

## Payment Initiation Service

### Overview

As the overriding goal of IOBWS v3 is to move closer to standards such ISO 20022 that are in alignment with
the overall direction domestic core- and interbanking systems have been taking. Despite this, 
a few additional parameters were needed to support existing data flows, expected functionality, or to comply 
with domesic financial regulation. 

Therefore, the payment products supported by ÍST TS-310 are as shown in the table below: 

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Credit Transfers**     | Instant credit transfer of an amount between two accounts within the same bank or between two domestic banks.                         |
| **Claim Payments**       | Make a withdrawal from account to pay a claim (e.g. a bill). The claim can be created in any domestic bank. |
| **Credit Card Deposits** | Make a withdrawal from account to pay onto the account behind a payment card, within the same bank or between two domestic banks.  |
:Domestic payment products. 

For each of these, the support for payment services is as follows

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **payments**     | Supported by all implementators of TS-310 in accordance with the specification, for all domestic payment products.                         |
| **bulk-payments**       | Supported by all implementators of TS-310 in accordance with the specification, for all payment products. |
| **periodic-payments** | Explicitly not part of the TS-310 specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract. |
:Availability of payment service.


### Supporting adaptations to the NextGenPSD2 OpenAPI Specification

The document will further focus on highlighting the specific domestic adaptations and how they relate to

-  **Only JSON is supported**: No XML is catered for in the payment products supported by the TS-310 specifications.

-  **Credit Limit Query supported**: It is possible to query account information to get information on the allowed credit limit (withCreditLimitQuery).

-  

### Domestic payment products

The following elements are used in the domestic payment products:

  --------------------------------------------------------------------------------------
  **Data Element**                         **Credit         **Claim      **Credit Card
                                           Transfers**       Payments**    Deposits**
  ---------------------------------------- ---------------- ------------ ---------------
  endToEndIdentification                   Optional         Optional     Optional

  debtorAccount                            Mandatory        Mandatory    Mandatory

  debtorId                                 Optional         Optional     Optional

  chargesAccount                           n.a              n.a          n.a

  ultimateDebtor                           Optional         Optional     Optional

  ultimateDebtorId                         Optional         Optional     Optional

  instructedAmount                         Mandatory        Mandatory    Mandatory

  creditorAccount                          Mandatory        Mandatory    Mandatory

  creditorAgent                            n.a              n.a          n.a

  creditorAgentAddress                     n.a              n.a          na.

  creditorName                             n.a              n.a          n.a

  creditorId                               Optional         Optional     Optional

  creditorAddress                          n.a              n.a          n.a

  ultimateCreditor                         Optional         Optional     Optional

  ultimateCreditorId                       Optional         Optional     Optional                         

  icelandicPurpose                         Optional         Optional     Optional

  chargeBearer                             n.a              n.a          n.a

  remittanceInformationUnstructured        Optional         Optional     Optional

  remittanceInformationStructured          Optional         Optional     Optional

  requestedExecutionDate                   Optional         Optional     Optional

  partialPayment                           n.a.             Mandatory    n.a.

  serviceLevel                             n.a              n.a          n.a

  centralBankPurpose                      n.a              n.a          n.a
  --------------------------------------------------------------------------------------

To highlight the use of each attribute the table below contains information on their use not
obvious from the schema defenitions:

  ------------------------------------------------------------------------------------------
  Field                                   Description
  --------------------------------------- --------------------------------------------------
  endToEndIdentification                  Can be to transit a message, ID or short
                                          description that is communicated to the creditor,
                                          across different banks.

  debtorAccount                           Debtor account is the account used to transfer
                                          money from.

  debtorId                                Should contain the kt. of the debtor.

  ultimateDebtor                          Ultimate Debtor identifies the party that owes the
                                          cash to the Creditor as a result of receipt of
                                          goods or services. To name the original recipient
                                          of the invoice, Ultimate Debtor, in cases where it
                                          is different from the Payer.

  ultimateDebtorId                        Ultimate Debtor identifies the party that owes the
                                          cash to the Creditor as a result of receipt of
                                          goods or services. Ultimate debtor kt. is included
                                          when different from the debtor Id.

  instructedAmount                        Amount and currency to be transferred.

  creditorAccount                         Creditor account is the account used to transfer
                                          money to Beneficiary's account. In the case of a
                                          claim payment, this would be contain the claim key
                                          as represente as a BBAN number.

  creditorId                              Can be used to define id of the creditor. Creditor
                                          is the party whose account is credited with the
                                          payment.

  creditorName                            The creditor name is not necessary due to the fact
                                          that kennitala is part of the IBAN number.

  creditorAddress                         The creditor address is not needed in domestic
                                          payments where kennitala is part of the IBAN number
                                          and can be used as lookup key through the
                                          national registry.

  ultimateCreditor                        The creditor (for example a finance company or an
                                          intermediary in a business transaction), may be
                                          different from the ultimate creditor. The payer
                                          can enter who the final/real beneficiary of the
                                          payment is.In the case of credit card deposit
                                          using the masked pan ultimate Creditor contains
                                          the owner of the card.

  ultimateCreditorId                      In the case of credit card deposit using the
                                          masked pan ultimate Creditor Id contains kennitala of
                                          the owner of the card.

  icelandicPurpose                        The purpose or as previously, category code (is. *textalykill*)
                                          used to classify the transaction. Determined by codes
                                          available in each originating bank.

  remittanceInformationStructured         The debtors's information about the payment. The
                                          "referenceissuer" field contains the reference (is.
                                          *tilvísun*), that previously was used for the 
                                          kt. of the creditor, that now has a separate parameter.
                                          The "reference" field is used for the bill number
                                          (is. *seðilnúmer*, 7 characters).

  remittanceInformationUnStructured       Is used for payment description visible for both parties 
                                          (is. *skýring greiðslu*). Only 16 characters can be expected
                                          to be used, even if the field accepts 140 characters.

  executionDate                           Execution date if not today, if used then set as a
                                          future date (is. *framvirk greiðsla*).

  executionTime                           Not supported by this specification. Would allow
                                          payment instruction to be performed at specific
                                          date, and time. Possible future enhancement.

  partialPayment                          Applies when a claim is paid by paying an
                                          amount from debtor account towards an existing claim. If
                                          claim allows partial payment and API consumer want
                                          to pay for example ISK 500 of ISK 1000 claim, then
                                          this flag is used.
  ------------------------------------------------------------------------------------------

## Bulk Payments


  ---------------------------------------------------------------------------------------
  **Data Element**         **Type**      **Condition**   **Description**
  ------------------------ ------------- --------------- --------------------------------
  batchBookingPreferred    Boolean       optional        If this element equals true, the
                                                         PSU prefers only one booking
                                                         entry. If this element equals
                                                         false, the PSU prefers
                                                         individual booking of all
                                                         contained individual
                                                         transactions. The ASPSP will
                                                         follow this preference according
                                                         to contracts agreed on with the
                                                         PSU.

  debtorAccount (incl.     Account       mandatory       
  type)                    Reference                     

  paymentInformationId     Max35Text     Optional        Unique identification as
                                                         assigned by the sending party to
                                                         unambiguously identify this bulk
                                                         payment. - This attribute may be
                                                         used by ASPSPs or communities as
                                                         an optional field. - Remark for
                                                         Future: This attribute might be
                                                         made mandatory in the next
                                                         version of the specification.

  requestedExecutionDate   ISODate       optional        If contained, the payments
                                                         contained in this bulk will be
                                                         executed at the addressed date.
                                                         This field may not be used
                                                         together with the field
                                                         requestedExecutionTime.

  requestedExecutionTime   ISODateTime   optional        If contained, the payments
                                                         contained in this bulk will be
                                                         executed at the addressed
                                                         Date/Time. This field may not be
                                                         used together with the field
                                                         requestedExecutionDate.

  payments                 Bulk Entry    mandatory       The Bulk Entry Type is a type
                                                         which follows the JSON formats
                                                         for the supported products for
                                                         single payments, excluding the
                                                         data elements: debetorAccount,
                                                         requestedExecutionDate,
                                                         requestedExecutionTime. Those
                                                         three data elements may not be
                                                         contained in any bulk entry.
  ---------------------------------------------------------------------------------------

# Accounts

This 

## 
