//
//  RequestHelper.swift
//
//
//  Created by Spotlight Deveaux on 2021-06-14.
//

import Alamofire
import Foundation

public extension DataResponse {
    func getSuccess<Value: Decodable>() throws -> Value {
        var result: Value

        switch self.result {
        case let .success(parsedValue):
            result = parsedValue as! Value
        case let .failure(error):
            throw error
        }

        return result
    }
}

public extension DataRequest {
    func handle<Value: Decodable>(type givenType: Value.Type = Value.self) async throws -> Value {
        // Check success first.
        let initialResponse = await decode(Base.self).response
        let successBody: Base = try initialResponse.getSuccess()

        if successBody.success == false {
            // If possible, we'll throw an error with the information given by the API.
            let error = await decode(ErrorInfo.self).response
            let errorResponse: ErrorInfo = try error.getSuccess()
            throw APIError.serviceError(errorCode: errorResponse.errorCode, reason: errorResponse.description)
        } else {
            // We have no error, so we can return what the user specified.
            return try await decode(givenType).response.getSuccess()
        }
    }
}
