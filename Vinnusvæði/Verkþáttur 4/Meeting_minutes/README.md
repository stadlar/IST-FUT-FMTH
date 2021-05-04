
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
  - Ítarupplýsingar
    - niðurfellingardagur
    - auðkenni
    - uppphæð
    - tilvísunarnúmer 
    - eindagi
    - Seðilnúmer
    - Viðskiptanúmer
    - Greiðslugjald
    - Beingreiðslugjald
    - Annar kostnaður 
    - Annar vanskilakostnaður
  - Reglur
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
  - Minna notað
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