# Preliminary material for re-use

## Foreword
<!-- ForewordStart -->
This ÍST Technical Specification was developed in accordance with "ÍST Reglur um tækniforskriftir, tækniskýrslur og vinnustofusamþykktir" (*e.* IST rules on Technical Specifications, Technical Reports and Workshop Agreements). The TS (Technical specification) was prepared by the technical committee TN-FMÞ (The Technical Committee on Financial Services) that operates within FUT (Sector committee for ICT standardization) following a public call for participation within TN-FMÞ. The final draft was sent to the TN-FMÞ on the {{finaldraft_date}} and approved {{approvalmethod}} on the {{approve_date}}. The text of ÍST {{spec_id}} was submitted to IST for publication on {{publication_date}}.
 
The accompanying OpenAPI 3.0.1 definition "{{yaml_definition}}" located at [https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables](https://github.com/stadlar/IST-FUT-FMTH/tree/master/Deliverables), should be viewed as an integral part of ÍST {{spec_id}}.

The document "{{fulldoc_name}}" is the source of this rendition, and versions of that document will be used for future errata and clarifications per the procedures to be laid out in the workshop agreement ÍST WA 316, IOBWS 3.0 Technical Guidelines. The rules are outlined in the README.md accompanying the Github Git repository and are accepted by the participants in TN-FMÞ alongside this specification. These guidelines establish the workgroup TN-FMÞ-VH-7 as in charge of monitoring submitted issues and pull requests made to the repository when they fall outside the purview of other regular workgroups. TN-FMÞ-VH-7 will evaluate if changes are ready to be accepted into the repository and when or if they warrant patches or minor releases to the specification. Versioning will adhere to the [Semantic Versioning](https://semver.org/spec/v2.0.0.html) [@semver2] scheme and each minor release will require a workgroup agreement under the "ÍST reglur" referenced above.

{{funding_paragraph}}

ÍST {{spec_id}} is not subject to any patent rights. Some specific data elements in the specification can be viewed as derived from version 1.3.8 of the 
[Berlin Group's NextGenPSD2 Framework](https://www.berlin-group.org/nextgenpsd2-downloads)
and therefore the "{{yaml_definition}}" definition is also distributed under a 
[Creative Commons Attribution 4.0 International Public License (CC BY)](https://creativecommons.org/licenses/by/4.0/#).

This means the YAML Specification for ÍST {{spec_id}} can be copied and redistributed in any medium or format for any purpose, even commercially; when shared, appropriate credit must be given, a link to the license must be provided, and any changes made must be indicated. One may do this in any reasonable manner, however it must not be suggested that the licensor had endorsed it. Additionally, if you remix, transform, or build upon the specification, you may not distribute the modified specification.

The Technical Committee's participants have made every effort to ensure the reliability and accuracy of the technical and non-technical content of ÍST {{spec_id}}, but this does not guarantee its correctness, explicitly or implicitly. Users of ÍST {{spec_id}} should be aware that neither the TN-FMÞ nor ÍST can be held liable for damages or losses of any kind which may arise from its application. Users of ÍST {{spec_id}} do so on their own responsibility and at their own risk.
<!-- ForewordEnd -->

## Introduction 

<!-- IntroductionStart -->
This Technical Specification (TS) presents version 3.0 of the Icelandic Online Banking Services (IOBWS) for {{context_short}}.

Previous versions of IOBWS, released in 2007 and 2013 respectively, used the OASIS SOAP standards which were current at the time to define common web service interfaces for the Icelandic commercial and savings banks. This enabled software vendors, enterprises, and service providers to integrate their accounting, payment, and information systems with the bank's services, allowing them to act on behalf of the customers and with full access to their data. 

A goal of the IOBWS version 3.0 charter, which was set forth by TN-FMÞ in the beginning, is the transition from SOAP to a REST-like API, which is defined by a recent iteration of the [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md) [@OpenAPISpecification]. Along with support for modern authentication and authorization standards, this addresses some of the perceived complexity in adapting IOBWS to various use cases, platforms, and programming languages that have come to the forefront after the release of the previous IOBWS versions.
<!-- IntroductionEnd -->