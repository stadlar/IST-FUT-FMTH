### cardAccountDetails


| Field             | Rule  | Description                                               |
| ----------------- | ----- | --------------------------------------------------------- |
| resourceId        | M     | The account number                                        |
| maskedPan         | M     | Masked Primary Account                                    |
| currency          | M     | ISO 4217 Alpha 3 currency code                            |
| name              | O     | Name of the account                                       |
| product           | O     | Product name of the bank for this account                 |
| status            | M     | enabled, deleted, blocked                                 |
| bic               | O     | BICFI                                                     |
| linkedAccounts    | NA    | Not used                                                  |  
| usage             | NA    | Not used                                                  |
| details           | O     | Specifications that might be provided by the ASPSP        |
| creditLimit       | M     | Over draft limit rule on the account, in positive numbers |
| balances          | O     | A list of balances regarding this account                 |
| _links            | M     | Links to resources                                        |

Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used