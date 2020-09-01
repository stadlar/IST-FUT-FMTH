
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
