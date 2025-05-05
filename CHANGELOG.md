# Changelog

All notable changes to this project will be documented in this file. The project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Claims 3.1] - 2025-03-19

- Point release of TS 316 after updates by workgroup 7.
- Implements the changes in PR #198, with references to issues:
  - #194 Fixed the description for default interests (#194)
  - #182 Changed all amount properties that were defined as integers to number
  - #183 Renamed isPermitOutOfSequencePayment to isOutOfSequencePaymentAllowed
  - #185 dateReference to referenceDate
  - #186 Payment batch id in claim transaction 
  - #191 PaymentFee terminology
  - #192 Feature/include claim type
  - #184 Renamed amount properties using *Amount and *AmountDue postfixes
  - #187 Renamed a few properties in claimTransaction to be more descriptive
  - #193 Creation date included in caimDetails
  - #181 Claims - Use different schemas for batch initiation
  - #199 Renamed lastChanged property
  - #200 Removed unnecessary properties from defaultInterest
  - #206 Remove IsPostRefDate
  - #205 Remove DueDateRate from CurrencyPaymentRate
  - #204 Remove Claimant Address from printing object
  - #220 Fix examples
  - #218 Fix #215 - EnumType 
  - #217 Feature/fix214 description
  - #221 Fix #216 missing references
  - #232 Feature/update316and315
  - See [TS 314:2025 Documents](Deliverables/%C3%8DST-TS-314_2025%20Documents.pdf) (replaces TS 314:2022)

## [TS 316 3.1] - 2025-03-19

- Update of WA 316, from a workshop agreement to a technical specification.

## [Payments & Deposits 3.2.0] - 2025-03-19

- Minor version release of TS 310, identifies as version 3.2
- Fix for issue #207, Foreign-payment tegund í domestic greiðslum
- Fix for issue #208, Domestic greiðslur - instructionIdentification 
- Fix for issue #213, Domestic greiðslur - breyting á payment-card-deposits í carddeposits
- Fix for issue #223, BBAN pattern rangt fyrir claim-payments 
- Fix for issue #209, Staðla gengishagnaðarskatt sem tegund í innlánahreyfingu
- Fix for issue #231, Partial payment vantar fyrir paymentInitiationBulkElementDomestic_json
- IOBWS3.2.yaml renamed to match minor version.
- Documents TS 310 updated.
- README.MD updated in anticipation of new Technical Specification publication. 

## [Documents 3.1] - 2025-03-06

- Point release of TS 314 after validation and updates by workgroup 7.
- Implements the proposed changes in #227, originated by RB.
- See [TS 314:2025 Documents](Deliverables/%C3%8DST-TS-314_2025%20Documents.pdf) (replaces TS 314:2022)

## [3.1.0] - 2022-11-30

- First minor version release of TS 310 and TS 313, identifies as version 3.1
- Fix to issue #164, usage of property name remittanceInformationStructuredArray was not consistent. 
- IOBWS3.1.yaml renamed to match minor version.
- Documents TS 310, TS 311 updated.
- README.MD updated in anticipation of new Technical Specification publication. 

## [3.0.7+update] - 2022-10-12

- Claims documents had not been added and this was amended, while also cleaning up older deliverables by request of FUT.
  
## [3.0.7] - 2022-09-30

- Point release of TS 314 after validation and updates by workgroup 8:
- [TS 314:2022 Documents](Deliverables/%C3%8DST-TS-314_2021%20Documents.pdf) (replaces TS 314:2021)
  
## [3.0.7] - 2022-08-30

- Point release of TS 311 and TS 312  after validation and updates by workgroup 8:
- [TS 311:2022 Debit and credit cards details and statements](Deliverables/ÍST-TS-311_2021%20Debit%20and%20credit%20cards%20details%20and%20statements.pdf) (replaces TS 311:2021) 
- [TS 312:2022 Currency](Deliverables/ÍST%20TS%20312_2022%20Currency%20Exchange%20Rates.pdf) (replaces TS 312:2021)
  
## [3.0.6] - 2022-03-25

- First release of WA 316, a workshop agreement that contains technical guidelines for some of the subdocuments.
- [ÍST WA 316:2022 Technical Guidelines](Deliverables/ÍST%20WA%20316_2022%20IOBWS%203.0%20Technical%20Guidelines.pdf)

## [3.0.5] - 2022-03-25

- Patch release of [IOBWS v3.0](Deliverables/IOBWS3.0.yaml) that changes the approach to domestic payments and deposits, as well as foreign payments, with matching updates to the Technical specifications:
- [ÍST TS 310:2022 Domestic payments and deposits.](Deliverables/%C3%8DST%20TS%20310_2022%20Domestic%20payments%20and%20deposits.pdf)
- [ÍST TS 313:2022 Technical specification for Foreign payments.](Deliverables/ÍST%20TS%20313_2022%20Foreign%20payments.pdf)
Earlier versions of the YAML and associated specifications were deemed incomplete, and no implementation exists. Therefore the minor version in 3.0 was not incremented to communicate that 3.0.5 is not a backward compatible update supported in parallel with the earlier version. As established in this patch upgrade, future updates to ÍST TS documents related to the specifications under scope will be handled through pull requests to the markdown documents. The markdown is using a [pandoc](https://pandoc.org/) workflow the primary source of the PSD renditions distributed by Staðlaráð through its web store.

## [3.0.0] - 2021-03-15

- First release of the combined [IOBWS v3.0](./Deliverables/IOBWS3.0.yaml) that added, besides domestic payments and deposits, implementation of the APIs and schemas supporting ÍST TS 311:2021 Technical specification for Debit and credit cards details and statements.
- Implemented support for the ÍST TS 312:2021 Technical specification for Currency rate.
- Implemented support for the ÍST TS 313:2021 Technical specification for Foreign payments.

## [3.0.0+WA310] - 2020-08-17

- First release of [IST-FUT-TN-FMTH-2020-08-17.yaml](./Afurðir/IST-FUT-TN-FMTH-2020-08-17.yaml) in support of Workgroup Agreement 310, that contains APIs for Domestic payments
and deposits as needed to support PSD2 in context of the Icelandic financial system.
