### cardAccountDetails


| Field             | Rule  | Description                                               |
| ----------------- | ----- | --------------------------------------------------------- |
| resourceId        | M     | Einkvæmt númer                                            |
| maskedPan         | M     |                                                           |
| currency          | M     | ISO 4217 Alpha 3 currency code                            |
| ownerName         | M     | Name of the legal account owner. If there is more than one owner, then e.g. two names might be noted here. |
| displayName       | M     | Name of the account as defined by the PSU within online channels. |
| ownerId           | M     | Owner "Kennitala"                                         |
| name              | O     | Name of the account                                       |
| product           | O     | Product name of the bank for this account                 |
| status            | O     | enabled, deleted, blocked                                 |
| usage             | O     | Account usage, PRIV: private personal account, ORGA: professional account |
| details           | O     | Specifications that might be provided by the ASPSP        |
| creditLimit       | O     | Over draft limit rule on the account, in positive numbers |
| balances          | O     | A list of balances regarding this account                 |
| linkedAccounts    | IS    | "Skuldfærslureikningur / Raun reikningur"                 |
| _links            | O     | Links to resources                                        |


- expDate
- issueDate
- cardHolderId
- Samtölur? - Bankarnir
- Koma með tillögu um plast endpoint - Guðmundur


-Borgun
- M (1230-0789)
  - C1 (3210-1789)
    - Exp: 1/12
  - C2 (3210-2789)
    - Exp: 15/12
  
-Valitor
- M (3210-0789)
  - C1 (3210-0789)
    - Exp: 1/12
    - Virkt
  - C2 (3210-0789)
    - Exp: 15/12
    - Ónýtt
 


- ATHUGASEMDIR
  Sjá master kortið: O
  
  linkedAccounts = [
    {
        reikningur,
        tegund
    }
  ]


Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used
* IS = Icelandic 

### Query params
1. /v1/card-accounts
2. /v1/card-accounts/{account-id}
3. /v1/card-accounts/{account-id}/balances
4. /v1/card-accounts/{account-id}/transactions
5. /v1/card-accounts/{account-id}/cards



### Special cases

1. 

### Glossary
