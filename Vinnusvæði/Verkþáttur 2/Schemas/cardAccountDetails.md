### cardAccountDetails


| Field             | Rule  | Description                                               |
| ----------------- | ----- | --------------------------------------------------------- |
| resourceId        | M     | The account number                                        |
| iban              | M     | The IBAN account number                                   |
| bban              | O     | The BBAN account number                                   |
| msisdn            | NA    | Not used                                                  |
| currency          | M     | ISO 4217 Alpha 3 currency code                            |
| name              | O     | Name of the account                                       |
| product           | O     | Product name of the bank for this account                 |
| cashAccountType   | NA    | Not used                                                  |
| status            | M     | enabled, deleted, blocked                                 |
| bic               | O     | BICFI                                                     |
| linkedAccounts    | NA    | Not used                                                  |  
| usage             | NA    | Not used                                                  |
| details           | O     | Specifications that might be provided by the ASPSP        |
| creditLimit       | O     | Over draft limit rule on the account, in positive numbers |
| balances          | O     | A list of balances regarding this account                 |
| _links            | M     | Links to resources                                        |

Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used
* IS = Icelandic 

### Query params
1. /v1/accounts:
    * (+) withCreditLimit (Query): Boolean
      If contained, this function reads the list of accessible payment accounts including the booking balance, 
      if granted by the PSU in the related consent and available by the ASPSP. This parameter might be ignored 
      by the ASPSP.
2. /v1/accounts/{account-id}:
    * (+) withCreditLimit (Query): Boolean
      If contained, this function reads the list of accessible payment accounts including the booking balance, 
      if granted by the PSU in the related consent and available by the ASPSP. This parameter might be ignored 
      by the ASPSP.

### Special cases

1. 

### Glossary
* Overdraft vs. CreditLimit
    * Credit limit is the amount of credit extended to the customer. Overdue balance 
      is the amount of money owned by the customer that has gone over it's due date. The due date is calculated 
      at posting by using the due date calculation field from the associated payment terms.
