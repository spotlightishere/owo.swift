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
        let response = await self.decode(givenType).response
        print(response)
        
        switch (response.result) {
        case .success(let parsedValue):
            return parsedValue
        case .failure(let error):
            throw error
        }
    }
}
