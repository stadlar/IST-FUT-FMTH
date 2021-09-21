#2021-09-21
- Athugasemdir
  - Bæta við "IsCapitalIncomeTax" í ClaimTemplates, svæðið "IsCapitalIncomeTax" segir til um hvort fjármagstekjuskattur sé reiknaður. (Skilagrein er skila af banka)
    - [RB] ætlar að skoða fyrir næsta fund https://github.com/stadlar/IST-FUT-FMTH/issues/9
    Eftirtaldar breytingar þarf að rýna sérstaklega
    
    Bæta við "IsCapitalIncomeTax" í ClaimTemplates, svæðið "IsCapitalIncomeTax" segir til um hvort fjármagstekjuskattur sé reiknaður. (Skilagrein er skila af banka)
    RB skoðar hvor svæðið "IsCapitalIncomeTaxDeducted" sé mögulegt. "IsCapitalIncomeTaxDeducted"
    
    Get claims -> bæta við svæði "ClaimantExpenses"
    
    ClaimantExpenses (Optional type at:ClaimantExpenses)
    Sundurliðun á greiðslum sem kröfuhafi þarf að greiða vegna kröfunnar. Ekki skilað ef engar greiðslur hafa átt sér stað á kröfunni.
    
    CapitalGainTaxPaid (Required type ct:Amount [xs:decimal, fractionDigits: 3]) - Fjármagnstekjuskattur sem búið er að draga af greiðslum til kröfuhafa.
    CapitalGainTaxDue (Required type ct:Amount [xs:decimal, fractionDigits: 3]) - Fjármagnstekjuskattur sem kröfuhafi á eftir að greiða.
    Get claim payments -> bæta við svæðinu "CapitalGainTaxPaid" (sjá að ofan)
    
    RB ætlar að skoða fyrir næsta fund.
    
    Hafa til hliðsjónar https://www.skatturinn.is/fagadilar/hugbunadarhus/stadgreidsla-fjarmagnstekjuskatts/ 

  - Frá Íslandsbanka  
    - [RB] ætlar að skoða fyrir næsta fund https://github.com/stadlar/IST-FUT-FMTH/issues/88 
    - Ekki nota sama claim object fyrir create og alter, þar sem sum svæði eru aðeins tilgreind þegar krafa er stofnuð.
    - Yfirfara að array sé ekki skilað þegar unnið er með stak.
    - RB tala við bankanna að bæta við svæðinu isPaymentAllowed í GET, CREATE og ALTER claim
    - RB skoða að skila lastChangeDateTime fyrir kröfu í GET
    - Pass að nota templateCode í staðinn fyrir Identifier
    - Skoða tvítekningur claimantId í /payments
    - Ekki hægt að breyta PayorId
    - Þegar krafa er endurvakin þarf að nota sér object
    - Vantar betri lýsingu fyrir /v1/claims/{claimant-id}/{claim-no}/{due-date}/transfer
    - Hægt að leita að kröfum eftir batchId
    - Betri lýsing fyrir Id fyrir bunka aðgerðir
    - Allir skoði punkta frá 2021-09-14 og komi með athugasemdir ef einhverjar eru.
  - Frá Landsbanka
    - [Allir] skoða https://github.com/stadlar/IST-FUT-FMTH/issues/63 (Verður næsta atriði) 

#2021-09-14
- Athugasemdir
  - (*) Paging fyrir allar lista aðgerðir
  - (*) ClaimTemplate listi
  - (*) Aðeins hægt að fletta upp claimtemplate. Breytingar á claimtemplate verður settur í breytingarnefndina til umræðu
  - Færa kröfu í milliinnheimtu er gerð með /v1/claims/{claim-id}/transfer, bæta lýsingu
  - Laga skjölun almennt
  - Tví tekin object, laga
  - (*) Endurnefna /v1/claims/{id}/documents -> /v1/claims/{id}/documentReferences
  - (*) /v1/claims/{claim-id}/documents/{document-store-location}/{file-id} -> /v1/claims/{id}/documentReferences/{document-reference-id}
  - (*) Bæta við GET /v1/claims/{claim-id}/documentReferences
  - (*) Bæta við GET /v1/claims/{claim-id}/documentReferences/{document-reference-id}
  - Skilgreina claim object fyrir post patch og get
  - Breyta POST /v1/claims (batch) -> POST /v1/claimCreationBatches
  - Breyta POST /v1/claims/delete -> POST /v1/claimCancellationBatches
  - Breyta PUT /v1/claims -> POST /v1/claimAlterationBatches
  - Bæta við GET /v1/claimCreationBatches/{id}
  - Bæta við GET /v1/claimAlterationBatches/{id}
  - Bæta við GET /v1/claimCancellationBatches/{id}
  - Fella út GET /v1/claims/info/{status-id}
  - (*) "Payor kennitala" -> laga skjölun
  - kebab-case for consistency sem name fyrir /components/parameters/*
  - DateType should have some default value so dateTo and dateFrom work if dateType is omitted.
  - (*) claimant should be claimantId for consistency.
  - (*) payor should be payorId for consistency.
  - (*) state should be collectionState for a more descriptive name.
  - identifier does not work in this context, this needs to be templateId 
  - (similar key as we describe in issue #75) OR the identifier followed by the claimantId and branch id (the natural key for a template).

#2021-09-07
- Athugsemdir
  - Notum "TemplateCode" í staðinn fyrir "TemplateKey"
  - Henda "claimTemplateSimpleDetails" alltaf skila fullu objecti
  - Kröfulykill væri claimId samsettur úr
    claimant-id+claim-no+due-date
    Dæmi: 0208711239+000166000001+20210907 (Sama skilgreining og úr greiðslum)
    skjala vel í yaml
  - Rename "claimTemplate" -> "claimTemplateDetails"
  - Rename "claimTemplateSimpleDetails" -> "claimTemplate"
  - Hvaða svæðum má bæta við í "claimTemplateSimpleDetails" [Heimavinna]
  - Á að vera hægt að nota PATCH fyrir kröfur [Heimavinna]
  
#2021-08-24
- Kynna stöðuna
- Kynna staðalinn
- Athugasemdir/Verkefni:
  - Landsbankinn leggur til að kröfulykill í url-i verði í rauninni samsettur strengur úr kennital kröfuhafa
    kröfunúmeri og  gjalddaga  
  - [RB] yfirfer skjölun (summary og description) á aðgerðum

#2021-06-15
- Breytingar / athugasemdir við IOBWS-Claims3.0.yaml
  - Vísun í rafrænt skjal þýðir vísun í:
    - Skráð/Sótt:
      - Staðsetning skjals: document-store-location og 
      - einkvæmur lykill skjals: fileWithStatusDetails.id (uuid)
      - dæmi:
          {
            "documentStoreLocation": "greidsluveita", 
            "fileId": "0f85ac1a-8658-4a4f-afe2-56b748d7ee75",
            "typeCode": "GS"
          }
      [Þarf að taka sérstaklega fyrir næsta fund sem verður 24.08.2021 (GJH skrá issue) -begin]
      - tegund skjal [Bankar] [RB]
        - documentTypeDetails.code (Úr rafræn skjöl)
      [-end]
  - Kröfur eiga lista af vísunum í 0..n rafræn skjöl sem er hægt að breyta með 
    - (Bæta við vísun)
      /v1/claims/collection/{claimant-id}/{claim-no}/{due-date}/documents POST
      /v1/claims/{claimant-id}/{claim-no}/{due-date}/documents POST
    - (Eyða út vísun)    
      /v1/claims/collection/{claimant-id}/{claim-no}/{due-date}/documents/{document-store-location}/{file-id} DELETE
      /v1/claims/{claimant-id}/{claim-no}/{due-date}/documents/{document-store-location}/{file-id} DELETE
  - Þegar krafa er sótt er lista af vísunum skilað með
  - Þegar kröfur eru sóttar er boolean gildi skilað með sem segir til um hvort vísun á rafrænt
    skjal hafi verið skrá á kröfu eða ekki
  - Viðhald á vísunum í rafræn skjöl þurfa að vera í gegnum sér url til að hægt sé að uppfæra
    skjala vísanir kröfu án þess að fikta í kröfunni
  
  - Bæta við lýsingum fyrir alla endapunkta.  
  - Skoða mun á claims/../payments og claims/collection/../payments sb. 2013



- Dagskrá fundar 57
  - 09:00-9:30 Rafrænar kröfur yfirferð athugasemda við TS 314 - lokayfirferð
  - 09:30-11:00 Innheimtukröfur – Drög að yaml skjali


  Krafa stofnuð eða sótt:
    Krafa -> (0..n) -> rafrænt skjal

  


#2021-06-15
-  Dagskrá fundar 56
  - 9:00-9:30 Rafrænar skjöl yfirferð athugasemda við TS 314
  - 9:30-11:00 Innheimtukröfur – Drög að yaml skjali 

- Rafrænar skjöl
  - Bæta við svæðinu "processStatusMessage" í "fileWithStatusDetails"
- Innheimtukröfur
  - Bætum við "idempotency-key" fyrir allar PUT, POST, DELETE aðgerðir (sjá dæmi fyrir nema)  
    - Dæmi um idempotency 
      - CreateClaims (X: 12345) -> SvarX
        CreateClaims (X: 12345) -> SvarX
    - Dæmi um idempotency sér lykill
      - CreateClaims (idempotency-key: 12345) -> SvarX
        CreateClaims (idempotency-key: 12345) -> SvarX
    - Dæmi þegar við notum ekki idempotency      
      - CreateClaims (X: 12345) -> SvarX
        CreateClaims (X: 12345) -> Villa
  - Taka út "unpaidClaimCount"         
  - Setja inn möguleika að cancella fjöla krafna
  


# 2021-06-08
- ConncectDocument (POST v1/claims/{id}/documents/): Skráir tenginu milli kröfu of rafræns skjals.
  - POST v1/{topic}/{id}/{connectionType}/
- DisconnectDocument (DELETE v1/claims/{id}/documents/{sourceSystemId}/{documentId}/): Rýfur tenginu milli kröfu og rafræns skjals
  - DELETE v1/{topic}/{id}/{connectionType}/{sourceSystemId}/{genericId}/
- Kröfur -> Lista af tengingum -> (Lykill, Tegund, (Op) Description)

- [Athugasemdir frá Ásgeiri]
  - X-Request-ID -> Þarf ekki að specify ef þú sendir sama request id þá færðu sama value til baka í response í Create/Alter/Cancel
    - Fá sama batch number (Þótt að nýtt output hafi verið sent)
    [GJH.Svar]: Sett lýsing X-Request-ID í öll OK_200_*. Viljum við ekki nota X-Request-ID sem idempotency key.
  - claimOperation -> success er hægt að setja inn requirement að það þarf að vera listi af successes (Sumir bankar sleppa þessu í dag)
    [GJH.Svar]: Já claimOperation hefur lista af claimOperationSuccess og lista af claimOperationError
  - Í put og post á Claim þá er field sem heitir lastChangeDateTime (Ætti sennilega bara um query)
    [GJH.Svar]: Bætti við í leitina möguleika að leita eftir lastChangeDate per kröfu. Ekki tími.
  - Delete má ekki vera með Body (Svo það má ekki posta lista yfir kröfur sem á að fella niður)
    [GJH.Svar]: Já satt, for-each verður það að vera.
  - Ætti GET /v1/claims/templates ekki bara að returna { claimantId, bank, templateCode, active }
    [GJH.Svar]: Einfallt fyrir lista
  - GET /v1/claims/templates/{identifier} ætti þetta ekki að vera GET /v1/claims/templates/{claimantId}/{bank}/{templateCode}
    [GJH.Svar] Spurning, er að skila lykli á færsluna. Composite lyklar eru alltaf óþjálir.
  - Ætti ekki að nota Payor í stað payer,   Bara ég að vera Anal
    [GJH.Svar] Rétt leiðrétt
  - Í schema ætti kennitala ekki að max/min length = 10 í stað 3
    [GJH.Svar] Rétt leiðrétt
  - claimIdentifier ætti að vera claimTemplate og er með pattern [0-9A-Z]{3} en er í raun [0-9A-ZÞÆÐÖÁÉÝÚÍÓ]{3}
    [GJH.Svar] Íslenskir starfir eru ekki leyfðir
  - accountNo hefur alltaf verið í BBBBLLNNNNNN formatti aka [0-9]{12}
    [GJH.Svar] Rétt leiðrétt
  - claimantId getur þetta ekki verið claimantKennitala eða bara notað type kennitala
    [GJH.Svar] Tók id burt
  -	amountValue ætti það ekki að vera type number í stað string?  Og sleppa pattern (Væti hægt að nota max / min) min = 1 max = 99999999999999 Það er ekki hægt að nota < 1
    -	Á í raun um allar upphæðir í skjalinu (Nema sumar supporta 0) held samt að eingin upphæð má vera negative
    [GJH.Svar] Notum sömu skilgreiningu og í hinum stöðlunum sem eru byggðir á Berlin group     
  - depositingAccount ætti id ekki að vera ref á #/components/schemas/accountNo
    [GJH.Svar] Rétt, leiðrétt
  - claimTemplateKey -> bank example er 001 en ætti vera 0001
    [GJH.Svar] Rétt, leiðrétt
  - claimTemplateKey  ->templateCode ætti að vera ref á claimIdentifier
    [GJH.Svar] Rétt, leiðrétt
  - paymentFee -> directPaymentFee og directDebitFee ættu að vera type number og geta ekki verið mínus tölur
    [GJH.Svar] Rétt, leiðrétt
  - defaultInterest -> specialCode er enum þannig að breytingar í framtíðinni eru ekki möguleikar (Kannski spurning um að taka til þarna þar sem allt er ekki í boði)
    - Það vantar allavega A sem við notum stundum
    - Lét fylgja eldri útgáfu að kröfupotts upplýsingum
    - Sem er með t.d. upplýsingar um að „“ og „5“ er með 24:00->24:00 tímabil
    [GJH.Svar] ...
  - Identifier ætti það ekki alltaf að vera claimTemplate
    - T.d claimDetailInformation -> identifier
    [GJH.Svar] Rétt, leiðrétt
  - claimDetailStatus
    - totalAmountDue og allar hinar eru integer (Hvað ef þetta eru currency upphæðir)
      [GJH.Svar] Rétt, leiðrétt
    - secondaryCollectionIdentifier -> ætti að vera secondaryCollectionClaimTemplate og ætti að vera ref á claimIdentifier
      [GJH.Svar] Rétt, leiðrétt
    - legalCollectionIdentifier -> legalCollectionClaimTemplate
      [GJH.Svar] Rétt, leiðrétt
  - claimOperationSuccess -> print (Segir þetta ekki til um hvort krafan er í beingreiðslu eða ekki) ætti fieldið ekki að reflecta það
      [GJH.Svar] Kemur beint út TS 162:2013, síðan er spurning hvort það sé rétt
  - GET /v1/claims/collection/transactions
    [GJH.Svar] ***
  - claimPayment ->
    - amountDeposited og allar hinar eru integer (Hvað ef þetta eru currency upphæðir)
    [GJH.Svar] Rétt, leiðrétt
  - Hvað er PUT /v1/claims/collection/transfer og PUT /v1/claims/transfer?
    - Vantar description um að þetta er að transfer claim to collection og return claim from collection
      [GJH.Svar] Transfers list of claims to secondary collection
    - Og það er datefrom dateto og claimantId í parameters
      [GJH.Svar] Rétt, leiðrétt
  - Virðist vera auka GET /v1/claims/collection/transactions og GET /v1/claims/transactions
    [GJH.Svar] ***
  - GET /v1/claims/collection/info/{identifier} ætti sennilega að vera /v1/claims/collection/info/{status-id}
    [GJH.Svar] Rétt, leiðrétt
  - Það vantar recreate í secondary collection
    [GJH.Svar] Rétt, leiðrétt


[Allir]
- Kröfur
- Greiðslur

[Landsbankinn]
- Aukakrónur

[Íslandsbn]
- Eitthvað spec




# 2021-06-08
- Rafræn skjöl sem eru send inn, bæði sending og stakar skrár fá einkæmt númer frá bankanum.
- Þegar leitað er að skjali þá er notað senderKennitala+file.Id
- Laga "document-id" -> "documents-id"
- documents-id þarf að vera einkvæmt undir documentStoreLocation
- Uppfæra path GET /v1/documents/{documentStoreLocation}/{senderKennitala}/{documents-id}
  - bæta við senderKennitala

  
- Tenging rafrænsskjals við reference. S.b. tengja kröfunúmer við rafrænt skjal.
  - 

# 2021-06-01
- Rafræn skjöl
  - Þegar rafrænt skjal er sent inn væri geymslumiðil í slóðinni
    - Dæmi: /v1/documents/{documentStoreLocation}/{documents-id} ->
            /v1/documents/greidsluveitan/{documents-id}:
            /v1/documents/BankiX/{documents-id}:
- Kröfur
  - Tekið fyrir á næsta fundi [8.5.2021] þar sem sérstaklega verður tekið fyrir:
    - Beiðni frá RB um að ræða mun á að sækja lista af kröfur vs. sækja staka kröfu þar sem
      listi af kröfur væri með minni kröfuklasa
    - RB sendi inn upplýsingar um hugmynd af tengingu krafna við rafræn skjöl.
    - RB umræðan verður tekin á næsta fundi, óskað verður eftir að fá Ólaf frá Greiðsluveitunni
      með á fundinn.
  - Bæta við svæðinu "IsPaymentAllowed" á kröfu. Það má setja IsPaymentAllowed = false á 
    hvaða kröfu sem er.





# 2021-05-25
- Það kom fyrirspurn varðandi geymslu á skjölum að mögulegt væri vista í aðrar geymslur. Upphafsaðili sendir issue á 
  github svæði verkefnisins þar sem viðhaldshópurinn tekur málið fyrir.
- [Bankar] yfirlestur
    claimTemplateDetails:
      description: |
        Card template details.
      type: object
      required:
        - identifier
        - disposableAccountNo
        - lastChangeDateTime
      properties:
        key:
          $ref: "#/components/schemas/claimTemplateKey"
        collectionType:
          type: string
          enum:
            - "PrimaryCollection"
            - "SecondaryCollection"
            - "LegalCollection"
        category:
          $ref: "#/components/schemas/claimTemplateCategory"
        ClaimantStatementExtendedReferenceType
          -- Segir til um hvaða gildi birtist í skýringarsvæði tilvísunar á reikningsyfirliti kröfuhafa. --
          [ReferenceNumber] - 12 fyrstu stafir tilvísunarnúmers.
          [CustomerNumber] - 12 fyrstu stafir viðskiptanúmers.
          [ClaimId] - Banki, höfuðbók og númer kröfunnar.
          [PayorId] - Kennitala greiðanda á kröfunni.
          [DueDate] - Gjalddagi kröfunnar.
        ClaimantStatementReferenceType
          -- Segir til um hvaða gildi birtist í tilvísunarsvæði á reikningsyfirliti kröfuhafa. --
          [DueDate] - Gjalddagi kröfunnar.
          [BillNumber] - Seðilnúmer kröfunnar.
          [ClaimNumber] - Númer kröfunnar.
        PayorStatementExtendedReferenceType
          -- Segir til um hvaða gildi birtist í skýringarsvæði tilvísunar á reikningsyfirliti greiðanda. --
          [ClaimantId] - Kennitala kröfuhafa.
          [ReferenceNumber] - 12 fyrstu stafir tilvísunarnúmers.
          [CustomerNumber] - 12 fyrstu stafir viðskiptanúmers.
          [ClaimId] - Banki, höfuðbók og númer kröfunnar.
          [PayorId] - Kennitala greiðanda á kröfunni.
          [DueDate] - Gjalddagi kröfunnar.
        CustomerNumberTemplate (Optional type at:CustomerNumber [xs:string, maxLength: 16, pattern: .{0,16}])
          -- Segir til um það hvernig sniðmát viðskiptanúmers er uppbyggt fyrir kröfusniðmátið. --
        #FreeText (Optional type at:FreeText60 [xs:string, maxLength: 60, pattern: .{0,60}])
        #  -- Frjálst textasvæði fyrir kröfuhafa. --
        NumberOfDepositingAccounts (Required type xs:int)
          -- Segir til um fjölda aukaráðstöfunarreikninga sniðmáts. --
        #IsCapitalIncomeTax (Required type xs:boolean)
        #  -- Segir til um hvort reikna skuli fjármagnstekjuskatt af kröfuhafa. --
        DepositingAccount (Required type at:DepositingAccountInfo)
          -- Upplýsingar um aðalráðstöfunarreikning. --
          Id (Required type ct:AccountID [xs:string, pattern: [0-9]{12}]) - Auðkenni reiknings samanstendur af útibúsnúmeri, höfuðbókarnúmeri og reikningsnúmeri.
          OwnerId (Required type ct:PersonID [xs:string, pattern: [0-9]{10}]) - Kennitala eiganda reiknings.
        #  OwnerName (Optional type xs:string) - Nafn eiganda reiknings.
          ErrorText (Optional type [xs:string, maxLength: 100, pattern: .{0,100}]) - Villuskilaboð fyrir ráðstöfunarreikning sem kom fram við seinustu vikulegu villuleit kröfusniða.
        #  LatestClaimDate (Optional type xs:dateTime) - Tímastimpill nýjustu kröfu viðkomandi kröfusniðmáts.
          SecondaryCollectorName (Optional type xs:string) - Nafn milliinnheimtuaðila.
        secondaryCollectionClaimTemplateCode:
          description: |
            Auðkenni milliinnheimtukröfusniðmáts sem kröfur í vanskilum færast yfir á.
          type: string
          pattern: "[0-9A-Za-z]{3}"
          example: "MI1"
        minimumCollectionAmount:
          description: |
            Segir til hver lágmarksupphæð á kröfu þarf að vera til að sent verði innheimtubréf og krafa send í milliinheimtu.
          $ref: "#/components/schemas/amountValue"
        WithdrawalAccountId (Optional type ct:AccountID [xs:string, pattern: [0-9]{12}])
          --  Skuldfærslureikningur sem notaður er til að greiða kostnað kröfuhafa til bankans fyrir þetta sniðmát. --
        #ExternalDataStorage (Optional type at:ExternalDataStorage)
        # --Segir til um hvort skjöl séu vistuð í rafrænu kerfi hjá ytri aðila. --
        IsBill (Required type xs:boolean)
          --Segir til um hvort greiðsluseðill sé vistaður í rafrænu kerfi hjá ytri aðila. --
        IsLetter (Required type xs:boolean)
          -- Segir til um hvort innheimtubréf er vistað í rafrænu kerfi hjá ytri aðila. --
        PrintingLocation (Optional type at:PrintingLocation)
          -- Einkvæmt númer prentstaðar fyrir greiðsluseðla. Ekki skilað ef RB útbýr ekki greiðsluseðla. --
          Id (Required type xs:int) - Einkvæmt númer prentstaðar.
          Name (Required type xs:string) - Nafn prentstaðar.
        #  Description (Optional type xs:string) - Lýsing prentstaðar.
        #UnpaidClaimCount (Required type xs:int)
        #  -- Fjöldi ógreiddra krafna sem kröfusniðmát á. --
        AdditionalDepositingAccounts (Optional type at:AdditionalDepositCollection)
          -- Aukaráðstöfunarreikningar. Notaðir til að ráðstafa gjöldum, kostnaði eða hluta af greiðslu kröfunnar. Geta mest verið 98 reikningar fyrir hvert auðkenni. --
          AdditionalDepositingAccount (Required Max: 98 type at:AdditionalDepositInfo)
            -- Upplýsingar um tiltekinn aukaráðstöfunarreikning. --
            Id (Required type ct:AccountID [xs:string, pattern: [0-9]{12}])
              -- Auðkenni reiknings samanstendur af útibúsnúmeri, höfuðbókarnúmeri og reikningsnúmeri.
            OwnerId (Required type ct:PersonID [xs:string, pattern: [0-9]{10}])
              -- Kennitala eiganda reiknings. --
        #    OwnerName (Optional type xs:string)
        #      -- Nafn eiganda reiknings. --
            ErrorText (Optional type [xs:string, maxLength: 100, pattern: .{0,100}])
              -- Villuskilaboð frá runuvinnslu um reikning kröfuhafa. --
            Type (Required type at:AdditionalDepositingAccountType [xs:string])
              -- Heiti á tegund ráðstöfunar. --
              [DefaultInterest] - Dráttarvextir.
              [DefaultCharge] - Vanskilagjald.
              [OtherDefaultCost] - Annar vanskilakostnaður.
              [AllDefaultCharge] - Vanskilagjald og annar vanskilakostnaður.
              [OtherCost] - Annar kostnaður.
              [NoticeAndPaymentFee] - Tilkynningargjald.
              [AllCost] - Allur kostnaður og gjöld sem leggjast á kröfuna.
              [FixedAmount] - Föst upphæð er tekin af upphæð greiðslunnar og lögð inn á ráðstöfunarreikning.
              [Percentage] - Prósenta af upphæð greiðslunnar lögð inn á ráðstöfunarreikning.
              [PrincipalDetail] - Upphæðarliður af höfuðstól greiðslunnar lagður inn á ráðstöfunarreikning.
            Code (Required type at:DepositingAccountCode [xs:string, minLength: 4, maxLength: 4])
              -- Auðkenni ráðstöfunar. --
            Priority (Required type xs:int)
              -- Forgangur segir til um hvaða hlutar af greiðslu til kröfuhafa eiga að ráðstafast fyrst. --
        #    Description (Optional type at:Text100 [xs:string, maxLength: 100, pattern: .{0,100}])
        #      -- Frjálst textasvæði, hámark 100 stafir. --
            Choice Velja þarf milli eftirfarandi 2 eininga:
              Amount
              Percentage
        IsActive: boolean?

- QuerySecondaryCollectionClaims
  - Er hægt að fá fyrri identifier (t.d Krafa frum "037" -> Krafa milli "MI1") - Já

- Hversu mikið er "BillPresentmentSystem" viljum nota. Þarf að skjala vel.
  <BillPresentmentSystem>                   0..1
    <Type>A</Type> þar sem A er Document og T er Texti 
    <Parameters>Kennitala=0909793029</Parameters> (200 stafir)
  </BillPresentmentSystem>
  Type = T/Text, Parameters = Textalína sem verður sýnilegt í ógreiddir reikningar 
  
- Hversu mikið er "Printing" notað: Mikið notað. Þarf að skjala vel.
  <Printing>                                0..1 
    <ClaimantAddress>...</ClaimantAddress>  0..1
    <PayorAddress>...</PayorAddress>        0..1
    <ItemRows>...</ItemRows>                0..20
    <Comments>...</Comments>                0..5
  </Printing>
  
- Ef í innsenda skeytinu er sett cancellation date=18.5.2021 og status=unpaid; 
  þá birtist listi sem sýnir kröfur með forskilgreindan niðurfellingardag þann 18.05.2021
- Ef í innsenda skeytinu er sett cancellation date=18.5.2021 og status=cancelled; 
  þá birtist listi sem sýnir sem voru handvirkt niðurfelldar þann 18.05.2021

  (Óskastaðan væri samt sú, að við hefðum annars vegar cancellation date og 
  hins vegar expiry date. Það er verkefni sem RB fær til sín.)

- Notum "ClosingDate" sem segir hvenær krafa er ekki lengur virk, á kröfur (GET)
  
- Ekki má stofna kröfur sem er ósýnileg greiðanda

- Bæta við svæðinu "IsPaymentAllowed" á kröfu


# 2021-05-18
- Hvað þýðir cancellation date?
  - Er dagurinn sem krafan á að falla niður ef ekki er greitt, venjulega 4 ár.
  - Ef krafa er niðurfelld munu bankarnir uppfæra CancellationDate til samræmis.
    [GJH] Setja þessa Lýsingu í yaml skjalið fyrir svæðið.
- Claim history
  - 1. Krafa er búin til, auðkenni = 001
  - 2. Krafa er færð á milli fruminnheimtu auðkenni, Identifier = 002
  - 3. Krafa fer í milliinnheimtu, Identifier = 002, SecondaryCollectionIdentifier = MI1
  - 4. Krafa er færð á milli í milliinnheimtu, Identifier = 002, SecondaryCollectionIdentifier = MI2
- [Allir] Hægt að læsa kröfur, vegna greiðslusamkomulags (hugsanlega vegna greiðslustöðvun)
  - Krafan er sýnileg, en ekki hægt að greiðsla að fullu eða að hluta.
  - Væri mögulegt að setja inn texta til að útskýra þegar krafa er læst fyrir greiðslu?  
  - Krafa er með svæðið "ClaimStatus", væri mögulegt að bæta við stöðunni "UnpaidLocked",
    claim:
      IsPaymentAllowed: Boolean
    
- [Bankar] Hversu mikið er "Printing" notað?    
  <Printing>                                0..1 
    <ClaimantAddress>...</ClaimantAddress>  0..1
    <PayorAddress>...</PayorAddress>        0..1
    <ItemRows>...</ItemRows>                0..20
    <Comments>...</Comments>                0..5
  </Printing>
  
- [Bankar] Hversu mikið er "BillPresentmentSystem" notað?
  <BillPresentmentSystem>                   0..1
    <Type>A</Type> þar sem A er Document og T er Texti 
    <Parameters>Kennitala=0909793029</Parameters> (200 stafir)
  </BillPresentmentSystem>

LegalCollectionIdentifier = LH[0-9A-Z]{1} -> Kröfu er læst?
- Arion notar ekki "LegalCollectionIdentifier" 

- [Allir] Hvað á að byrta mikið af gögnum/svæðum fyrir ClaimTemplate bæði listi og stök?
  - Listi: Claimant, Útibú, ...
  - Stak: 

- QuerySecondaryCollectionClaims
  - Er hægt að fá fyrri identifier (t.d Krafa frum "037" -> Krafa milli "MI1") [Bankar-2]    

- Nafnareglur
  - IOBWS-Claims3.0.yaml
  - IOBWS-Claims3.1.yaml
  - IOBWS-Claims3.2.yaml
  - IOBWS-Documents3.0.yaml
  - IOBWS-Documents3.1.yaml


# 2021-05-11
- Athugasemdir í rafrænunskjölum
  - idNumber -> Kennitala
  - GET /v1/documents/{document-id} -> GET /v1/documents/{documents-id}
  - OK lýsing er ekki nægjanleg
  - Taka út PSD2 vísanir, TPP
- Almenn athugasemd  
  - Búa til dæmasvæði (Examples) á GITHUB fyrir hverja tækniforskrift
  - Notum "receiver" í staðinn fyrir "owner". Hver á að taka á móti skjali.
  
- Nafnareglur
  - IOBWS3.0-Claims.yaml
  - IOBWS3.1-Claims.yaml
  - IOBWS3.2-Claims.yaml
  - IOBWS3.0-Documents.yaml
  - IOBWS3.1-Documents.yaml
  
- hvað þýðir cancellation date?
  - Hvenær krafan var felld niður.
  
- ExpireDate væri þæginlegt að hafa inni
- Kröfur; Listar og/eða stök: Stuðningur verður við bæði.


# 2021-05-04

- QuerySecondaryCollectionClaims
  - Er hægt að fá fyrri identifier (t.d Krafa frum "037" -> Krafa milli "MI1") [Bankar-2]

- Dráttarvaxtareglur -> Mætti skoða hvort dráttarvaxtarreglur væru framsettar með öðrum hætti en í dag. [Bankar-2]

- GET: [Bankar-1]
  - 500.000 kröfur hafa verið stofnaðar:
    - a) Foreach
    - b) Where X ...
    - Hugsanlega bara stofnbreytingar og niðurfellingar.
    
  - Krafa væri með "LastModified" og hægt væri að kalla eftir kröfum eftir "LastModified".
    - Væri hægt að að fá allar breytingar og niðurfellingar sem hafa átt sér stað á mínum kröfum. 

- Listar og/eða stök: [Bankar-1]
  - Stak -> Aðgerð framkvæmd
  - Listi -> Afgreiðslunúmer -> Sækja stöðu (GetClaimOperationResult)
    - Afgr.númer (X-Request-ID)
      - Afgreiðslur
  - Listar:  
    - Method::Create/Alter/Cancel/ReturnClaim -> Afgreiðslunúmer (Og eða villum) -> Method::Confirm -> Method::GetStatus
      - Method::Confirm: Villa ef bunki er ekki til
  - Stakar:  
    - Method::Create/Alter/Cancel/ReturnClaim -> Status

- Fyrir mánudaginn 10. maí klukkan 16:00
  - [Bankar-0] Allir bankar tilnefna einn eða fleiri aðila til að lesa yfir word skjal
    - Landsbankinn : Halldór
    - Arion banki: Atli
    - Íslandsbanki: Snorri
    - Greiðsluveitan: Ólafur
  - [Bankar-0] Allir bankar tilnefna einn eða fleiri aðila til að lesa yfir yaml skjal
    - Landsbankinn : Halldór
    - Arion banki: Atli
    - Íslandsbanki: Snorri
    - Greiðsluveitan: Ólafur
  - Hvað á document service yaml skjalið að heita? [Allir]
  - Við yfirferð skjala má senda spurningar við
  
Dagskrá
  1.  9:00-10:00 Rafræn skjöl - TS 314 og yamls  (á GitHub<Vinnusvæði/Verkþáttur%204/IOBWSDocuments3-0.yaml>)
  2.  10:00-11:00 Innheimtukröfur - TS 315
  3.  Önnur mál
  4.  Næstu skref


# 2021-04-27
- "Á krafa að eiga umráðenda? Má kröfueigandi breyta kröfu þrátt fyrir að krafa sé komin í milliinnheimtu." ->
  - Umráðandi kröfu er færður frá kröfuhafa yfir á milliinnheimtuaðila þegar milliinnheima er í gangi.
- Þegar krafa hefur verið tekin af milliinnheimtuaðila, og milliinnheimtuaðili spyr um kröfuna þá væri svarið ->
  "Krafa er ekki í þinni umsjá"
- Krafa væri með "LastModified" og hægt væri að kalla eftir kröfum eftir "LastModified".
  - Væri hægt að að fá allar breytingar og niðurfellingar sem hafa átt sér stað á mínum kröfum.
- Hægt að fá lista af Kröfuauðkenni, ráðstöfunarreikningar, uppbygging tilvísunar (Uppbygging seðilnúmers)
- [Bankar] Create (Listar, Stök) -> afgreiðslunúmer 
- Þegar CreateClaims (Margar kröfur) eru stofnaðar væri hægt að senda inn external reference id
- Þegar bunkaaðgerðir eru framkvædar þá væri tekið inn með "id" sem væri notað í samþykktarskrefi. Til að stofna kröfu(r)
- Halldór (Landsbankanum) ætlar að teikna upp ferla við innsendingu á kröfu bunka
- Business reglur fyrir fyrra, seinna vanskilagjald og afsláttur. Það þarf að skjala vel. 
- Alter aðgerðinni væri kaflaskipt til að auðvelda að uppfæra hluta af kröfunni.

- Frá Landsbankanum:
  - Á krafa að eiga umráðanda?
    - það er þegar þannig hjá Landsbankanum og hefur alltaf verið; þ.e. að umráðin færast frá kröfuhafa til MI, 
      þannig afsalar kröfuhafi umráðum tímabundið til MI á meðan krafan er þar. Rökin byggja á trausti milli 
      kröfuhafans og MI fyrirtækisins; að hafa skýrar leikreglur, og að minnka líkur á mistökum og misskilningi 
      í daglegum rekstri.
  - Á kröfuhafi að geta skilað kröfu til baka úr milliinnheimtu yfir í fruminnheimtu? Sumir bankar leyfa þetta í netbankanum.
    - nei, með sömu rökum og að ofan
  - Viljum við skila breytingasögu innheimtuþjónusta?
    - nei, annars vegar eru stillingar á sniðmátum sem Lb hagnýtir ekki, og öfugt; sérhæfðar stillingar hjá 
      Lb -> þess vegna er talið fýsilegra að bjóða þetta í native þjónustuöðru máli gegnir kannski um 
      breytingasögu ráðstöfunarreikning oþh
  - Viljum við að hægt sé að sækja lista af innheimtuþjónustum, þmt ráðstöfunarreikning, textalykil, skuldfærslureikning, 
    uppbyggingu viðskiptanúmers (fá öll detail)
    - nei, með sömu rökum og að ofan
  - Sá sem hefur umráðaréttinn hverju sinni, á að geta séð stöðu kröfunnar hverju sinni.
    - skiljanlegri fullyrðing: kröfuhafi getur fylgst nákvæmlega með kröfunni á meðan hún er hjá MI ... en 
      MI fyrirtækið getur ekki fylgst með kröfunni án umráðaréttar þá stundina


# 2021-04-13
- Sundurliðun á kröfugreiðslum sem svar í kröfuþjónustu
  - Verkefnið verður sent á viðhaldshópinn eftir að 1st útgáfa af kröfuþjónustunni verður gefinn út.
- Hægt að fá lista af kröfu auðkennum og ráðstöfunarreikninga + textalykill + skuldfærslureikningsnúmer + uppbygging viðskiptanúmers (Fá öll detail)
  (skoða skema validation https://rb.rb.is/display/B2BD/ClaimManagement.AlterClaim)
  - [Bankar] viljum við líka skila sögu?
- [Bankar] Þegar krafa er tekin af milliinnheimtuaðila hefur milliinnheimtuaðill enþá möguleika á að lesa stöðu kröfunnar. 
  - Vandamálið er að krafa týnist
- [Bankar] Þegar krafa er felld niður hefur milliinnheimtuaðill enþá möguleika á að lesa stöðu kröfunnar.
  - Vandamálið er að krafa týnist
- [Bankar] Á krafa að eiga umráðenda? Má kröfueigandi breyta kröfu þrátt fyrir að krafa sé komin í milliinnheimtu.
- Skjala breytulýsingar
  - Limit
  - Mandatory, optional, conditional
- Dráttarvaxtareglur ->
- Aðgerðir
  - Create (1..n) (Ekki fyrir milliinnheimtu)
    - Engin fjölda takmörk 
  - ReCreate (Endurvekja) 
    - Það er hægt að endurvekja allar niðurfelldar kröfur. Í rauninni ný krafa í upphaflegri mynd
      þ.e.a.s. allar upplýsingar.
    - Við viljum hafa skýr skil með því að hafa ReCreate í staðinn fyrir að sameina í Alter.
    - Cancellation date er max 4 ár frá gjalddaga. (Fyrningafrestur í kröfulögum er 4 ár?)
    - Ef krafa er ekki til áður á að koma villa
  - Alter
    - Það er hægt að breyta öllum kröfum sem ekki hefur verið greitt inn á.
  - Cancel
    - Það er hægt að fella niður allar kröfur
  - Query [Bankar]
    - (Milliinnheimta)
      - QuerySecondaryCollectionClaims
      - QuerySecondaryCollectionPayments
    - Þegar krafa sem er komin til milliinnheimtuaðila og er greidd/felld niður hverfur hún og er ekki aðgengileg lengri,
      krafan þarf að vera sýnileg með einhverjum hætti.
    - Hægt að frá kröfustöðu (t.d. er krafan greidd / ekki greidd) 
    - Greiðslur
      - Greiðsla/greiðslur       
      (method: QueryClaimPayments)
      - Ráðstöfun per kröfu (Kröfuauðkenni, ráðstöfunarreikningar, reikningseigendur, tegund hlutar, kostnaðarliðir, upphæð),
        mögulega -> Ný aðgerð. - Bankarnir skoða.
    - Claim transactions
    - Allar breytingar á einhverju tímabili fyrir kröfueiganda sem skilar -> Claim transactions
      fyrir kröfueiganda 0208714669 2021-01-01 - 2021-01-02  (jafnvel kröfu auðkenni) -> Claim history 
      - Hægt að sækja x daga, mögulega ekki skilgreint í þessum staðli
      - Ónáttúrulegar breytingar (Handvirkar breytingar)
  - MarkClaimForSecondaryCollection (Ekki fyrir milliinnheimtu)
  - SecondaryCollectionReturnClaim ([Banki] má þessi aðgerð vera fyrir alla?)  

Kröfulykill
  Eigandi   : 5205161230
  Númer     : 0001-66-123456
  Gjalddagi : 2021-04-15

- Kröfur
  - Grunnupplýsingar (ekki hægt að breyta)
    - Kt kröfuhafa
    - Kt greiðanda
    - Útibú - Hb - Kröfunúmer
    - Gjalddagi
  - Ítarupplýsingar (claimDetailInformation)
    - niðurfellingardagur *
    - auðkenni *
    - uppphæð *
    - tilvísunarnúmer *
    - eindagi *
    - Seðilnúmer *
    - Viðskiptanúmer *
    - Greiðslugjald * 
    - Beingreiðslugjald *
    - Annar kostnaður *
    - Annar vanskilakostnaður *
  - Reglur (claimDetailRule)
    - Greiðsluregla 
    - Innborgunarregla 
    - Vanskilaregla
      - Tegund vanskilagjalds
      - Vanskilagjald 1
    - DagafjöldiVanskilagjald 2
    - DagafjöldiDráttarvextaregla
    - prósentavaxtastofnregla
    - Afsláttarregla
      - afsláttartegund
      - afsláttur 1
      - dagafjöldiafsláttur 2
      - dagafjöldi 
  - Minna notað (claimDetailOther)
    - tegund
    - slóð
    - detail hluti
    - Gengistegund
    - Mynt
    - Gengisbanki
    - Gengisregla  



- Rafræn skjöl
  - Guðmundur ætlar að laga
    - "durableMedia" -> "durableMedium"
    - Laga * merkingar
    - Vantar filter fyrir skjalaleit
  - [Bankar] taki afstöðu til viðhalds á xslt í gegnum document þjónustuna  


# 2021-03-30
- Næsti fundur verður haldinn 13. Apríl. Ekki er talin ástæða til að halda fund 6. Apríl.
- Rýna Rafræn skjöl 13. Apríl.
- Allir koma með tillögu að flokkum á "Claim" hvaða eigindi eiga 
  saman. Koma með tillögu að hvernig krafa er uppfærð. Eigum við að setja lýsingar á reglum í staðalinn?
- Má henda út "BillPresentmentSystem"?
- Svæðið "Printing" ætti að heita jafnvel "*Details"?

- Búa til röð til að "PermitOutOfSequencePayment" virki.
  - Kröfurhafi,  Kröfunr.      Gjalddagi   Auðk.  Greiðandi
  - 02081714669, xxxx66000009, 2021-01-01, 001 -> 5205161230
  - 02081714669, xxxx66000009, 2021-02-01, 001 -> 5205161230


- Class Claim 
  + ClaimKey Key                                  óbreytanlegt
  + string PayorID                                Óbreytanlegt?
  + string Identifier                             Óbreytanlegt?
  - Base:
    + string Reference                            Óbreytanlegt?
    + string CustomerNumber                       Óbreytanlegt?
    + string BillNumber                           Óbreytanlegt? 
    - CurrencyInformation CurrencyInformation     Óbreytanlegt?
  - Presentment:
    - BillPresentmentSystem BillPresentmentSystem Óbreytanlegt?
    - Printing Printing                           Óbreytanlegt?
  - DefaultRules:
    - DefaultInterest DefaultInterest             Algengt
    - DateRestrictedCharge DefaultCharge          Sjaldan
  - PaymentRules:
    - bool PermitOutOfSequencePayment             Sjaldan
    - bool IsPartialPaymentAllowed                Algengt
    - DiscountCharge Discount                     Sjaldan 
  - Dates:
    + System.DateTime FinalDueDate                Algengt 
    + System.DateTime CancellationDate            Sjaldan
  - Amounts:
    - NoticeAndPaymentFee NoticeAndPaymentFee     Sjaldan
    - decimal Amount                              Algengt
    - decimal OtherCosts                          Algengt
    - decimal OtherDefaultCosts                   Algengt


  - 1.  9:00-9:30 Rafræn skjöl - TS 314 
  - 2.  9:30-11:00 Innheimtukröfur - TS 315
  - 3.  Önnur mál
  - 4.  Næstu skref




# 2021-03-23

- Kröfur
  - Atriði
    - Ráðstöfun per kröfu verður tekið fyrir 6 eða 13 Apríl.
  - Ný krafa (1..n) (Frum)
    -  Claim
      - Key (Claimant, Account, DueDate) -> GET: query /Claimant/Account/DueDate
      - PayorID -> IDNumber
      - CancellationDate -> MIN >= FinalDuedate; MAX DueDate + 4year
      - Identifier -> 
      - Amount -> DECIMAL(17, 2) => Min: 0,01; Max: MAX(DECIMAL(17, 2)) 
      - Reference -> 16 stafir  
      - BillNumber -> 7 stafir
      - CustomerNumber -> IDNumber
      - NoticeAndPaymentFee -> RENAME -> PaymentFee  
        - Printing (Payment Fee) -> Greiðslugjald
        - Paperless (Direct Debit Fee) -> Beingreiðslugjald
      - CurrencyInformation {Currency, DateRate, ReferenceRate}
      - DefaultCharge -> Engin breyting
      - DefaultInterest:
        - SpecialCode -> Dráttarvaxtaregla
      - Discount -> Vantar betri lýsingu 
      - OtherCosts 
      - OtherDefaultCosts
      - PermitOutOfSequencePayment
      - IsPartialPaymentAllowed
      - BillPresentmentSystem
      - Printing
    
  - Þegar krafa er greidd:
    - Claimkey -> Tilvísun á greiðslunni og hægt að sjá með því að fletta upp færslum reikningsins (RB skoðar)
    - Claimkey getur verið túlkað sem BBAN þar sem str(Claimant) + str(Account) + '+' + DueDate.(YYYYMMDD)
  - Ráðstöfun per kröfu (Kröfuauðkenni, ráðstöfunarreikningar, reikningseigendur, tegund hlutar, kostnaðarliðir, upphæð),
    mögulega -> Ný aðgerð. - Bankarnir og RB skoða. 
  
- Rafræn skjöl
  - Skjalategundir í ARK í dag
    - Launaseðlar
    - Launamiðar
    - Reikningar
    - Greiðsluseðlar
    - Reikningsyfirlit
    - Viðskiptayfirlit
    - Kreditkort
    - Greiðslutilkynning
    - Greiðslukvittun
    - Tilkynningar
    - Lykilorð
    - Vinnu- eða tímaskýrslur
    - Vaxtanótur
    - Skilagreinar
    - IK-kröfur
    - <jafnvel lengjast>
  - Einkvæmt númer skjala er sent inn frá sendanda. ARK skilar svari fyrir þeim skjölum sem tókst ef ekkert svar kemur
    fyrir skjal mun banki reikna með að skjalið hafi mistekist og svara þannig til innsendanda.
  - Hægt er að senda inn Reference fyrir skjal
  - Skjalategundir koma frá aðgerð, listinnn getur lengst
    [{
      "code": "<Stytting á liðnum>",
      "name": "<Nafn á liðnum>", 
      "changeable": "True | False"
    }]
  - Varanlegur miðill þýðir að ekki má vera hægt að breyta skjali. Það þýðir að skjöl sem eru tengd við  skjalategund 
    sem er merkt sem "changeable": False eru geymd skv. skilgreiningu á varanlegum miðli.
  - Það verður hægt að breyta ákveðnum skjali innan ákveðins tíma frá innsendingu ef skjalategund er merkt
    sérstaklega sem "changeable": True.


# 2021-03-16
- Rafræn skjöl verða tekin fyrir á næsta fundi
- Aðgerðir
  - Create (1..n) (Ekki fyrir milliinnheimtu)
    - Engin fjölda takmörk 
  - ReCreate (Endurvekja) (Ekki fyrir milliinnheimtu)
    - Það er hægt að endurvekja allar niðurfelldar kröfur. Í rauninni ný krafa í upphaflegri mynd
      þ.e.a.s. allar upplýsingar.
    - Við viljum hafa skýr skil með því að hafa ReCreate í staðinn fyrir að sameina í Alter.
    - Cancellation date er max 4 ár frá gjalddaga. (Fyrningafrestur í kröfulögum er 4 ár?)
    - Ef krafa er ekki til áður á að koma villa
  - Alter
    - Það er hægt að breyta öllum kröfum sem ekki hefur verið greitt inn á.
  - Cancel
    - Það er hægt að fella niður allar kröfur
  - Query
    - (Milliinnheimta)
      - QuerySecondaryCollectionClaims
      - QuerySecondaryCollectionPayments
    - Þegar krafa sem er komin til milliinnheimtuaðila og er greidd/felld niður hverfur hún og er ekki aðgengileg lengri,
      krafan þarf að vera sýnileg með einhverjum hætti.
    - Hægt að frá kröfustöðu (t.d. er krafan greidd / ekki greidd) 
    - Greiðslur
      - Greiðsla/greiðslur       
      (method: QueryClaimPayments)
      - Ráðstöfun per kröfu (Kröfuauðkenni, ráðstöfunarreikningar, reikningseigendur, tegund hlutar, kostnaðarliðir, upphæð),
        mögulega -> Ný aðgerð. - Bankarnir skoða.
    - Claim transactions
    - Allar breytingar á einhverju tímabili fyrir kröfueiganda sem skilar -> Claim transactions
      fyrir kröfueiganda 0208714669 2021-01-01 - 2021-01-02  (jafnvel kröfu auðkenni) -> Claim history 
      - Hægt að sækja x daga, mögulega ekki skilgreint í þessum staðli
      - Ónáttúrulegar breytingar (Handvirkar breytingar)
  - MarkClaimForSecondaryCollection (Ekki fyrir milliinnheimtu)
  - SecondaryCollectionReturnClaim (Bara fyrir milliinnheimtu)  
  - Kröfuauðkenni -> vantar fá mögulegt til að fá lista af kröfuauðkennum ásamt ráðstöfureikning. 
    (Method: QueryClaimTemplates -> List, QueryClaimTemplate -> Detail)
  - Ógreiddir reikningar/kröfur - Unpaid bills (Ekki fyrir milliinnheimtu)
    - Listi af kröfum sem hafa verið skráðar á þig frá öðrum
    - Hægt að sækja fyrir hönd annars aðila (greiðanda)
    - Hægt að sjá hvort þetta sér skráð í sjálfvirka skuldfærslu  
  - Out of scope (Mögulega)  
    - Endurgreiða kröfu +/- með kostnaði. (Method: ClaimRepayment??)
      - Er mögulegt að endurgreiða?
      - Ef hægt er að endurgreiða (hvaða skilyrði þarf að uppfylla)
      - Væri kannski hægt að nota reikningsupplýsingar hjá RSK til að nota sem default reikning
      - Bankinn þarf að vita hvert greiðslan á að fara
      - Hafa reference á upphaflega færslu
      - Hægt að endurgreiða inn á kennitölu ef mögulegt er
    


# 2021-03-09 (Kröfur)
- Ógreiddir reikningar - Unpaid bills
- Óþæginlegt að kröfur hverfa um leið og kröfur hafa verið greiddar.
- Define Claim Scope - Skilgreina
- Kröfuauðkenni -> vantar fá mögulegt til að fá lista af kröfuauðkennum ásamt ráðstöfureikning
- "Innheimtuþjónustur" -> "Innheimtusniðmát (en. Claim template)"
- Ekki verður stuðningur við að senda kröfuskrá sb. 3.25 CreateClaimsStream TS 162:2013
- Endurgreiða kröfu +/- með kostnaði.
- Aðgerðir
  - Create (1..n)
    - Engin fjölda takmörk
  - ReCreate (Endurvekja)    
  - Alter     
  - Cancel    
  - Query
    - Claim -> hægt að sækja þrátt fyrir nýtt kröfuauðkenni 
    - Allar breytingar á einhverju tímabili fyrir kröfueiganda sem skilar -> Claim transactions  
    - Payments
      - Greiðsla/greiðslur
      - Ráðstöfun (Kröfuauðkenni, ráðstöfunarreikningur, reikningseigandi, tegund hlutar, kostnaðarliðir, upphæð)
    - Claim transactions
    - MarkClaimForSecondaryCollection
  - SecondaryCollection* verða ræddar á næsta fundi  


# 2021-03-09 (Rafræn skjöl)
- Greiðsluveitan
  - Þjónusta til að skila skjalategundum? Í dag er þessi listi fastur listi
    - Launaskrá (LS) (Launaseðill)
    - Launamiði (LM)
    - Lykilorð (PW)
    - Greiðsluseðill
    - Bankareikningur
    - Viðskiptayfirlit ( Skv. SBS 2013 )
  LS, LS, GS, RE, TS, TK, PW, LM, LM, YF, IP, RT, RM, RP, RR, GR, DV, SY,
  FY, SF, BY, SE, SN, SL, KV, RV, LN, VY, VR, GK, TV, YV, VL, GT, KR, UN, LA
  - "DesirablePeriodOfValidity" eða Æskilegur gildistimi -> Verður ekki tekið með.
  - "PreviousVersion": "" #Ef previous svæðið er notað er fyrra skjal úrelt -> Verður ekki tekið með.



# 2021-03-02 (Part 2)
- Beiðni kom frá Íslandsbanka um að ræða eftirfarandi
  - Balance
    - (vísað er í balanceType úr psd2-api 1.3 *.yaml)
      1. Eru balance notaðir útfrá credit limit eða authorization limit (limit sem notandi slær inn)
      2. Sameiginlegur skilningur á öllum balance.

    - Hvaða balance tegundir notum við fyrir eftirfarandi:
      1. Til ráðstöfunar (Horft útfrá auth limit)
         - "expected"
      2. Ógreiddir reikningar
         - T.d. fyrir kreditkort, skuld frá síðasta tímabil
        - Ekkert hérna  
      3. Síðasti greiðsluseðill (upphæð sem var fyrir síðasta tímabil)
         - Ekkert hérna
      4. Credit exposure (Upphæðin sem kúnni á eftir ógreitt, greiðsludreifing, ógreiddir reikningar, notkun á tímabilinu)
         - Ekkert hérna
      5. Notkun á tímabili án ófjárhagslegar færslur (Pending færslur)
         - "interimBooked"
      6. Notkun á tímabili með ófjárhagslegar færslur (Með pending færslur) Velta tímabilsins
         - "expectedBooked"
      7. Greiðsludreifing (Heildar balance á greisðludr. + kost og exp.vextir)
         - Ekkert hérna
      8. Vanskil
         - Ekkert hérna

Niðurstaðan er sú að bankarnir útnefni fólki í vinnuhóp 7. Hópurinn mun taka afstöðu til:
  - Hvernig staðið væri að viðhaldi og þróun
    - Viðhaldsferlar
  - Taka fyrir breytingarbeiðni um viðbót í balanceType
    - "expectedBooked":
      Balance composed of booked entries and pending items known at the time of calculation, 
      which projects the end of day balance if everything is booked on the account and no other entry is posted.
      
      For card accounts, this is composed of:
        - not yet invoiced but already booked entries and
        - pending items (not yet booked)
      
      For card-accounts:
      
      "money to spend with the value of a pre-approved credit limit on the card account"

# 2021-03-02 (Part 1)
- Concent (Íslandbanki) -> Samþykkt að hafa Concent inni sem option fyrir reikninga, Landsbankinn ætlar ekki að útfæra.
- Tegundur skjala -> Hafa þennan lista inn ásamt texta sem segir að banka gæti bætt við eins og þurfa þykir. 
  - Launaskrá (LS), Launamiði (LM), Lykilorð (PW), Greiðsluseðill, Bankareikningur, Viðskiptayfirlit ( Skv. SBS 2013 )
    - Fá hugmyndir af fleiri tegundum skjala
- Ekki hægt uppfæra skjal
- Er hægt að merkja skjal sem úrelt?
- Hver er raunverulegur eigandi innsendra skjala? 
- Hlutverk
  - Banki er mögulega vinnsluaðili skjalsins.
- Næsti fundur
  - 10:00 - 11:00 Rafræn skjöl
  - 11:00 - 12:00 Kröfur
  - 12:00 - 12:15 Stofnun hópsins "Viðhald og þróun"

## Búa til skjalabunka
{
  "Id" : "Einkvæmt sendingarnúmer",
  "Name": "Launaseðlar",
  "IDNumber": "kennitala sendanda",
  "DocumentType": "<documentType.Code>",
  "EffectiveDate" : "",
  *"DueDate"? Síðar
  *"FinalDueDate"? Síðar
  "Files": [
    { 
      "Id" : "Einkvæmt skjalanúmer",
      "Name": "Laun fyrir Guðmund",
      "Description": "<Nafn fyrirtækis, sendandi> - <Skjalategund>",
      "IDNumber": "Kennitala viðtakanda",
      "FileType": "pdf | xml | ref", # Fastur listi af möguleikum
      "File": "Base64",
      "FileRef": "https://www.mbl.is/skjal/001.pdf",
      "Reference": "1000-66-000001"
    },
  ]
}

<UploadDocument>
  <Document>
    <DocumentInfo>
      <PersonID>4511972829</PersonID>
      <DocumentType>PW</DocumentType>
      <DocumentName>Test1.txt</DocumentName>
    </DocumentInfo>
    <File>SGVsbG8gd29ybGQ=</File>
  </Document> 
</UploadDocument>

## Landsbanka útfærslan
{
  "entries": [
    {
      "Statement": {
      "Acct": "4703013920BLAR4710080280",
      "Date": "2018/08/23",
      "User1": "4703013920",
      "User3": "PDF",
      "User4": "4703013920BLAR20180823000001",
      "XKey": "000001"
      },
      "file": "skjal1.pdf"
    },
    {
      "Statement": {
        "Acct": "4703013920BLAR4710080280",
        "Date": "2018/08/23",
        "User1": "4703013920",
        "User3": "PDF",
        "User4": "4703013920BLAR20180823000002",
        "XKey": "000002"
      },
      "file": "einhver_mappa/skjal2.pdf"
    }
  ]
}

  
## Sækja skjalabunka eftir einkvæmu sendingarnúmeri

{
  "Id" : "Einkvæmt sendingarnúmer"
  "Staða": "Tóks, Tókst ekki, Tókst að hluta",
  "bunki": "Launaseðlar",
  "kennitala": "kennitala sendanda",
  "skjalategund": "Launaseðlar",
  "skjöl": [
    {
      "Id": "Einkvæmt skjalanúmer",
      "Staða": "Útvinnslustaða",
      "Nafn": "Laun fyrir Guðmund",
      "Description": "",
      "Kennitala": "Kennitala Guðmundar",
      "fileType": "pdf | xml | ref"
      "fileRef": "https://www.mbl.is/skjal/001.pdf",
      "reference": "Kröfunúmer eða eitthvað álíka"
    },
  ]
} 

## Búa til skjala
{
  "bunki": "Launaseðlar",
  "kennitala": "kennitala sendanda",
  "skjalategund": "Launaseðlar",
  "skjöl": 
    {
      "Nafn": "Laun fyrir Guðmund",
      "Kennitala": "Kennitala Guðmundar",
      "fileType": "pdf | xml | ref", # Fastur listi af möguleikum
      "file": "Base64", (vs),
      "fileRef": "https://www.mbl.is/skjal/001.pdf",
      "reference": "Kröfunúmer eða eitthvað álíka"
    }
} -> Einkvæmt sendingarnúmer
  
## Sækja skjalabunka eftir einkvæmu sendingarnúmeri

{
  "Id" : "Einkvæmt sendingarnúmer"
  "Staða": "Tóks, Tókst ekki, Tókst að hluta",
  "bunki": "Launaseðlar",
  "kennitala": "kennitala sendanda",
  "skjalategund": "Launaseðlar",
  "skjöl": {
      "Id": "Einkvæmt skjalanúmer",
      "Staða": "Útvinnslustaða",
      "Nafn": "Laun fyrir Guðmund",
      "Kennitala": "Kennitala Guðmundar",
      "fileType": "pdf | xml | ref"
      "fileRef": "https://www.mbl.is/skjal/001.pdf",
      "reference": "Kröfunúmer eða eitthvað álíka"
    }
} 




# 2021-02-23
- Líftími: Send inn skjal, leiðrétta skjal (í ákveðinn tíma), eytt skjali?
- Tegundir skjals gæti mögulega stýrt hversu lengi á að geyma skjalið 
- Við ætlum ekki að ræða nánar dagsetningar, sem dæmi:
  - Dagsetningar:
    - Úrelding
    - Gildistími (frá og til)
- Leiðrétting
  - Í ákveðinn tíma
    - .
  - Tegund skjals (Ekki fyrir PW, Lykilorð)
- Greiðsluveitan ætlar að skoða
  - Það þarf að vera hægt að fletta upp tegundum skjala, hvaða tegundir skjala viljum við hafa.
  - Æskilegur gildistími
  - Reference fyrir skjöl
- Við ætlum að setja /v1/consents aftur inn sem optional möguleika

# 2021-02-16

- Setja /v1/consents aftur inn sem optional möguleika.

- Er mögulegt að afturkalla innsend skjöl, til dæmis innan ákveðins tíma (dæmi 1-2 tímar)?
- Hægt að fá betra svar þegar leitað er að skjali/skjölum
  - Niðurstöðu niður á reference númer per item innan sendingarbunka
  - 
- Hugsum rafræn skjöl eins og greiðslur og bunkagreiðslur.
  - Bunkagreiðslur væru með hugsanlega mörkum:
    - Hámarksstærð?
    - Fjöldi?
  
- Grunnskráarsnið væru .pdf, .xml, hugsanlega nota mimetype fyrir skilgreiningu á skjali
- Fá álit lögfræðings, bankarnir tilnefna lögfræðing fyrir næsta fund
  - Hvað þýðir varanlegur miðill
  - Hvernig má vinna með varanlegan miðil
  - Grisunarreglur

- Fá greiðsluveituna með í þessa vinnu.

- Metagögn á skjölum
  - Kennitala eiganda
  - ?
  

# 2021-02-09

Rafræn skjöl:

- Skráarsnið dæmi .pdf, .xml, ... ? Ef Xml skráarsnið er notað þarf að vera hægt að senda sniðmát mér sérstaklega?
- Skjalaflokkun nota (4.2 Tegund skjals)

- Á aðeins að vera hægt að senda PDF eða aðrar tegundir?
- Hvernig ætlum við að taka á móti zip skrám?
- Þegar skjal er sent frá einum aðila til annars, getur móttakandi sótt skjalið rafrænt? 

- Skrá skjal/skjöl -> Sending:
    - Kennitala sendanda ?
    - Kennitala viðtakanda ?
    - "Counter" er númer sem kemur frá notenda (Ef sami "Counter" er notað er fyrra skjal yfirskrifað) ?
    - Reference "stak eða listi" ?
    - Nafn skjals
    - Skjala tegund (Flokkun 4.2 Tegund skjals)
    - Dreifileið (Í hvaða kerfi á þetta að fara) / skjalatunna ?
    - Dagsetning skjals ?
    - response:
        - Sending ID -> GUID

- Sækja skjal/skjöl -> Sending:
    - Sækja eftir einkvæmu auðkenni (Sending ID)
    - Sækja eftir dagsetningar bili

Það þarf að skoða notkun á:
    - /v1/consents
      - Á Api level er ekki munur á persónu eða fyrirtæki
      - Er lagalegur munur?
      - Skoða fyrir næsta fund.

Sleppum /v1/funds-confirmations í B2B
Sleppum /v1/signing-baskets í B2B

---