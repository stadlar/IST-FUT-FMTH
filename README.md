
# ÍST WA 310

## Definition

* For Icelandic requirements NextGenPSD2 technical description from Berlin-group has been extended.


## Data dictionary



| Old               | New                               | Field rule            | Description   |
| ----------------- | --------------------------------- | --------------------- | ------------- |
| Seðilnúmer        | endToEndIdentification            | 7 first characters    | billNumber    |
| Tilvísun          | 1. remittanceInformationStructured<br>2. ultimateCreditor<br>3. creditId  | reference     |
| AccountOwnerID    | debtorId                          |                       |               |
| Textalykill       | purposeCodeIcelandic              |                       | CategoryCode  |
| Lýsing            | remittanceInformationUnstructured |                       |               |


### Accounts fields
| Field Name            | Description                                               |
| --------------------- |---------------------------------------------------------- |
| cashAccountType       | Not used                                                  |
| msisdn                | USed 


### Transaction fields
| Field Name            | Description                                               | SWIFT                         |
| --------------------- |---------------------------------------------------------- | ----------------------------- |
| entryReference        | Payment Correlation ID                                    | :86: /PREF/ Payment Reference |
| mandateId             | Identification of Mandates, <br> e.g. a SEPA Mandate ID   | :86: /MREF/ Mandate Id        |
| 




-> Tilvísunnúmer


## Skil

* Working version of the project https://github.com/stadlar/IST-FUT-FMTH/wiki
* IST-FUT-TN-FMTH-2019-12-1.yaml extends psd2-api 1.3.5 20191216v1.yaml




