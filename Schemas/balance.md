### balance


| Field                     | Rule  | Description                                               |
| ------------------------- | ----- | --------------------------------------------------------- |
| balanceAmount             | M     | Amount and currency                                       |
| balanceType               | M     | See 'Special cases'                                       |
| creditLimitIncluded       | O     | Is credit limit of the corresponding account is included  |
| lastChangeDateTime        | O     | ??                                                        |
| referenceDate             | M     | Reference date of the balance                             |
| lastCommittedTransaction  | O     | Name of the account                                       |

Field rules
* M = Mandatory
* O = Optional
* C = Conditional
* NA = Not applicable / Not used
* IS = Icelandic 

### Special cases

BalanceType:
* closingBooked
    * EOD, end of day
    * Balance of the account at the end of the pre-agreed account reporting period. It is the sum of the opening 
      booked balance at the beginning of the period and all entries booked to the account during the pre-agreed
      account reporting period.
* expected
    * Arriving
    * Balance composed of booked entries and pending items known at the time of calculation, which projects the
      end of day balance if everything is booked on the account and no other entry is posted.
* openingBooked
    * Same as last day closingBooked
    * Book balance of the account at the beginning of the account reporting period. It always equals the closing
      book balance from the previous report.
* interimAvailable
    * At your disposal when "creditLimitIncluded" is True
    * Available balance calculated in the course of the account ?servicer?s business day, at the time specified, 
      and subject to further changes during the business day. The interim balance is calculated on the basis of 
      booked credit and debit items during the calculation time/period specified.
* interimBooked
    * Without credit limit
    * Balance calculated in the course of the account servicer's business day, at the time specified, and subject 
      to further changes during the business day. The interim balance is calculated on the basis of booked credit 
      and debit items during the calculation time/period specified.
* forwardAvailable
    * Status at reference date
    * Forward available balance of money that is at the disposal of the account owner on the date specified.
* nonInvoiced
    * Only for card accounts, to be checked yet.

