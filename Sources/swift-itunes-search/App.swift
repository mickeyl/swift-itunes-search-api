// swift-itunes-search-api (C) Dr. Michael 'Mickey' Lauer

import ArgumentParser
import CornucopiaHTTP
import Foundation
import iTunesSearchAPI

@main
struct Search: AsyncParsableCommand {

    @Argument(help: "The bundle id to lookup.")
    var bundleId: String

    mutating func run() async throws {
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
    }
}
