//
//  Structures.swift
//
//
//  Created by Spotlight Deveaux on 2021-06-13.
//

import Alamofire
import Foundation

public enum APIError: Error {
    case connectionError(reason: String)
    case serviceError(errorCode: Int, reason: String)
    case invalidToken
}

struct Base: Codable {
    var success: Bool
}

struct ErrorInfo: Codable {
    var errorCode: Int
    var description: String

    enum CodingKeys: String, CodingKey {
        case description
        case errorCode = "errorcode"
    }
}

struct User: Codable {
    var success: Bool
    let user: UserInfo
}

struct UserInfo: Codable {
    var userId: String
    var username: String
    var email: String
    var isAdmin: Bool
    var isBlocked: Bool

    enum CodingKeys: String, CodingKey {
        case username, email
        case userId = "user_id"
        case isAdmin = "is_admin"
        case isBlocked = "is_blocked"
    }
}
