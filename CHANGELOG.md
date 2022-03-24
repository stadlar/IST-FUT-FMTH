# Changelog

All notable changes to this project will be documented in this file. The project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.5] - 2022-03-25

- Patch release of [IOBWS v3.0](./Deliverables/IOBWS3-0.yaml) that changes the approach to domestic payments and deposits, as well as foreign payments, with matching updates to the Technical specifications:
- [ÍST TS 310:2020 Domestic payments and deposits.](ÍST TS 310_2022 Domestic payments and deposits.pdf)
- [ÍST TS 313:2022 Technical specification for Foreign payments.](./docs/ÍST TS 313_2022 Foreign payments.pdf)
Earlier versions of the YAML and associated specifications were deemed incomplete, and no implementation exists. Therefore the minor version in 3.0 was not incremented to communicate that 3.0.5 is not a backward compatible update supported in parallel with the earlier version. As established in this patch upgrade, future updates to ÍST TS documents related to the specifications under scope will be handled through pull requests to the markdown documents. The markdown is using a [pandoc](https://pandoc.org/) workflow the primary source of the PSD renditions distributed by Staðlaráð through its web store.

## [3.0.0] - 2021-03-15

- First release of the combined [IOBWS v3.0](./Deliverables/IOBWS3-0.yaml) that added, besides domestic payments and deposits, implementation of the APIs and schemas supporting ÍST TS 311:2021 Technical specification for Debit and credit cards details and statements.
- Implemented support for the ÍST TS 312:2021 Technical specification for Currency rate.
- Implemented support for the ÍST TS 313:2021 Technical specification for Foreign payments.

## [3.0.0+WA310] - 2020-08-17

- First release of [IST-FUT-TN-FMTH-2020-08-17.yaml](./Afurðir/IST-FUT-TN-FMTH-2020-08-17.yaml) in support of Workgroup Agreement 310, that contains APIs for Domestic payments
and deposits as needed to support PSD2 in context of the Icelandic financial system.
