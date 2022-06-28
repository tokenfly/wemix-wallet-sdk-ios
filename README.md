# WemixWalletSDK for iOS(Swift)
Provide iOS with the API required for the following items to be requested for Wemix Wallet App.

* Auth 
* Send Wemix 
* Send Token 
* Send NFT 
* Contract Execute 

## WorkFlow


## Installation
WemixWalletSDK-iOS is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
target 'project' do
    pod 'WemixWalletSDK-iOS'
end
```

## Domain Setting
The SDK is based on the mainnet. If you want to set it to TestNet, add the "A2A Wemix Domain" key to the plist file and type url below.
> Key : A2A Wemix Domain, Value : http<nolink>://a2a.test.wemix.com

![Setting](https://github.com/nxtmeta/wemix-wallet-sdk-ios/blob/master/Example/WemixWalletSDK-iOS/url_setting.png)


## Usage
* [Wallet Address](#auth)
* [Send coin](#send-wemix)
* [Send token](#send-token)
* [Send NFT](#send-nft)
* [Contract Execute](#contract-execute)
* [Result](#result)


### Auth
Request Wallet Address

```Swift
    //In the MetaData object, name is required and other parameters are optional.
    let metaData = MetaData(name: "dappName")
    
    WemixWalletSDK.proposal(metaData: metaData, sendData: nil) { requestID, statusCode in
        //The SDK internal method calls the wallet app by attaching a requestID to the scheme.
        guard let requestId = requestID, !requestId.isEmpty else {
            return
        }
    }
```

### Send Wemix
Request to send coins

```Swift
    let metaData = MetaData(name: "dappName", description: "description", url: "url", icon: "iconUrl", successCallback: "", failureCallback: "")
    let sendWemix = SendWemix(from: from, to: to, value: value)
    
    WemixWalletSDK.proposal(metaData: metaData, sendData: sendWemix) { requestID, statusCode in
        //The SDK internal method calls the wallet app by attaching a requestID to the scheme.
        guard let requestId = requestID, !requestId.isEmpty else {
            return
        }
    }
```

### Send Token
Request to send token

```Swift
    let metaData = MetaData(name: "dappName")
    let sendToken = SendToken.init(from: from, to: to, value: value, contract: contract)
    
    WemixWalletSDK.proposal(metaData: metaData, sendData: sendToken) { requestID, statusCode in

        guard let requestId = requestID, !requestId.isEmpty else {
            return
        }
    }
```

### Send NFT
Request to send NFT

```Swift
    let metaData = MetaData(name: "dappName")
    let sendNFT = SendNFT.init(from: from, to: to, contract: contract, tokenId: tokenID)
        
    WemixWalletSDK.proposal(metaData: metaData, sendData: sendNFT) { requestID, statusCode in
        
        guard let requestId = requestID, !requestId.isEmpty else {
            return
        }
    }
```

### Contract Execute
Request execution of the contract

```Swift
    let metaData = MetaData(name: "dappName")
    let contractExecute = ContractExecute.init(from: from, to: to, abi: abi, params: params)
    
    WemixWalletSDK.proposal(metaData: metaData, sendData: contractExecute) { requestID, statusCode in
        
        guard let requestId = requestID, !requestId.isEmpty else {
            return
        }
    }
```

### Result
If there is a result of the request in Wemix Wallet App, the API is called as follows when Dapp is in the foreground state.
```Swift
    
    //The requsestID is the response value received from the API above
    WemixWalletSDK.getResult(requestId: requestId) { dic, statusCode in
        if statusCode == 200 {
            //When requesting a wallet address
            guard let result = dic!["result"] as? Dictionary<String, Any>,
                  let address = result["address"] as? String else {
                
                return
            }
            print(address)
            
            //Requesting to send Coin, send Token, send NFT, Contract Execute 
            guard let result = dic!["result"] as? Dictionary<String, Any>,
                  let txId = result["transactionHash"] as? String else {
                
                return
            }

            print(txId)
        }
    }
```


## Author

jinsik, jshan@coinplug.com

## License

WemixWalletSDK-iOS is available under the MIT license. See the LICENSE file for more info.
