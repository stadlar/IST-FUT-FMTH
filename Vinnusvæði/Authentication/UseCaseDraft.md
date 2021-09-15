# Use Cases for Authentication

## Centralised Financial System
> As an **Financial System**, I want to connect to IOBWS 3.0 services so that I can e.g. manage Claims, iniate Payments and fetch Account transactions in batched updates or on behalf of users.
Acceptance criteria:
1. Búnaðarskilríki issued under Fullgilt Auðkenni need to be supported as they are the current gold standard for authenticating and authorising centralised software to act on behalf of organisational units.

## On-premise employee
> As a **company employee** I want to e.g. iniate payment instructions, create claims and interact with IOBWS 3.0 so that I can manage my day-to-day activities through e.g. the companies ERP system.
Acceptance criteria:
1. The authentication of the user must be able to flow through, when appropriate.

## Financial Services
> As e.g. **an independant Accounting firm** offering services to multiple clients, I want to be able to access their accounts and products through IOBWS 3.0, so I can manage their financials and accounting.
1. The accounting method used by said firm must be able to scale against assuming multiple identities. 

## Financial Software as a Service
> As the IOBWS 3.0 **customer of a bank**, I want to be able to authenticate and authorise SaaS software hosted in public clouds, so I can allow that to manage my financials and the products I have access to.
1. This should address the scenario where e.g. companies offering Dynamics 365 apps need to act on behalf of bank customers
