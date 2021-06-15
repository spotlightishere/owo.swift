//
//  RequestHelper.swift
//
//
//  Created by Spotlight Deveaux on 2021-06-14.
//

import Alamofire
import Foundation

public extension DataRequest {
    func handle<Value: Decodable>(type givenType: Value.Type = Value.self) async throws -> Value {
        // Check success first.
        let initialResponse = await decode(Base.self).response
        var successBody: Base

        switch initialResponse.result {
        case let .success(parsedValue):
            successBody = parsedValue
        case let .failure(error):
            throw error
        }

        if successBody.success == false {
            let errorResponse = await decode(ErrorInfo.self).response

            switch errorResponse.result {
            case let .success(parsedValue):
                throw APIError.serviceError(errorCode: parsedValue.errorCode, reason: parsedValue.description)
            case let .failure(error):
                throw error
            }
        } else {
            let initialResponse = await decode(givenType).response

            switch initialResponse.result {
            case let .success(parsedValue):
                return parsedValue
            case let .failure(error):
                throw error
            }
        }
    }
}
