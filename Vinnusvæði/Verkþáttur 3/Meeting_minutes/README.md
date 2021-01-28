# 2021-01-28
- Reynum að fá svör fyrir næstu fjóra liði eigi síðar en 16:00, 1. feb 2021  
- "endToEndIdentification", skoða betur
- "serviceLevel", skoða betur
- "paymentInitiation", gerum ekki breytingu. Vísum í Rakhnífur Ockhams.
- Ekki verður boðið upp á blandaða bunkagreiðslu (SWIFT), en það 
  verður endurskoðað á næsta fundi
- Tillaga samþykkt að hafa eftirtaldin svæði í haus á fyrirspurnum:
    - Content-Type   (Mandatory)
    - X-Request-ID   (Mandatory)
    - Authorization  (Mandatory)
    - PSU-IP-Address (Mandatory)


# 2021-01-26
- Erlendar greiðslur
  - Setja inn texta sem segir að BBAN sé ekki stutt í erlendar greiðslur
  - Getum svæðið debtorId n/a þar sem það á ekki við um erendar greiðslur  
- Bankar verkefni:
    - Skoða "endToEndIdentification" svæðið og notkun fyrir SEPA og SWIFT
    - Skoða samræmingu á svæðinu "serviceLevel" og hvort svæðið eigi við um
      SEPA og SWIFT
    - Viljum við bæta við í "paymentInitiation" til að halda sérstaklega utan um foreign payment vörur (sjá dæmi)
      /*
      content:
        application/json:
          schema:
            oneOf: #Different Payment products in JSON
              - $ref: "#/components/schemas/paymentInitiation_json"
              - $ref: "#/components/schemas/periodicPaymentInitiation_json"
              - $ref: "#/components/schemas/bulkPaymentInitiation_json"
      */
    - Viljum við bjóða upp á blandaða bunkagreiðslu (SWIFT) þar sem móttöku reikningar væru í mismunandi mint
    - Taka umræðu um B2B vs. PSD2


    
          


Servicelevel: 
            ExternalServiceLevel1Code A set of codes defined outside the schema. The allowed values are 
            { BKTR, NUGP, NURG, PRPT, SDVA, SEPA, URGP, URNS }.
            For full list of codes, see §0 ISO ExternalServiceLevel1Code. 



# 2021-01-19
- Endurnefna greiðsluvörur og taka út "Icelandic"
  - Icelandic SEPA credit transfers -> SEPA credit transfers
    - url: sepa-credit-transfers
  - Icelandic Cross border credit transfers -> Cross border credit transfers
    - url: cross-border-credit-transfers
- Svæðin (UltimateDebtor, UltimateDebtorId og UltimateCreditor) verða tekin út úr SEPA og CB
- Laga demo slóðir
- Nota Íslenskt demo IBAN númer
- Förum yfir stofnun á bunkagreiðslum



# 2021-01-12
- Klippa skjalið niður og lista aðeins upp breytingar á berlin-group
  til að uppfylla Íslenskar kröfur
- Taka út úr yaml, [consents, funds-confirmations, signing-basket]
- Laga inndráttar og reference villu í yaml.

# 2021-01-12
- Breytinga sem voru framkvæmdar núna.
  - currencies/{quote-currency}/rates í 
    currencies/{base-currency}/rates
  - Laga nafnavenjur á *_PATH 


# 2020-12-15
- Kostnaðarliðir (sundurliðaður þegar við á)
    - SWIFT
        - Þóknun
        - Hraðsending [Já/Nei]
        - Kostnaður viðtakenda (Shared vs. Ours)
    - SEPA

    GJH -> SWIFT -> Paul Citybank ( ISK -> USD )
        - 1000 kr. (Þóknun)
        - 2000 kr. (Hraðsending)
        - 3000 kr. (Kostnaður viðtakenda)
        ----------
          6000 kr.



# 2020-12-08
- Beneficiaries þjónustur verða ekki teknar lengra
- Heimavinna fyrir bankanna
    - paymentInitationRequestResponse-201 (Kostnaðarliðir) lína: 7509


# 2020-12-01
- Heimavinna fyrir bankanna
  - Skoða hvort fx upplýsingar séu nægjar í svargildi við payment initiation.
  - Kostnaðarliðir?
  - Trusted beneficiaries þjónusta?
  - Beneficiaries þjónusta?
    
# 2020-11-24
- "creditorName" -> mandatory
- "creditorAddress" -> mandatory
- "purposeCode" -> n/a. Ekki þörf fyrir svæðið, en mögulega getur það breyst í framtíðinni.
- "remittanceInformationUnstructured" -> optional svæði. Hámark 140 stafir.
- Heimavinna fyrir bankanna
  - Trusted beneficiaries þjónusta
  - beneficiaries þjónusta
  - Dæmi um greiðslu til USA t.d. Wells Fargo ....


# 2020-11-17
- Fyrir bunka verður einn úttektarreikningur og valkvætt einn kostnaðarreikningur
- Skilgreina valkvæma þjónustu sem skilar upplýsingar um gjaldeyriskaupa. _links væri settur fyrir þessar upplýsingar
- transactionStatus uppfyllir kröfur
- Skilgreina [Payments, Bulk] fyrir [sepa-credit-transfer, cross-border-credit-transfers]
- Heimavinna fyrir bankanna
  - Er "creditorName" mandatory?
  - Er "creditorAddress" mandatory?
  - Skoða hvernig "purposeCode" væri notaður fyrir erlendar greiðslur? Skv. Values from ISO 20022 External Code List ExternalCodeSets_1Q2018 June 2018
  - Skoða svæðin remittanceInformation* fyrir SEPA og Cross-border
  - Lesa yfir skjalið "ÍST-TS-311 Yfirlit debit og kreditkort-Drög8-til yfirlestrar í VH1.docx" og skila inn tillögum
    fyrir næsta fund ef einhverjar eru.
- Skilgreina "CentralBankPurpose" sem strengur 3 stafir
- Vantar svæði fyrir Kostnaðarsplit
- Vantar svæði fyrir móttökubanka fyrir cross-border

# 2020-11-03
- Skoða úttektarreikning fyrir bulk greiðslur möguleikar:
  - Einn fyrir allar innlagnir
  - Einn per innlögn
  - Í bland
- Kostnaðarreikningur fyrir greiðslufyrirmæli
- Möguleiki að hafa kvittun ekki í GET aðgerðinn fyrir greiðslufyrirmæli
  - Ef kvittun er ekki í GET þá þarf að skoða aðra leið til að sækja kvittun
- Skoða transactionStatus
        The transaction status is filled with codes of the ISO 20022 data table:
        - 'ACCC': 'AcceptedSettlementCompleted' -
          Settlement on the creditor's account has been completed.
        - 'ACCP': 'AcceptedCustomerProfile' - 
          Preceding check of technical validation was successful. 
          Customer profile check was also successful.
        - 'ACSC': 'AcceptedSettlementCompleted' - 
          Settlement on the debtor�s account has been completed.
        - **Usage:** this can be used by the first agent to report to the debtor that the transaction has been completed. 
        - **Warning:** this status is provided for transaction status reasons, not for financial information. 
          It can only be used after bilateral agreement.
        - 'ACSP': 'AcceptedSettlementInProcess' - 
          All preceding checks such as technical validation and customer profile were successful and therefore the payment initiation has been accepted for execution.
        - 'ACTC': 'AcceptedTechnicalValidation' - 
          Authentication and syntactical and semantical validation are successful.
        - 'ACWC': 'AcceptedWithChange' - 
          Instruction is accepted but a change will be made, such as date or remittance not sent.
        - 'ACWP': 'AcceptedWithoutPosting' - 
          Payment instruction included in the credit transfer is accepted without being posted to the creditor customer�s account.
        - 'RCVD': 'Received' - 
          Payment initiation has been received by the receiving agent.
        - 'PDNG': 'Pending' - 
          Payment initiation or individual transaction included in the payment initiation is pending. 
          Further checks and status update will be performed.
        - 'RJCT': 'Rejected' - 
          Payment initiation or individual transaction included in the payment initiation has been rejected.
        - 'CANC': 'Cancelled'
          Payment initiation has been cancelled before execution
          Remark: This codeis accepted as new code by ISO20022.
        - 'ACFC': 'AcceptedFundsChecked' -
          Preceding check of technical validation and customer profile was successful and an automatic funds check was positive .
          Remark: This code is accepted as new code by ISO20022.
        - 'PATC': 'PartiallyAcceptedTechnical'
          Correct The payment initiation needs multiple authentications, where some but not yet all have been performed. Syntactical and semantical validations are successful.
          Remark: This code is accepted as new code by ISO20022.
        - 'PART': 'PartiallyAccepted' -
          A number of transactions have been accepted, whereas another number of transactions have not yet achieved 'accepted' status.
          Remark: This code may be used only in case of bulk payments. It is only used in a situation where all mandated authorisations have been applied, but some payments have been rejected.
-   *Payments, *Bulk, -Periodic
-   *sepa-credit-transfers
    instant-sepa-credit-transfers
    target-2-payments
    **cross-border-credit-transfers
    *(ekki stuðningur við pain.xml)


# 2020-10-27
- Trusted Beneficiary - verður tekið fyrir eftir að kafla um erlendar greiðslur líkur.
- Skoða úttektarreikning fyrir bulk greiðslur möguleikar:
  - Einn fyrir allar innlagnir
  - Einn per innlögn
  - Í bland
- Skoða hvort "transactionStatus" uppfylli allar kröfur
- Skoða gjaldeyrisviðskipti og hvernig þeim er endurspeglað í get aðgerðinni


-   *Payments, *Bulk, -Periodic
-   *sepa-credit-transfers
    instant-sepa-credit-transfers
    target-2-payments
    **cross-border-credit-transfers
    *(ekki stuðningur við pain.xml)

## Notes

- Millifærslur
  - Seðlabankaflokkun -> centralBankPurposeCode
  - https://www.sedlabanki.is/library/Skraarsafn/Gjaldeyrismal/GV-flokkunarlyklakerfi_Sedlabankans.pdf
  
Erlend greiðsla
- credit: ""  
  
JSON

## POST

### SEPA credit transfer (payments) 
´´´
{
  "endToEndIdentification": "123456",
  "debtorAccount": {
    "iban": "IS40100100103307118608"
  },

  # Optional
  "costDebtorAccount": {
    "iban": "IS40100100103307118609"
  },
  
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
  "remittanceInformationUnstructured": "Ref Number Merchant",   #Optional
}

### Cross border credit transfer (payments) 
´´´
{
  "endToEndIdentification": "123456",
  "debtorAccount": {
    "iban": "IS40100100103307118608"
  },
  "ultimateDebtor": "",
  "ultimateDebtorId" "",

  # Optional
  "costDebtorAccount": {
    "iban": "IS40100100103307118609"
  },
  
  "creditorAgent": "PNBPUS3NNYC",
  "creditorAgentName": "",
  
  "creditorAgentAddress": {
    "townName": "NYC",
    "country": "USA"    
  },
  
  "chargeBearer": "",
    
  "expressPayment": true,  
   
  "instructedAmount": {
    "currency": "USD",
    "amount": "123.50"
  },
  "creditorAccount": {
    "iban": "NL09RABO0153893206"
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
  "remittanceInformationUnstructured": "Ref Number Merchant",   #Optional
}

´´´ 
 
ATH:
  Eftirtalin svæði voru tekin út
  - "batchBookingPreferred"
  - "requestedExecutionDate"
 
### SEPA credit transfer (bulk-payments) 


- Regla: 1-1
bunki1 = 
    {
        "debtorAccount": {"iban": "DE40100100103307118608"},
        "costDebtorAccount": {"iban": "IS40100100103307118609"}, 
        "payments": [
            "instructedAmount": {
                "currency": "EUR",
                "amount": "123.50"
            },
            "creditorAccount": {
                "iban": "DE02100100109307118603"
            }
        ]        
    }
   
- Regla: 1-1
bunki2 = 
    {
          "payments": [{
            "debtorAccount": {"iban": "DE40100100103307118609"},
            "costDebtorAccount": {"iban": "IS40100100103307118609"},
            "instructedAmount": {
              "currency": "EUR",
              "amount": "123.50"
            },
            "creditorAccount": {
                "iban": "DE02100100109307118603"
            }
          }    
    ]}


´´´
{
  "debtorAccount": {                                
    "iban": "DE40100100103307118608"
  },
  "costDebtorAccount": {                        #Optional svæði
    "iban": "IS40100100103307118609"
  },  
  "paymentInformationId": "my-bulk-identification-1234",
  "payments": [
        {
          "endToEndIdentification": "123456",
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
          "remittanceInformationUnstructured": "Ref Number Merchant",   #Optional
        }
  ]
}
´´´
  
  
  
  

## GET -> SEPA credit transfer (payments)
- ISK -> EUR

  - Kaup á EUR -> Kaupnóta
  - Millifærðar -> Creditor

- paymentInitiationWithStatusResponse
´´´
{
  "endToEndIdentification": "123456",
  "debtorAccount": {
    "iban": "IS40100100103307118608",
    "currency": "ISK"
  },

  # Optional
  "costDebtorAccount": {
    "iban": "IS40100100103307118609"
  },  
  
  "instructedAmount": {
    "currency": "EUR",
    "amount": "123.50"
  },
  "_links": [
    "https://www.banki.is/fx/..."
  ],
  "creditorAccount": {
    "iban": "DE02100100109307118603"
  },
  "creditorAgent": "ING",
  "creditorName": "Jón Jónsson",
  "creditorAddress": {
    "streetName": "Lambhagi",
    "buildingNumber": "10",
    "townName": "Reykjvík",
    "postCode": "101",
    "country": "IS"
  },
  "centralBankPurposeCode": "099", 
  "remittanceInformationUnstructured": "Ref Number Merchant",   #Optional
  "transactionStatus": "ACCC"
}
´´´ 


### GET -> SEPA credit transfer (bulk-payments) 
- bulkPaymentInitiationWithStatusResponse
```

```



# 2020-10-22
- Bæta við withBalanceQuery query param á /cards aðgerðina.
- Bæta við withBalanceQuery query param á /card-accounts aðgerðina.
- Bæta við withBalanceQuery query param á /cards/{card-id} aðgerðina.
- Bæta við withBalanceQuery query param á /card-accounts/{card-id} aðgerðina. 
- Uppfæra skjalið, bæta við lýsingum á /card-accounts aðgerðunum og schema
- Laga skilgreiningu á cardDetails schema
- Uppfæra examples nota ISK
- Laga í skjalinu "cardTransactions - CardAccountReport" þarf að vera sér týpa
- Í töfluna 6.1 Links vantar "balance"
- Passa að committa inn yaml til samræmis við 





# 2020-10-20
- Erlendar greiðslur
  - Seðlabankaflokkun
  - Samræma pain.001
  - SEPA og SWIFT verður skilgreint með greiðslu vöru
  
  - Einföld leið til að senda erlenda greiðslu
  - XML viðhengi (Pain.001..xml)
  
  Tillaga frá Landsbankinn
   - /v1/payments/{payment-product}
     - attributes.
        hvaða svæði eiga að vera hérna...
   ...
  


# 2020-10-13
- Það að skilgreina sambanka þjónustu fyrir vísitölur?
  - Arionbanki, Landsbankinn og Íslandsbanki sjá ekki sérstaka þörf fyrir þessa þjónustu
  - Ákveðið var að hætta við að hafa sérstaka vísitölu þjónustu.

- Currencies
  - Source: Skilgreina að lágmarki eftirtalda source-a
    - General = Banka gengi
    - Notes = Seðlagengi
  - Hafa aðgerð sem listar upp source-a
    - attributes:
        Source
        - Key
        - Description -> Hver banki ákveður hvaða tungumál er notað
  - Aðgerðir:
    - currencies -> Listar upp gjaldmiðla
      - query-param: {source}
      - attribute:
        List af Currency
        - Code -> ISK, USD, EU
        - Currency ISO 4217 -> Icelandic Krona
    - currencies/{quote-currency}
      - query-param: {source}
      - attributes:
        Currency
        - Code -> ISK, USD, EU
        - Currency ISO 4217 -> Icelandic Krona
    - currencies/{quote-currency}/rates
      - query-param: {source}
      - query-param: {date (Date)}
      - attributes
        Listi af CurrencyRate
        - BaseCurrency
        - QuoteCurrency
        - Buy
        - Sell
        - Mid 
        - Date -> (DateTime)
    - currencies/{quote-currency}/rates/{base-currency}
      - query-param: {source}
      - query-param: {date (Date)}
      - attributes
        CurrencyRate
        - BaseCurrency
        - QuoteCurrency
        - Buy
        - Sell
        - Mid 
        - Date -> (DateTime)
    - currencies/{quote-currency}/rates/{base-currency}/history
      - query-param: {source}
      - query-param: {from-date (Date)}
      - query-param: {to-date (Date)}
      - attributes
        Listi af CurrencyRate
        - BaseCurrency
        - QuoteCurrency
        - Buy
        - Sell
        - Mid 
        - Date -> (DateTime)
                

# 2020-10-06

Currencies and Indices

- Hvaðan kemur krafan um vísitölurnar?
- má dreifa vísitölum annarra?
- ef við viljum hafa þetta þá hvaða vísitölum? 
- Ekki er ljóst hvaða gengi aðilar vilja gefa upp og það þarf að ákveða til að geta unnið í málinu.
- Setja upp kröfur um hvernig þjónustan er uppbyggð og þeir ákveða sjálfir hvaða gengi þeir gefa upp.
- Rætt um að setja inn krossa. landsb og ísl banki eru með það í dag
- Hversu marga sourca vill banki bjóða upp á 
- Hversu langt vill bangi ganga í viðbótarupplýsingum fyrir hvern source
- Bankar skoði hvort vísitölur verði með, hversu margar og hvort það megi dreifa þeim
- Hversu marga sourca vill banki bjóða upp á fyrir gengisskráningu
- Hversu langt vill bangi ganga í viðbótarupplýsingum fyrir hvern source fyrir gengisskráningu

# 2020-09-29

- Allar breytingar eiga að fara í gegnum pool request.
- Nota issue í git fyrir vinnuliði.
- Commit ættu að eiga issue.

- Finna snið á gildistíma kreditkorta (expire Date) Ln. 5585.
- Viljum við hafa svæðið "Bank" í cardDetails?
- Viltu gera "panId" aðgengilegt í gegnum sér attribute?
- Viltu nota resourceId fyrir panId?
- Er hægt að upplýsingar frá Valitor eða Borgun um posEntryMode?

- Geta cardTransactions sér fyrir cards/ þjónustan. GJH


# 2020-09-22

GJH býr til cards/* hluta í yaml skjalið og sýnir á næsta fundi. Búum til sér schemas fyrir cards/
- cardDetails (nýtt)
  - expDate: Date
  - issueDate: Date
  - Cardholder Name
  - panId
  - Bankanúmer/Útibú (Optional)
- cardTransactions
  - posEntryMode (Optional)

Við gerum ráð fyrir að token upplýsingar komi fram í transactionDetails.

Skoðum að færa okkur í nýjustu útgáfuna af yaml frá Berlin Group, leggja fyrir næsta fund breytingar 
ásamt viðbótum vegna cards/*.

panId er skilað í svæðinu resourceId.

Heimild og aukaheimild er tekin sama undir balance.

í _links væri mögulegt að bæta við vísun í reikninginn t.d. skuldfærlsureikning.


# 2020-09-15

Hvað með samtölu vildarkerfis skv. eldri staðli,
hversu mikið af utanað komandi gögnum eiga að vera með í staðlinum.
- Vildarkerfi verður ekki partur af okkar vinnu (Landsbankinn, Arionbanki, Íslandsbanki).

Token upplýsingar á kortafærslu (Skráning tækis) er ígildi plasts. Sem dæmi þá væri Netflix með 
token upplýsingar eða áskriftir.

Koma fram á hreyfingunni hvaðan færslan kemur (Entity: posEntryMode -> Uppflettitafla). Möguleikar:
- Segulrandarlesin, 
- örgjörvi lesinn
- snertilaus færsla
- Recurring færsla
- handinnslegin
- MO/TO símgreiðsla

ProprietaryBankTransactionCode -> Kaup, Áskrift, etc. (GJH -> Bæta við gildum eða mappa núverandi gildi)

terminalId -> Göng koma frá færsluhirði, fyrir rekjanleika

cardAcceptorId -> Göng koma frá færsluhirði sennilega nafn|lýsing kaupmanns / verslun

--

Gera skarpari skil á milli korta og kortareikninga.

accounts/{id}/transactions          // skilar öllum færslum - hreyfingar + kort (á öllum debet kortum)
card-accounts/{id}/transactions     // skilar öllum færslum - hreyfingar + kort (á öllum kreditkortum)
cards/{id}/transactions             // skilar aðeins færslum á korti (bæði debet og credit)

Reikn: 0999-26-008956
Debit: 9934-****-****-1234
Debit: 9934-****-****-1234

---
kortareikningur: 1234-****-****-1234
Credit: 8834-****-****-1234 (Aðalkort)
        7734-****-****-1234 (Aukakort)
--

Plast endpoint:
- Aðgerðir á korti
    - Sækja
        - *Upplýsingar um kort (Gildistími)
        - *Hreyfingarlisti
        - *Heimildir kort (gætu verið aðrar en heimildir reikning á bakvið)
        - *Nafnið á kortinu
        - *Maskað kortanúmer
        - *Eigandi
        - *Kort Id
        - *Staða/Ástand t.d. Fryst, Lokað, Opið, Stolið, Glatað ... 
        - *Heimild
        - *Aukaheimild
        - *Bankanúmer/Útibú




# 2020-09-01

Athugasemdir frá Landsbankinn
Kort -> Skuldfærslureikningur (Optional) ?
  Fyrir kreditkort er accountreference.iban notað fyrir skuldfærslureikning.
Hreyfingar:
  - Gögn úr vildarkerfum ( Hvað hver línur hefur áhrif á vildarkerfi)
  - Upplýsingar um POS (Tækið [Sími, úr, pos, eða hvaða tæki var notað])

Kort->Sækja lista af kortum
  - Viljum við hafa möguleika að velja tegund korts þegar kallað er í 
    /v1/card-accounts ?
    - það væri hægt að sjá t.d. öll debit kort, eða credit kort, eða bæði.


Allir bankarnir ætla að senda á gudmundurjon@ctl.is sýnidæmi um kortayfirlit fyrir næsta fund með athugsemdum ef fleiri svæði vantar.

Verkröð.
1. Kort (Berlin group yaml skjal)
2. Vísitölur (Nýtt yaml)
3. Gjaldmiðlagengi (Nýtt yaml)
4. Erlendar greiðslur (Berlin group yaml skjal)
   - xml (SEPA)
     - pain.001
     - pain.002
   - txt (SWIFT)
   - json 
