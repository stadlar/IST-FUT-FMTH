## Normative References

The following documents are referred to in ÍST {{spec_id} as some of their content constitutes requirements of this document. Only the edition cited applies, if newer editions exist.  

::: {#refs}
:::

## Terms and definitions
- **Berlin Group** is a pan-European payments interoperability standards and harmonisation initiative with the primary objective of defining open and common scheme- and processor-independent standards in the interbanking domain between Creditor Bank (Acquirer) and Debtor Bank (Issuer), complementing the work carried out by e.g. the European Payments Council. As such, the Berlin Group has been established as a pure technical standardisation body, focusing on detailed technical and organisational requirements to achieve this primary objective.
- **Clearing and Settlement Mechanisms** (**CMS**) refers to the processes or systems used in exchange between two payment service providers. In Iceland, the Central Bank acts as the interbank mediary in this scope.
- **Core Banking Systems** (**CBS**) is the umbrella term for those systems handling payments and transaction accounts in relation to this specification.
- **Electronic IDentification, Authentication and trust Services** (**eIDAS**) refers to regulation 910/2014 [@EU910/2014], which replaced previous directive 1999/93/EC. It was introduced to Iceland law through act no. 2019/55 [@IS2019/55].
- **ISO 20022** is an ISO standard for electronic data interchange between financial institutions.
- **Kennitala** (often abbreviated as **KT**) is the unique national identification number issued by the Registers Iceland (ic. Þjóðskrá Íslands) and used by governmental bodies and enterprises to identify individuals, and through a comparable schema under the Iceland Revenue and Customs (ic. ríkisskattstjóri), legal entities in Iceland.
- **The OpenAPI Specification** (**OAS**) defines a programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic.

## Payment service directive terms

As the ÍST {{spec_id}} owes much of its core to the NextGenPSD2 framework, the terms found in the OpenAPI specification and this document may reflect that background. Some of the main definitions are included here for context.  

- **Payment Services Directive 2** (**PSD2**) was instituted by the European Parliament as EU 2015/2366 [@EU2015/2366], and meant to further open up payment services on the internal EEA market. It was introduced to Iceland law through act no. 2021/114 [@IS2021/114]. PSD2 contains regulations of new services to be operated by so-called Third-Party Payment Service Providers on behalf of a Payment Service User, by leveraging Strong Customer Authentication. Due to the linage connecting PSD2 with IOBWS v3.0, the main terms are described:
  - **Account Information Service Provider** (**AISP**) are *TPPs* with permission to connect to a transaction account and use the information to provide a **Account Information Services** (**AIS**) as defined in article 67 of EU 2015/2366 [@EU2015/2366].
  - **Confirmation of the Availability of Funds Service** to be use by Payment Instrument Issuing Service Provider (PIISP) TPP a defined by article 65 of EU 2015/2366 [@EU2015/2366].
  - **Payment Initiation Service Provider** (**PISP**) can, given customers consent, initiate payments and transactions on the their behalf, from their bank account, thereby providing **Payment Initiation Service** (**PIS**) as defined by article 66 of EU 2015/2366 [@EU2015/2366].
  - **Payment Service User** (**PSU**). The end-user of payment services, and customer of the bank in the IOBWS context.
  - **Strong Customer Authentication** (**SCA**), refers in the scope of PSD2 to an authentication mechanism based on the use of two or more elements that are independent, so a breach of one does not compromise the others. The recognized elements or factors can be based on: 
      - Knowledge, something only the user knows e.g. a password.
      - Possession, something only the user possesses e.g. a particular cell phone and number.
      - Inherence, something the user is or has, e.g. a fingerprint or iris pattern.
  - **Third Party Provider** (**TPP**) is referenced in the OpenAPI specification reflecting the PSD2 background, when the client system is initiating operations or requesting information on behalf of the end-consumer.

## Data definitions

- **The International Bank Account Number** (**IBAN**) format for Icelandic accounts should follow the specification set forth in ISO 13616-1:2020 [@ISO13616-1] as shown in the [table @tbl:ice_iban] below.  

  -----------------------------------------------------------------------------------------------
                Country   Check      National    Branch     Account    Account     Account    
                Code      Digits     Bank        ID         type       Number      Holders    
                                    Code                                          Kennitala
  ------------- --------- ---------- ----------- ---------- ---------- ----------- --------------
  Description   IS        2 digits   2 digits    2 digits   2 digits   6 digits    10 digits  

  Example       IS        14         01          59         26         007654      5510730339 
  -----------------------------------------------------------------------------------------------
  :Icelandic IBAN with example {#tbl:ice_iban}