// swift-itunes-search-api (C) Dr. Michael 'Mickey' Lauer

import ArgumentParser
import CornucopiaHTTP
import swift_itunes_search_api

@main
struct Search: ParsableCommand {
    @Argument(help: "The bundle id to lookup.")
    var bundleId: String

    mutating func run() throws {
        print("Looking up \(bundleId)...")
    }
}
