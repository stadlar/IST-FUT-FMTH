---
title: "ÍST TS 310:2020"
author: ICS. 3.060
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

\newpage

# Foreword {.unnumbered}
  This ÍST Technical Specification was developed in accordance with "ÍST
  Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.*
  IST rules on Technical Specifications, Technical Reports and Workshop
  Agreements). The TS (Technical specification) was prepared by the
  technical committee TN-FMÞ (The Technical Committee on Financial 
  Services) that operates within FUT (Sector committee for ICT
  standardisation) following a public call for participation within
  TN-FMÞ. The final draft was sent to the TN-FMÞ on the 2022-01-XX and
  approved by correspondence on the 2022-XX-XX. 
  The text of ÍST TS-310 was submitted to IST for publication on 2022-02-XX.
  
  The accompanying OpenAPI 3.0.1 defenition "IOBWS3.0.yaml" located at 
  https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables, should
  be viewed as an integral part of ÍST TS-310. Future versions
  of the document "ÍST TS 310_2020 Domestic payments and deposits.md", that is
  the source of this rendition, will be used to communicate errata and clarifications
  though each will need a workshop agreements to establish patch or minor
  releases of the IOBWS.
 
  The work on the ÍST TS was primarly funded by Íslandsbanki, Arion Banki and 
  Landsbankinn. It is the result the workgroup TN-FMÞ-VH-8.
  In parts the work is the earlier workshop agreement WA-310 
  authored by TN-FMÞ-VH-1 on Technical requirements 
  and TN-FMÞ-VH-2 on Business requirements, with participation of an external consultant. 
  WA-310 was approved within TN-FMÞ on the 2019-12-12. 
  ÍST TS-310 should, however, not be viewed as a direct succesor to that agreement,
  which focused on laying groundwork for PSD2 compliance. Instead TS-310 is the
  next version of the Icelandic Online Banking Services, replacing TS 161:2013 *Greiðslur*
  and TS 164:2013 *Yfirlit bankareikninga*.

  ÍST TS-310 is not subject to any patent rights. The underlying OpenAPI specification
  is derived from the Berlin Group's NextGenPSD2 Framework, and similar to that, distributed under a 
  Creative Commons Attribution 4.0 International Public License (CC BY).

  This means that the YAML Specification for ÍST TS-310 can be copied and redistributed in any
  medium or format for any purpose, even commercially, and when shared,
  that appropriate credit must be given, a link to the license must be
  provided, and indicated if changes were made. You may do so in any
  reasonable manner, but not in any way that suggests the licensor
  endorses you or your use. In addition, if you remix, transform, or build
  upon the specification, you may not distribute the modified
  specification.

  The Technical Committee's participants have made every effort to ensure
  the reliability and accuracy of the technical and non-technical content
  of ÍST TS-310, but this does not guarantee, either explicitly or
  implicitly, its correctness. Users of ÍST TS-310 should be aware that
  neither the TN-FMÞ, nor IST can be held liable for damages or losses of
  any kind whatsoever which may arise from its application. Users of ÍST
  TS-310 do so on their own responsibility and at their own risk.

# Introduction {.unnumbered}

This Technical Specification (TS) present version 3.0 of the Icelandic 
Online Banking Services (IOBWS), for domestic payments and deposits. 

Previous versions of IOBWS, released
in 2007 and 2013 respectively, used the most recent OASIS SOAP
standards at the time, to define common web service interfaces for
the Icelandic market. This enabled software vendors, enterprises
and service providers to integrate their accounting, payment, and information
systems with the commercial and savings banks, to act on behalf of the
customers and with full access to their data.

Iceland, with its homogeneous financial landscape, has enjoyed instant
credit transfers between all the banks since 1987, with real-time gross
settlements, and other universally accepted services such as the common collection 
solution (Kröfupotturinn) for issuing and paying claims. All this functionality
was expected and has been available through IOBWS v1 and v2, comparable to 
the functionality enjoyed by users of the online banking Web UIs.

When initiating work on the previous versions, the participants in
the TN-FMÞ started out with reviewing existing or emerging specifications 
in the global or mostly European financial industry. None were deemed a 
good fit at the time for local adaptation, as they reflected inherent the legacy
in inter-bank communications outside Iceland, even in the case of other 
Nordic countries.

Meanwhile, the broader market and new technology standards in Europe been catching up. 
The Open Banking regulation in UK and the PSD2 regulation issued by the European Parliment
gave rise to initiatives to standardize access to payment functionality and 
account information, on behalf of customers by third parties. One such effort, the 
NextGenPSD2 Framework developed by the Berlin Group, has met a broad acceptance in the EEA. 
The data model references ISO 20022, and close enough to how the Icelandic market has evolved as to
make it a relatively straightforward to adapt IOBWS to use it as a base, instead of maintaining 
an independant linage of API specifications. 

Another goal with v3 that is achieved in adopting the NextGenPSD2 Framework, is moving to
a REST like API defined by a recent version of the Open API Specification, and implement
open authentication and authorization standards that should solve some of the complexity
involved with previous incarnations of the IOBWS.

# Scope 

ÍST TS-310 defines web application programming interfaces to be implemented by commercial
and savings banks, when exposing common functionality and information for domestic payments and deposits. 

Related ÍST TS documents address other parts of the overall IOBWS framework, either as upgrades to
the previous specification or new additions in this version. As both the implementation and consumption of
individual specifications is optional, the documents are mostly independent.

Some additional guidelines and common concerns will be addressed in the ÍST WA-316 workshop agreement, 
and other supporting material that might be similarily released through workshop agreements.

Due to the origin of the underlying OpenAPI specification in the Berlin Group NextGenPSD2
Framework, ÍST TS-310, and ÍST TS-313 on Foreign Payments ovelap. Both share the same 
underlying "IOBWS3.0.yaml" definition document, as well as schema types and API resources. The
approach in both specification is also to focus on the domestic adaptations to the framework
and refer to the implemenation guidelines for 1.3.8 of the NextGenPSD2 framework, if general
issues need answering. 

The intended audience for this specification document is implementors of banking services as well 
as those of those systems that will consume them as API clients. The reader is expected to have some
basic knowledge of Icelandic payment and deposits products, but a fair amount of 
expertise when it comes to OpenAPI specifications. Consequently, the specification will
forgo repeating documentation found in the accompanying YAML document, as much as possible. 
The previous IOBWS specifications e.g. version 2 did so out of necessity as the XML Schema 
and SOAP definition documents could hardly be considered human-readable. Today, a plethora 
of plugins, utilities, and API tools exist to help turn API specifications into navigatable 
UIs, that will without a doubt exists alongside all IOBWS v3 implementation. Repeating 
descriptions of e.g. schema types or even examples is therefore considered redundant in this document.   

# Normative references, definitions and symbols 

## Terminalog and Definitions 

-   **Kennitala**: The Icelandic ID number (often 
    abbreviated as kt.) is a unique national identification
    number used by the Icelandic government to identify individuals, and
    with a comparable schema, legal entities in Iceland.

-   **Icelandic IBAN** definition
    <https://en.wikipedia.org/wiki/International_Bank_Account_Number>
    ISO 13616:1997.

-   **ISO 20022** is an ISO standard for electronic data interchange
    between financial institutions.

-   **eIDAS** Regulation (EU) No 910/2014 of the European Parliament
    and of the Council of 23 July 2014 on electronic identification and
    trust services for electronic transactions in the internal market
    and repealing Directive 1999/93/EC

-   **IOBWS** -- The acronym for the Icelandic Open Banking Web
    Services, often used to refer to the project as well as its product.

-   **FUT** is the IT sector council at Icelandic standards.

-   **Berlin Broup** is a pan-European payments
    interoperability standards and harmonisation initiative with the
    primary objective of defining open and common scheme- and
    processor-independent standards in the interbanking domain between
    Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the
    work carried out by e.g. the European Payments Council. As such, the
    Berlin Group has been established as a pure technical
    standardisation body, focusing on detailed technical and
    organisational requirements to achieve this primary objective.

-   **PSD2** an acronym for the revised Payment Service Directive (EU 2015/2366)
    instituted by the European Parliament, meant to further open up payment services 
    on the internal EEA market. 
    Among other changes \[PSD2\] contains regulations of new services
    to be operated by so-called Third-Party Payment Service Providers
    (TPP) on behalf of a Payment Service User (PSU), by leveraging
    Strong Customer Authentication (SCA):

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

\newpage

# Implementation

## Service Overview

The aim of ÍST TS-310 was to stay as true as possible to the NextGenPSD2 specification, making
it possible to easily compare against future version released by the Berlin Group in order to evaluate if 
the Icelandic version should be upgraded. After weighing a few approaches, this resulted in
a decision to keep almost all of the NextGenPSD2 OpenAPI definition intact, even though some
of the services described are not applicable currently to the intended use of IOBWS. The table
below describes how this means the YAML contract includes e.g. Constent and Signing Basket services,
whose removal would have a high impact on the contract structure but will not be implemented as
part of this specification.

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Payment Initiation Service (PIS)**        | Supported by all implementators in accordance with the specification.      |
| **Account Information Service (AIS)**       | Supported by all implementators in accordance with the specification. |
| **Confirmation of Funds Service (PIIS)**    | Optionally supported by the implementators, in accordance with the specification.  |
| **Consent Service**                         | Explicitly not part of the TS-310 specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
| **Signing Baskets Service (SBS)**           | Explicitly not part of the TS-310 specification, but included for comparison and compatability with the NextGenPSD2 OpenAPI contract.  |
:Service support in ÍST TS-310. 

## Payment Initiation Service

An overriding goal of ÍST TS-310 was to keep the functionality expected by users of domestic payments, but move
towards closer alignement with ISO 20022 whenever possible. Despite this, it turned out that a few additional
parameters where needed, support value-added information exchange, and functionality as well as for compliance.
The most straightforward way to communcate in the OpenAPI specification was to define separate domestic payment 
products (see following table) and applicable json schema types.  

|                          |                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| **Credit Transfers**     | Transfer króna between two accounts within the same bank or between two domestic banks.                         |
| **Claim Payments**       | Make a withdrawal from account to pay a claim (e.g. a bill). The claim can be created in any domestic bank. |
| **Credit Card Deposits** | Make a withdrawal from account to pay onto the account behind a payment card, within the same bank or between two domestic banks.  |
:Domestic payment products. 

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

  centralBankPurposeCode                   Optional         Optional     Optional
  --------------------------------------------------------------------------------------

To highlight the use of each attribute the table below contains information on their use not
obvious from the schema defenitions:

  ------------------------------------------------------------------------------------------
  Field                                   Description
  --------------------------------------- --------------------------------------------------
  endToEndIdentification                  Used by the deptor to send the short 
                                          description across.???

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

  creditorAddress                         The creditor address is not necessary due to the
                                          fact that kennitala is part of the IBAN number and
                                          kennitala can be used as lookup key through the
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
                                          date, and time.

  partialPayment                          Applies when a claim is paid by paying an
                                          amount from debtor account towards an existing claim. If
                                          claim allows partial payment and API consumer want
                                          to pay for example ISK 500 of ISK 1000 claim, then
                                          this flag is used.
  ------------------------------------------------------------------------------------------

# Accounts

This 

## 
