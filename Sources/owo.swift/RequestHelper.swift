//
//  RequestHelper.swift
//  
//
//  Created by Spotlight Deveaux on 2021-06-14.
//

import Alamofire
import Foundation

@available(macOS 12, iOS 15, *)
extension DataRequest {
    public func handle<Value: Decodable>(type givenType: Value.Type = Value.self) async throws -> Value {
        // Check success first.
        let initialResponse = await self.decode(Base.self).response
        var successBody: Base
        
        switch (initialResponse.result) {
        case .success(let parsedValue):
            successBody = parsedValue
        case .failure(let error):
            throw error
        }
        
        if successBody.success == false {
            let errorResponse = await self.decode(ErrorInfo.self).response
            
            switch (errorResponse.result) {
            case .success(let parsedValue):
                throw APIError.serviceError(errorCode: parsedValue.errorCode, reason: parsedValue.description)
            case .failure(let error):
                throw error
            }
        } else {
            let initialResponse = await self.decode(givenType).response
            
            switch (initialResponse.result) {
            case .success(let parsedValue):
                return parsedValue
            case .failure(let error):
                throw error
            }
        }
    }
}
