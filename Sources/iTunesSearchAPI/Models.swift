// swift-itunes-search-api (C) Dr. Michael 'Mickey' Lauer

import Foundation

public enum iTunesSearchAPI {

    public static let baseURL: String = "https://itunes.apple.com/lookup?bundleId="

    @frozen public struct AppDetails: Codable {
        public let advisories: [String]
        public let appletvScreenshotUrls: [String]
        public let artistId: Int
        public let artistName: String
        public let artistViewUrl: String
        public let artworkUrl100: String
        public let artworkUrl512: String
        public let artworkUrl60: String
        public let averageUserRating: Double
        public let averageUserRatingForCurrentVersion: Double
        public let bundleId: String
        public let contentAdvisoryRating: String
        public let currency: String
        public let currentVersionReleaseDate: String
        public let description: String
        public let features: [String]
        public let fileSizeBytes: String
        public let formattedPrice: String
        public let genreIds: [String]
        public let genres: [String]
        public let ipadScreenshotUrls: [String]
        public let isGameCenterEnabled: Bool
        public let isVppDeviceBasedLicensingEnabled: Bool
        public let kind: String
        public let languageCodesISO2A: [String]
        public let minimumOsVersion: String
        public let price: Double
        public let primaryGenreId: Int
        public let primaryGenreName: String
        public let releaseDate: String
        public let releaseNotes: String
        public let screenshotUrls: [String]
        public let sellerName: String
        public let supportedDevices: [String]
        public let trackCensoredName: String
        public let trackContentRating: String
        public let trackId: Int
        public let trackName: String
        public let trackViewUrl: String
        public let userRatingCount: Int
        public let userRatingCountForCurrentVersion: Int
        public let version: String
        public let wrapperType: WrapperType
    }

    @frozen public struct AppStoreResponse: Codable {
        public let resultCount: Int
        public let results: [AppDetails]
    }

    @frozen public enum WrapperType: String, Codable {
        case track
        case collection
        case artist
        case software
    }

    public static func urlForApp(with bundleId: String) -> URL {
        return URL(string: "\(baseURL)\(bundleId)")!
    }
}
