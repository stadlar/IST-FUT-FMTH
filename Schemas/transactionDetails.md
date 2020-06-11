### transactionDetails

| Field                             | Rule  | Description                                               |
| --------------------------------- | ----- | --------------------------------------------------------- |
| transactionId	                    | M     | Unique identifier for this record                         |
| entryReference                    | M     | Payment Correlation ID                                    |
| endToEndId                        | M     | Short description                                         |
| mandateId                         | O     | Identification of Mandates                                |
| checkId                           | NA    | Not used                                                  |
| creditorId                        | M     | Creditor id                                               |
| bookingDate                       | O     | The Date when an entry is booked                          |
| valueDate                         | M     | The Date at which assets become available                 |
| transactionAmount                 | M     | Amount and currency of this record                        |
| currencyExchange                  | C     | List. If transaction caused by any foreign exchange       |
| creditorName                      | M     | Creditor name                                             |
| creditorAccount                   | M     | Creditor account                                          |
| creditorAgent                     | O     | BICFI                                                     |
| ultimateCreditor                  | O     | Ultimate creditor                                         |
| ultimateCreditorId                | O,IS  | Ultimate creditor id                                      |
| debtorName                        | M     | Debtor name                                               |
| debtorAccount                     | M     | Debtor account                                            |
| debtorAgent                       | O     | BICFI                                                     |
| ultimateDebtor                    | O     | Ultimate debtor                                           |
| ultimateDebtorId                  | O,IS  | Ultimate debtor Id                                        |
| remittanceInformationUnstructured | O     | My description                                            |
| remittanceInformationStructured   | O     | Reference field 16 characters                             |
| additionalInformation             | O     | Additional transaction related information                |
| purposeCode                       | NA    | Not used                                                  |
| icelandicPurpose                  | O,IS  | Text code used as simple transaction categorization       |
| merchantCategoryCode              | O,IS  | ???                                                       |
| bankTransactionCode               | NA    | Not used                                                  |
| proprietaryBankTransactionCode    | NA    | Not used                                                  |
| balanceAfterTransaction           | O     | Balance after the transaction has been performed          |
| _links                            | M     | Link to transaction details                               |

Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used
* IS = Icelandic 

### Special cases

1. In the case when source currency or destination currency is not 'ISK' then the transaction will contain
exchange rates.
    * Exchange rate from source currency to destination currency
    * Exchange rate from foreign currency to Icelandic krona
2. balanceAfterTransaction is not used for pending transactions
    
Example 1000 ISK to EUR
```json
[{
  "sourceCurrency": "ISK",
  "exchangeRate": "150.15",
  "unitCurrency": "ISK",
  "targetCurrency": "EUR",
  "quotationDate": "2020-06-09",
  "contractIdentification": ""
}]
```

Example 7.5 USD to 6 EUR
```json
[{
  "sourceCurrency": "ISK",
  "exchangeRate": "132.28",
  "unitCurrency": "ISK",
  "targetCurrency": "USD",
  "quotationDate": "2020-06-09",
  "contractIdentification": ""
},{
  "sourceCurrency": "ISK",
  "exchangeRate": "150.15",
  "unitCurrency": "ISK",
  "targetCurrency": "EUR",
  "quotationDate": "2020-06-09",
  "contractIdentification": ""
},{
  "sourceCurrency": "USD",
  "exchangeRate": "1.1274",
  "unitCurrency": "USD",
  "targetCurrency": "EUR",
  "quotationDate": "2020-06-09",
  "contractIdentification": ""
}]
```

    