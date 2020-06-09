### balance


| Field                     | Rule  | Description                                               |
| ------------------------- | ----- | --------------------------------------------------------- |
| balanceAmount             | M     | Amount and currency                                       |
| balanceType               | M     | See 'Special cases'                                       |
| creditLimitIncluded       | O     | Is credit limit of the corresponding account is included  |
| lastChangeDateTime        | O     | ??                                                        |
| referenceDat              | M     | Reference date of the balance                             |
| lastCommittedTransaction  | O     | Name of the account                                       |

Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used
* IS = Icelandic 

### Special cases

BalanceType:
* closingBooked:    EOD, end of day
* expected:         Arriving
* openingBooked:    N/A (Not used)
* interimAvailable: At your disposal when "creditLimitIncluded" is True
* interimBooked:    Without credit limit
* forwardAvailable: Status at reference date
* nonInvoiced:      N/A (Not used)
* authorised:       Available (Icelandic)