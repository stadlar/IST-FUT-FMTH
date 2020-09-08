### cardAccountDetails


| Field             | Rule  | Description                                               |
| ----------------- | ----- | --------------------------------------------------------- |
| resourceId        | M     | The account number                                        |
| maskedPan         | M     | 
| currency          | M     | ISO 4217 Alpha 3 currency code                            |
| name              | O     | Name of the account                                       |
| product           | O     | Product name of the bank for this account                 |
| status            | O     | enabled, deleted, blocked                                 |
| usage             | O     | Account usage, PRIV: private personal account, ORGA: professional account |
| details           | O     | Specifications that might be provided by the ASPSP        |
| creditLimit       | O     | Over draft limit rule on the account, in positive numbers |
| balances          | O     | A list of balances regarding this account                 |
| linkedAccounts    | IS    | One or more linked account                                |
| _links            | O     | Links to resources                                        |

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

### Special cases

1. 

### Glossary
