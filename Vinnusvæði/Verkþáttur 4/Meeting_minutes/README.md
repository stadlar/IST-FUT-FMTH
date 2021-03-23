
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
        - Printing () -> Greiðslugjald
        - Paperless () -> Beingreiðslugjald
      - CurrencyInformation {Currency, DateRate, ReferenceRate}
      - DefaultCharge -> Engin breyting
      - DefaultInterest:
        - SpecialCode -> Dráttarvaxtaregla
      - Discount -> Vantar betri lýsingu 
      - OtherCosts 
      - OtherDefaultCosts
    
      - Næsti fundur:
        - PermitOutOfSequencePayment
        - IsPartialPaymentAllowed
        - BillPresentmentSystem
        - Printing
  - Þegar krafa er greidd:
    - Claimkey -> Tilvísun á greiðslunni og hægt að sjá með því að fletta upp færslum reikningsins (RB skoðar)
    - Claimkey getur verið túlkað sem BBAN þar sem str(Claimant) + str(Account) + '+' + DueDate.(YYYYMMDD)
    - 
  
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
  - Varanlegur miðill. Það verður hægt að breyta ákveðnum skjali innan ákveðins tíma frá innsendingu


# 2021-03-16
- Rafræn skjöl verða tekin fyrir á næsta fundi
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
      "File": "Base64", (vs),
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