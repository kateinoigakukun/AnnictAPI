# AnnictAPI

AnnictAPI is type safe API client for Annict.

[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](http://swift.org)

##Requirements
Swift 3.0

##Usage

###Authorize
```swift
AnnictClient.authorize(
	clientId: CLIENT_ID, clientSecret: CLIENT_SECRET,
    callbackURL: "annict-client://callback",
    scope: .readWrite,
    method: .sfSafariViewController(self), //UIViewController to open OAuth browser
    success: { [weak self] in
    	UserDefaults.standard.setValue($0.accessToken, forKey: ATStoredKey)
    }, failure: {
    	print($0)
    })
```

###Request

```swift
let client = AnnictClient(accessToken: key)
let request = AnnictMeWorks(filter_season: (year: 2016, .autumn))
client.send(request) { result in
	switch result {
    case .success(let response):
    	print(response)
    case .failure(let e):
		print(e)
	}
}
```