
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
        - Upplýsingar um kort (Gildistími)
        - Hreyfingarlisti
        - Heimildir kort (gætu verið aðrar en heimildir reikning á bakvið)
        - Nafnið á kortinu
        - Maskað kortanúmer
        - Eigandi
        - Kort Id
        - Staða/Ástand t.d. Fryst, Lokað, Opið, Stolið, Glatað ... 
        - Heimild
        - Aukaheimild
        - Bankanúmer/Útibú




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
