
# Icelandic Online Banking Web Service
[![Issues](https://img.shields.io/github/issues/stadlar/IST-FUT-FMTH?v_DATE)](https://github.com/stadlar/IST-FUT-FMTH/issues?q=is%3Aissue+is%3Aopen)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/Stadlar/IST-FUT-FMTH?v_DATE)](https://github.com/stadlar/IST-FUT-FMTH/pulls?q=is%3Apr+is%3Aopen)
[![Contributors](https://img.shields.io/github/contributors/stadlar/IST-FUT-FMTH?v_DATE)](https://github.com/stadlar/IST-FUT-FMTH/graphs/contributors)
[![Creative Commons Attribution 4.0 International Public License](https://img.shields.io/badge/license-CCBY4.0-brightgreen)](https://github.com/stadlar/IST-FUT-FMTH/blob/master/LICENSE.txt)
<!-- ![Lates release by date](https://img.shields.io/github/v/release/Stadlar/IST-FUT-FMTH) -->

The repository encompasses the work and resulting technical standards of the *Tækninefnd um fjármálaþjónustu* (TN FMÞ) at the Icelandic Standards Council, usually abbreviated as IOBWS.

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
* [Technical Guidelines](#technical-details)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)

<!-- ABOUT THE PROJECT -->
## About The Project

The Icelandic banks together with RB (Reiknistofa bankanna), SÍ (Central Bank of Iceland), various software companies, billing companies, Fintech companies, and other stakeholders associated with the technical committee "Tækninefnd um fjármálaþjónustu" (TN FMÞ) at the Icelandic Standards Council have issued several version of technical specification documents, that describe  how Icelandic banks offer public application programming interfaces for digital transactions and data queries in the context of financial services.
The first version of those specifications was published in 2007 under the name IOBWS (Icelandic Online Banking Web Service).
Six years later, version 2, IOBWS 2.0 of the standard was published. Some of that previous work was facilitated using public code repositories but those were not part of the final delivery.
When it came time to upgrade the standard to version 3.0 of IOBWS, the participants agreed to use this code repository as the central hub for the work and to continue using it to handle improvements, bug fixes, and future upgrades to the schema, protocols, security standards and business operations that might result from feedback after the first iteration.

<!-- GETTING STARTED -->
## Getting Started

The latest official version of the technical standards is as of now available from Staðlaráð Íslands as follows:

* [Workshop agreement – Domestic payments and deposits](https://stadlar.is/stadlabudin/vara/?ProductName=IST-WA-310-2020)
* [Technical specification - Debit and credit cards details and statements](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-311-2021)
* [Technical specification - Currency rate](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-312-2021)
* [Technical specification - Foreign payments](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-313-2021)
* [Technical specification - Documents](https://stadlar.is/stadlabudin/vara/?ProductName=IST-TS-314-2021)

WA 310 is based on the Berlin Group NextGenPSD2 standard, with appropriate attribution according to the Creative Commons Attribution 4.0 International Public License. Some of the other standards might align with types and data formats from 310, as deemed necessary.

Parties wishing to participate in the work of TN FMÞ are expected to know and understand the above standards and should consider participating in the regular work of the technical committee as allowed by the charter of the standards institute.

<!-- TECHNICAL DETAILS -->
## Technical Guidelines

Additional information on the implementation and consumption of APIs described in the technical specifications listed here, 
can be found in the following document. It also contains some further information on the maintainance of this repository.  

* [Workshop agreement WA 316 – IOBWS Technical Guidelines](https://github.com/stadlar/IST-FUT-FMTH/blob/master/Deliverables/ÍST-WA-315_2021_12.pdf)

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
Redocly, e.g. under Docker as an alternartive to installing the NPM tool:

```bash
docker run --rm -v $PWD:/spec redocly/openapi-cli lint 'Deliverables/IOBWS3.0.yaml'
```

As many of the warnings generated for WA/TS 310 can be attributed to issues with the Berlin Group NextGen definition, an ignore file has 
been added specifically to communicate which warnings can be overlooked. Otherwise, please try to address all issues created by your 
additions or changes, before pushing a new change.
Also helpful before submitting, is reviewing the API in an UI editor, to determine if the presentation will make sense for consumption.
One of the most approachable editors, that also offers methods for code generation, is the OSS SwaggerAPI editor, again able to run in Docker:

```bash
docker run --rm -d -p 8044:8080 --name="openapigui" -e SWAGGER_FILE=/tmp/Deliverables/IOBWS3.0.yaml -v $PWD:/tmp swaggerapi/swagger-editor
```

<!-- LICENSE -->
## License and Attribution

The work and resulting artifacts are distributed under the Creative Commons Attribution 4.0 International Public License (CC BY 4.0). See [LICENSE](LICENSE.txt) for more information. This aligns the WA 310/TS 310 OpenAPI definitions, and associated documents, with the Berlin Group NextGenPSD2 standard which they are based on. They and other parts of the technical standard are also, in part or whole, aligned with previous IOBWS technical standards which referenced the MIT license with similar open permissions for commercial use, distribution, and private use, as long as attribution is respected. The most immediate  predecessors are as follows in the table below:

| Previous Specification                                         | New Specification |
|----------------------------------------------------------------|--------------------------------|
| TS 160:2013 Gengi                                              | TS 312:2021 Currency           |    
| TS 161:2013 Greiðslur<br>TS 164:2013 Yfirlit bankareikninga    | WA  310:2020 / (TS 310)                  |  
| TS 162:2013 Innheimtukröfur<br>TS 163:2013 Milliinnheimta      | TS 315 Claims (in draft)<br>TS 31x Secondary Collecion (not started)                         |  
| TS 165:2013 Rafræn skjöl                                       | TS 314:2021 Documents                    |  
| TS 166:2013 Tæknilegar upplýsingar og villuboð                 | WA 316:202112 Technical Guidelines       |  
| ---                                                            | TS 313:2021 Foreign Payments             |  


<!-- CONTACT -->
## Contact

For information contact - stadlar@stadlar.is

Project Link: [https://github.com/stadlar/IST-FUT-FMTH](https://github.com/stadlar/IST-FUT-FMTH)