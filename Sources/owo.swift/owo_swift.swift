//
//  owo_swift.swift
//  owo.swift
//
//  Created by Spotlight Deveaux on 2021-04-08.
//

import Alamofire
import Foundation

/// Easily utilize the OwO Beta API to upload files,
/// shorten links, and list/delete associated files.
public class OwOSwift {
    /// The token used to authenticate a user with.
    private var token: String
    /// The domain to use as a base with all API routes.
    public var apiDomain = defaultAPIDomain
    /// The domain to append when uploading files.
    public var fileDomain = defaultUploadDomain
    /// The domain to append when shortening links.
    public var shortenDomain = defaultShortenDomain

    /// Initializes a usable OwOSwift object with the given token.
    /// All default domains are used, and the default API domain is set.
    /// - Parameter token: The token to authenticate the with.
    public init(with token: String) {
        self.token = token
    }

    /// Returns the base API domain concatenated with the specified route.
    /// - Parameter routePath: The string of the path intended to be concatenated.
    /// - Returns: A usable URL for the given route.
    private func route(for path: String) -> String {
        "\(apiDomain)\(path)"
    }

    /// Returns necessary headers for interacting with the API.
    /// - Returns: The proper Authorization and User-Agent for this request.
    private func getHeaders() -> HTTPHeaders {
        [
            "Authorization": token,
            "User-Agent": defaultUserAgent,
        ]
    }

    public func getUser() async throws {
        let user = try await AF.request(route(for: "/users/me"), method: .get, headers: getHeaders()).handle(type: User.self)
        print(user)
        print("success!")
    }
}
