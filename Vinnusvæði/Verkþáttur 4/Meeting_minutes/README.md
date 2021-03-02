# 2021-03-02 (Part 2)
- Balance
  - (vísað er í balanceType úr psd2-api 1.3 *.yaml)
    1. Eru balance notaðir útfrá credit limit eða authorization limit (limit sem notandi slær inn)
    2. Sameiginlegur skilningur á öllum balance.

    Hvaða balance tegundir notum við fyrir eftirfarandi:
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
  "Files": [
    {
      "Id" : "Einkvæmt skjalanúmer",
      "Name": "Laun fyrir Guðmund",
      *"DesirablePeriodOfValidity": "", # Æskilegur gildistimi
      "IDNumber": "Kennitala viðtakanda",
      "FileType": "pdf | xml | ref", # Fastur listi af möguleikum
      "File": "Base64", (vs),
      "FileRef": "https://www.mbl.is/skjal/001.pdf",
      "Reference": "Kröfunúmer eða eitthvað álíka",
      *"PreviousVersion": "" #Ef previous svæðið er notað er fyrra skjal úrelt
    },
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