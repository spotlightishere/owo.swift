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
    case serviceError(reason: String)
    case invalidToken
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

// TODO: Is there a better way to inherit the
// success/errorCode/description types instead of copying to all?
struct User: Codable {
    var success: Bool
    var errorCode: Int?
    var description: String?
    let user: UserInfo?
    
    enum CodingKeys: String, CodingKey {
        case success, description, user
        case errorCode = "errorcode"
    }
}
