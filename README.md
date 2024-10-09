# swift-itunes-search-api

A transport-agnostic implementation of the [iTunes Search API](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html).

NOTE: This package only implements the necessary model objects for the iTunes Search API, you have to
come up with the HTTP call execution yourself.

## How to use

Here's an example using [CornucopiaHTTP](https://github.com/Cornucopia-Swift/CornucopiaHTTP) as the transport layer:

```
import CornucopiaHTTP
import Foundation
import swift_itunes_search_api

let bundleId = "com.apple.ibooks"
print("Looking up \(bundleId)...")

let url = iTunesSearchAPI.urlForApp(with: self.bundleId)
let urlRequest = URLRequest(url: url)
let response: iTunesSearchAPI.AppStoreResponse = try await urlRequest.GET()

switch response.resultCount {
    case 0:
        print("Nothing found for \(bundleId).")

    case 1:
        let app = response.results.first!
        print("Found \(app.trackName) by \(app.artistName).")
        print("Latest version is \(app.version).")
        print("AppleId is \(app.trackId), navigation URL is \(app.trackViewUrl)")

    default:
        print("Found \(response.resultCount) apps for \(bundleId)?")
}
```

## TODO

Right now the model properties are optimized to parse software entities, for tracks, books, or collections, the returned
fields might be different.

## License

Licensed under MIT. Feel free to use, if it fits your need. Patches and all other sorts of commets highly appreciated.
