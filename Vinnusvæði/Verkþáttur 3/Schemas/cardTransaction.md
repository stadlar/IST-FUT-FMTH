### transactionDetails

| Field                             | Rule  | Description                                               |
| --------------------------------- | ----- | --------------------------------------------------------- |
| cardTransactionId                 | M     | Unique identifier for this record                         |
| terminalId                        | O     | Identification of the Terminal, where the card has been used |
| transactionTimestamp              | M,IS  | Execution datetime of the record                          |
| bookingDate                       | O     | The Date when an entry is booked                          |
| transactionAmount                 | M     | Amount and currency of this record                        |
| currencyExchange                  | C     | List. If transaction caused by any foreign exchange       |
| originalAmount                    | M     | Amount and currency of this record                        |
| markupFee                         | M     | Markup fee for this record                                |
| markupFeePercentage               | M     | Percentage of the involved transaction fee in relation to the billing amount |
| cardAcceptorId                    | O     | Identification of the Card Acceptor (e.g. merchant) as given in the related card transaction. |
| cardAcceptorAddress               | O     | Merchant address                                          |
| merchantCategoryCode              | O     | MCC                                                       |
| maskedPAN                         | O     | Masked Primary Account Number, example 123456xxxxxx1234   |
| transactionDetails                | O     | Transaction description details                           |
| proprietaryBankTransactionCode    | O     | Proprietary bank transaction code as used within a community or within an ASPSP e.g. for MT94x based transaction reports. |

Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used
* IS = Icelandic 

### Special cases

1.     