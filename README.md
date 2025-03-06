
# Icelandic Online Banking Web Service
[![Issues](https://img.shields.io/github/issues/stadlar/IST-FUT-FMTH?v_DATE)](https://github.com/stadlar/IST-FUT-FMTH/issues?q=is%3Aissue+is%3Aopen)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/Stadlar/IST-FUT-FMTH?v_DATE)](https://github.com/stadlar/IST-FUT-FMTH/pulls?q=is%3Apr+is%3Aopen)
[![Contributors](https://img.shields.io/github/contributors/stadlar/IST-FUT-FMTH?v_DATE)](https://github.com/stadlar/IST-FUT-FMTH/graphs/contributors)
[![Creative Commons Attribution 4.0 International Public License](https://img.shields.io/badge/license-CCBY4.0-brightgreen)](https://github.com/stadlar/IST-FUT-FMTH/blob/master/LICENSE.txt)
<!-- ![Lates release by date](https://img.shields.io/github/v/release/Stadlar/IST-FUT-FMTH) -->

The repository encompasses the work and resulting technical standards of the *Tækninefnd um fjármálaþjónustu* (TN FMÞ) at the Icelandic Standards Council, usually abbreviated as IOBWS.

<!-- TABLE OF CONTENTS -->
## Table of Contents

- [Icelandic Online Banking Web Service](#icelandic-online-banking-web-service)
  - [Table of Contents](#table-of-contents)
  - [About The Project](#about-the-project)
  - [Getting Started](#getting-started)
  - [Technical Guidelines](#technical-guidelines)
  - [Contributing](#contributing)
  - [License and Attribution](#license-and-attribution)
  - [Contact](#contact)

<!-- ABOUT THE PROJECT -->
## About The Project

The Icelandic banks together with RB (Reiknistofa bankanna), SÍ (Central Bank of Iceland), various software companies, billing companies, Fintech companies, and other stakeholders associated with the technical committee "Tækninefnd um fjármálaþjónustu" (TN FMÞ) at the Icelandic Standards Council have issued several version of technical specification documents, that describe how Icelandic banks offer public application programming interfaces for digital transactions and data queries in the context of financial services.
The first version of those specifications was published in 2007 under the name IOBWS (Icelandic Online Banking Web Service).
Six years later, version 2, IOBWS 2.0 of the standard was published. Some of that previous work was facilitated using public code repositories but those were not part of the final delivery.
When it came time to upgrade the standard to version 3.0 of IOBWS, the participants agreed to use this code repository as the central hub for the work and to continue using it to handle improvements, bug fixes, and future upgrades to the schema, protocols, security standards and business operations that might result from feedback after the first iteration.

<!-- GETTING STARTED -->
## Getting Started

The documentation for the currently published standards is to be found in the Deliverables folder of this repository. It consists of OpenAPI compatible YAML specifications for the endpoints and schema types, accompanied by the matching PDF Technical Specification documentation. 

Official version of the technical standards and workshop agreements is available from Staðlaráð Íslands as follows:

* [Technical specification – Domestic payments and deposits](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-310-2023)
* [Technical specification - Debit and credit cards details and statements](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-311-2022)
* [Technical specification - Currency exchange rates](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-312-2022)
* [Technical specification - Foreign payments](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-313-2023)
* [Technical specification - Documents](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-314-2022)
* [Technical specification - Claims](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-315-2022)
* [Workshop Agreement - IOBWS version 3 Technical Guidelines](https://stadlar.is/stadlabudin/vara/?ProductName=IST-WA-316-2022)

ÍST TS 310, ÍST TS 313, and ÍST TS 312 in parts, are based on the Berlin Group NextGenPSD2 framework, with appropriate attribution given according to the Creative Commons Attribution 4.0 International Public License. Other IOBWS specifications might derive individual data types or elements from the ÍST TS 310 and ÍST TS 313, and attribution applies to these instances, as applicable.

Parties wishing to participate in the work of TN FMÞ are expected to know and understand the above standards and should consider participating in the regular work of the technical committee as allowed by the charter of the standards institute.

<!-- TECHNICAL DETAILS -->
## Technical Guidelines

Additional information on the implementation and consumption of APIs described in the technical specifications listed here, 
can be found in the following document. It also contains some further information on the maintenance of this repository.  

* [Workshop agreement WA 316 – IOBWS Technical Guidelines](Deliverables/%C3%8DST%20WA%20316_2022%20IOBWS%203.0%20Technical%20Guidelines.pdf)

<!-- CONTRIBUTING -->
## Contributing

Contributions are **appreciated** with some notes on good practices around Pull Requests.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/NewFeature`)
3. Commit your changes (`git commit -m 'Add some NewFeature'`)
4. Push to the Branch (`git push origin feature/NewFeature`)
5. Open a Pull Request and include the necessary descriptions of the problem you are trying to solve.
    1. A short but descriptive title
    2. The problem or context that triggered the suggested change.
    3. Why the particular implementation was chosen to solve the problem?
    4. The implications of the change, known benefits, or constraints.
    5. How can the API providers or consumers test that the change has been correctly implemented?
    6. A short description to include in the release.md if the change is accepted.

When contributing, you are expected to check our changes for consistency as well as errors before 
submitting a pull request. An easy way to accomplish this is using the open-source linter from 
Redocly e.g. under Docker as an alternative to installing the NPM tool:

```bash
docker run --rm -v $PWD:/spec redocly/openapi-cli lint 'Deliverables/IOBWS3.1.yaml'
```

Many of the warnings generated for the IOBWS3.x.yaml are due to issues with the original Berlin Group NextGen definition. To mitigate this an ignore file has been added in the root of the project to communicate to the linter which warnings can be overlooked. Please try to address all the additional issues created by your additions or changes before pushing a new update.
Also helpful when submitting changes is reviewing the API in a UI editor to determine if the presentation is transparent for the target consumers One of the most approachable editors, that also offers methods for code generation, is the OSS SwaggerAPI editor, again able to run in Docker:

```bash
docker run --rm -d -p 8044:8080 --name="openapigui" -e SWAGGER_FILE=/tmp/Deliverables/IOBWS3.0.yaml -v $PWD:/tmp swaggerapi/swagger-editor
```

The text of the technical specifications is mostly maintained as Markdown documents in the docs folder and can be updated along with changes to OpenAPI specifications, as long as some basic Markdown formatting is maintained to support conversion to PDF using Pandoc and LaTeX. 

<!-- LICENSE -->
## License and Attribution

The YAML artifacts are distributed under the Creative Commons Attribution 4.0 International Public License (CC BY 4.0). See [LICENSE](LICENSE.txt) for more information. This aligns the WA 310,TS 310 and TS 313 OpenAPI definitions with the Berlin Group NextGenPSD2 standard that they are based on. The YAML specifications are also in part an update to the previous IOBWS technical standards that referenced the MIT license with similar open permissions for commercial use, distribution, and private use. They can therefore be used by stakeholders as long as attribution is respected. The most immediate  predecessors are as follows in the table below:

| Previous Specification                                         | New Specification |
|----------------------------------------------------------------|--------------------------------|
| TS 160:2013 Gengi                                              | TS 312:2022 Currency (replaces TS 312:2021)         |    
| TS 161:2013 Greiðslur<br>TS 164:2013 Yfirlit bankareikninga    | TS 310:2023 Domestic payments and deposits  (replaces 310:2022 and WA 310:2020)                |  
| ---                                                            | TS 311:2022 Debit and credit cards details and statements (replaces TS 311:2021, new in IOBWS v3.0)                  |  
| TS 162:2013 Innheimtukröfur<br>TS 163:2013 Milliinnheimta      | TS 315:2025 Claims                      |  
| TS 165:2013 Rafræn skjöl                                       | TS 314:2025 Documents (replaces TS 314:2022)                    |  
| TS 166:2013 Tæknilegar upplýsingar og villuboð                 | WA 316:2022 Technical Requirements       |  
| ---                                                            | TS 313:2023 Foreign Payments  (replaces TS 313:2022 and TS 313:2021)          |  


<!-- CONTACT -->
## Contact

For information contact - stadlar@stadlar.is

Project Link: [https://github.com/stadlar/IST-FUT-FMTH](https://github.com/stadlar/IST-FUT-FMTH)
