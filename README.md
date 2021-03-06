# AnnictAPI

[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](http://swift.org)

AnnictAPI is type safe API client for Annict.

##Requirements
Swift 3.0

##Installation

#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "kateinoigakukun/AnnictAPI" ~> 0.1` to your Cartfile.
- Run `carthage update`.
- Link your app with `AnnictAPI.framework`, `APIKit.framework` and `Result.framework` in `Carthage/Build`.

##Usage

###Authorize

####Setting URLSchemes

Set URLSchemes in Info tab

![SettnigURLScheme](Asset/SettingURLScheme.png)

####Handle URL in AppDelegate
```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
  if (url.scheme == "annict-client" && url.host == "callback") {
    AnnictClient.handle(url: url)
  }
  return true
}
```


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
