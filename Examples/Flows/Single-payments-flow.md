# Single payments flow

## Step 1 - Request an access token for payment registration

### Request attributes

| Operation             | Request for scope                     |
| --------------------- | ------------------------------------- |
| Register payments     | psd2:icelandic-credit-transfer:write  |
| Get payments          | psd2:icelandic-credit-transfer:read   |
| Authenticate payments | psd2:icelandic-credit-transfer:auth   |


### Attributes

| Attribute             | Value                                          |
| --------------------- | ---------------------------------------------- |
| client_id             | Ask your ASPSP, for demo use 'TPP_demo'        |

### Certificate
eIDAS certificate will be required, ask your ASPSP for a demo certificate for sandbox testing.

| Certicate files                                |
| ---------------------------------------------- |
| Public certificate: openbankingPublicTPP.crt   |
| Private certificate: openbankingPrivateTPP.key | 

Sandbox URL: https://psd2.openbanking.is

### Request example
```
curl -X POST https://auth.openbanking.is/as/token.oauth2 \
     -v \
     -cert openbankingPublicTPP.crt \
     -key openbankingPrivateTPP.key \
     -H 'Cache-Control: no-cache' \
     -H 'Content-Type: application/x-www-form-urlencoded' \
     -d 'grant_type=client_credentials&client_id=TPP_demo&scope=psd2:icelandic-credit-transfer:write'
```

### Sample response
```
{
  "token_type": "Bearer",
  "access_token": "X1PTWZre0fnW72l263yrhAWB2FDwx3tg",
  "expires_in": 7199
}
```


## Step 2 - Register a payment
Use the access_token that you created in Step 1 of this tutorial to register a payment. This payment must be 
authorized by the account holder.

### Request example
Icelandic Credit Transfer
```
curl -X POST https://psd2.openbanking.is/v1/payments/icelandic-credit-transfer  \
-v \
-H 'Accept: application/json'  \
-H 'Authorization: Bearer UTUZnSKhYEYhX9qWl03epLVC3jyD' \
-H 'X-Request-ID: 99391c7e-ad88-49ec-a2ad-99ddcb1f7721' \
-H 'PSU-IP-Address: 192.168.1.1' \
-H 'content-type: application/json'
-d '{
    "endToEndIdentification": "Short description",
	"debtorId": "0208714669",
	"debtorAccount": {
        "iban": "IS110100260000010208714669"
    },
    "creditorId": "0208714669",
	"creditorAccount": {
        "iban": "IS710100261234560208714669"
    },
	"instructedAmount": {
        "amount": 99123
    },
    "purposeCodeIcelandic": "03",
    "remittanceInformationUnstructured": "My description",
	"remittanceInformationUnstructuredArray": [
        "Greiðsla vegna skuldar",
        "Minn hluti af greiðslu"
    ]
}'
```

### Sample response

#### HEADER
```
ASPSP-SCA-Approach: EMBEDDED | DECOUPLED | REDIRECT
X-Request-ID: 99391c7e-ad88-49ec-a2ad-99ddcb1f7721
Location: /v1/payments/icelandic-credit-transfer/1234-wertiq-983
```

#### BODY 
```
{
  "transactionStatus": "RCVD",
  "paymentId": "1234-wertiq-983",
  "_links": {
    "self": {
        "href": "/v1/payments/sepa-credit-transfers/1234-wertiq-983"
    },
    "status": {
        "href": "/v1/payments/1234-wertiq-983/status"
    }
  }
}
```

#### BODY - Authentication - Redirect 
```
{
  "transactionStatus": "RCVD",
  "paymentId": "1234-wertiq-983",
  "_links": {
    "scaRedirect": {
        "href": "https://psd2.openbanking.is/asdfasdfasdf"
    },
    "self": {
        "href": "/v1/payments/sepa-credit-transfers/1234-wertiq-983"
    },
    "status": {
        "href": "/v1/payments/1234-wertiq-983/status"
    },
    "scaStatus": {
        "href": "/v1/payments/1234-wertiq-983/authorisations/123auth456"
    }
  }
}
```

#### BODY - Authentication - OAuth 
```
{ 
  "transactionStatus": "RCVD",
  "paymentId": "1234-wertiq-983",
  "_links": 
  {
    "scaOAuth": {
        "href": "https://auth.openbanking.is/oauth/.well-known/oauth-authorization-server"
    },
    "self": {   
        "href": "/v1/payments/1234-wertiq-983"
    },
    "status": {
        "href": "/v1/payments/1234-wertiq-983/status"
    },
    "scaStatus": {
        "href": "/v1/payments/1234-wertiq-983/authorisations/123auth456"
    }
  }
}
```

#### BODY - Authentication - Decoupled 
```
{ 
  "transactionStatus": "RCVD",
  "paymentId": "1234-wertiq-983",
  "_links": 
  {
    "startAuthorisationWithPsuIdentification": {
        "href":"/v1/payments/1234-wertiq-983/authorisations"
    },
    "self": {
        "href": "/v1/payments/1234-wertiq-983"
    }
  }
} 
```

#### BODY - Authentication - Embedded 
```
{ 
  "transactionStatus": "RCVD",
  "paymentId": "1234-wertiq-983",
  "_links": 
  {
    "startAuthenticationWithPsuAuthentication": {
        "href": "/v1/payments/1234-wertiq-983/authorisations"
    },
    "self": {
        "href": "/v1/payments/1234-wertiq-983"
    }
  }
}
```


--------------------------------------------------

## Step 3 - Authenticate a payment

### Request example
Icelandic Credit Transfer
```
curl -X POST https://psd2.openbanking.is/v1/payments/icelandic-credit-transfer/1234-wertiq-983  \
-v \
-H 'Accept: application/json'  \
-H 'Authorization: Bearer UTUZnSKhYEYhX9qWl03epLVC3jyD' \
-H 'X-Request-ID: 99391c7e-ad88-49ec-a2ad-99ddcb1f7721' \
-H 'PSU-IP-Address: 192.168.1.1' \
-H 'content-type: application/json' 
```


### Sample response 200 Ok
```
{
  "scaStatus": "received",
  "authorisationId": "123auth456",
  "psuMessage": "Please use your online bank for transaction authorisation.",
  "_links": {
    "scaStatus": {
      "href": "/v1/payments/qwer3456tzui7890/authorisations/123auth456"
    }
  }
}
```

### Sample response 400 Bad request
```
{
  "tppMessages": [
    {
      "category": "ERROR",
      "code": "FORMAT_ERROR",
      "path": "string",
      "text": "string"
    }
  ],
  "_links": {
    "scaRedirect": { 
        "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "scaOAuth": {
        "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "startAuthorisation": { 
        "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983" 
    },
    "startAuthorisationWithPsuIdentification": { 
        "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "updatePsuIdentification": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "startAuthorisationWithProprietaryData": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "updateProprietaryData": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "startAuthorisationWithPsuAuthentication": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "updatePsuAuthentication": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "startAuthorisationWithEncryptedPsuAuthentication": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "updateEncryptedPsuAuthentication": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "updateAdditionalPsuAuthentication": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "updateAdditionalEncryptedPsuAuthentication": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "startAuthorisationWithAuthenticationMethodSelection": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "selectAuthenticationMethod": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "startAuthorisationWithTransactionAuthorisation": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "authoriseTransaction": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "self": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "status": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "scaStatus": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "account": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "balances": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "transactions": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "transactionDetails": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "cardAccount": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "cardTransactions": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "first": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "next": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "previous": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "last": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "download": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "additionalProp1": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "additionalProp2": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    },
    "additionalProp3": {
      "href": "/v1/payments/icelandic-credit-transfer/1234-wertiq-983"
    }
  }
}
```


## 