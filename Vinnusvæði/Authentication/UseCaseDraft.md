# Use Cases for IOBWS 3.0 Authentication

## Centralised Financial System
> As an **Financial System**, I want to connect to IOBWS 3.0 services so that I can e.g. manage Claims, iniate Payments and fetch Account transactions in batches or directly on behalf of users.
Acceptance criteria:
1. Support for Búnaðarskilríki issued under Fullgilt Auðkenni, the current gold standard for authenticating and authorising centralised software to act on behalf of organisational units.
1. Support for on-line scenarios, where the organisasation authenticates though employees are instigating the actions.  
1. Support for two step authorisation scenarios, where the system initiates transactions that are authorised by employees through channels such as as app or web interface.

## On-premise employee
> As a **company employee** I want to e.g. iniate payment instructions, create claims and interact with IOBWS 3.0 so that I can manage my day-to-day activities through e.g. the companies ERP system.
Acceptance criteria:
1. The authentication of the user must be able to flow through, when appropriate.
2. Support for authentication with Qualified Certificates.
3. Optional support for other authentication methods used by each institution.

## Financial Services
> As e.g. **an independant Accounting firm** offering services to multiple clients, I want to be able to access their accounts and products through IOBWS 3.0, so I can manage their financials and accounting.
Acceptance criteria:
1. Support for assuming multiple identities. 
2. Support for authentication with Qualified Certificates or Búnaðarskilríki.
3. Optional support for other authentication methods used by each institution.
4. Optional support for "delegated" TPP like scenarios.

## Financial Software as a Service
> As the IOBWS 3.0 **customer of a bank**, I want to be able to authorise SaaS software hosted in public clouds to act on my behalf, so I can allow the service to manage my financials and the products I have access to such as Claims.
Acceptance criteria:
1. This should address the scenario where companies offering e.g. Dynamics 365 or more custom apps need to act on behalf of bank customers.
2. Similar level of support for delegated authorisation for the "TPP" involved.

## Software Vendor
> As the provider of software that enables its users to access IOBWS 3.0, I want to be able to target common authentication behavior as part of the technical that is offered accross all the banks, so that I do not have to test against multiple subtly different implementations.
Acceptance criteria:
1. There exist code samples that show how to connect using common platforms and frameworks.
2. The possible variations between banks do not affect the protocol exchanges between the client, authorisation server and API endpoint.
3. Possible variations in methods that still are offered by more than one bank are made part of the standard, as long as a common fallback exists. 
