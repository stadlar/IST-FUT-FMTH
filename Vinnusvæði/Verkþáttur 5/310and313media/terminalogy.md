## Terminalogy

- **Berlin Group** is a pan-European payments interoperability standards and harmonisation initiative with the primary objective of defining open and common scheme- and processor-independent standards in the interbanking domain between Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the work carried out by e.g. the European Payments Council. As such, the Berlin Group has been established as a pure technical standardisation body, focusing on detailed technical and organisational requirements to achieve this primary objective.
- **Clearing and Settlement Mechanisms** (**CMS**) refers to the processes or systems used in exchange between two payment service providers. In Iceland, the Central Bank acts as the interbank mediary in this scope.
- **Core Banking Systems** (**CBS**) is the umbrella term for those systems handling payments and transaction accounts in relation to this specification.
- **Electronic IDentification, Authentication and trust Services** (**eIDAS**) refers to regulation 910/2014 of the European Parliament and of the Council, which replaced previous directive 1999/93/EC.
- **ISO 20022** is an ISO standard for electronic data interchange between financial institutions.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (is. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (is. ríkisskattsjótir), legal entities in Iceland.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.
- **Payment Services Directive 2** (**PSD2**) was instituted by the European Parliament as EU 2015/2366, meant to further open up payment services on the internal EEA market. PSD2 contains regulations of new services to be operated by so-called Third-Party Payment Service Providers on behalf of a Payment Service User, by leveraging Strong Customer Authentication. Due to the linage connecting PSD2 with IOBWS v3.0, the main terms are described:
  - **Account Information Service Provider** (**AISP**) are *TPPs* with permission to connect to a transaction account and use the information to provide a **Account Information Services** (**AIS**) as defined in article 67 of \[PSD2\].
  - **Confirmation of the Availability of Funds Service** to be use by Payment Instrument Issuing Service Provider (PIISP) TPP a defined by article 65 of \[PSD2\].
  - **Payment Initiation Service Provider** (**PISP**) can, given customers consent, initiate payments and transactions on the their behalf, from their bank account, thereby providing **Payment Initiation Service** (**PIS**) as defined by article 66 of \[PSD2\].
  - **Payment Service User** (**PSU**). The end-user of payment services, and customer of the bank in the IOBWS context.
  - **Strong Customer Authentication** (**SCA**), refers in the scope of PSD2 to an authentication mechanism based on the use of two or more elements that are independent, so a breach of one does not compromise the others. The recognized elements or factors can be based on: 
      - Knowledge, something only the user knows e.g. a password.
      - Possession, something only the user possesses e.g. a particular cell phone and number.
      - Inherence, something the user is or has, e.g. a fingerprint or iris pattern.
  - **Third Party Provider** is referenced in the IOBWS, for the role of the initiating and information requesting   

## Data definitions

- **The Icelandic IBAN** data elements should follow specification set forth in ISO 13616:2020 as shown in the [table @tbl:ice_iban] below.  

-----------------------------------------------------------------------------------------------
              Country   Check      National    Branch     Account    Account     Account    
              Code      Digits     Bank        ID         type       Number      Holders    
                                   Code                                          Kennitala
------------- --------- ---------- ----------- ---------- ---------- ----------- --------------
Description   IS        14         2 digits    2 digits   2 digits   6 digits    10 digits  

Example       IS        14         01          59         26         007654      5510730339 
-----------------------------------------------------------------------------------------------
:Icelandic IBAN with example {#tbl:ice_iban}