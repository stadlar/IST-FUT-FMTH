### cardTransaction

| Field                             | Rule  | Description                                               |
| --------------------------------- | ----- | --------------------------------------------------------- |
| cardTransactionId                 | M     | Unique identifier for this record                         |
| terminalId                        | M     | Terminal id where the card has been used                  |
| transactionDate                   | M     | Date of the actual card transaction                       |
| transactionTimestamp              | M     | Execution datetime of the record                          |
| bookingDate                       | O     | The Date when an entry is booked                          |
| transactionAmount                 | M     | Amount and currency of this record                        |
| currencyExchange                  | M     | Foreign exchange                                          |
| originalAmount                    | M     | Original amount                                           |
| markupFee                         | O     | Markup fee                                                |
| markupFeePercentage               | O     | Markup fee percentage                                     |
| cardAcceptorId                    | O     | Card acceptor id (merchant)                               |
| cardAcceptorAddress               | O     | Card acceptor address (merchant)                          |
| merchantCategoryCode              | M     | Merchant category code                                    |
| maskedPAN                         | M     | Masked PAN according to PCI-DSS                           |
| transactionDetails                | O     | Transaction details                                       |
| invoiced                          | M     | Has been invoiced                                         |
| proprietaryBankTransactionCode    | O     | Proprietary bank transaction code                         |


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


    