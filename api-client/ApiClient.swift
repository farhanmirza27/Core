//
//  ApiClient.swift
//  JustEat
//
//  Created by Farhan Mirza on 14/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import Alamofire

// APIClient to handle api calls
class APIClient {
    
    // generic call to re-use code.
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                completion(response.result)
        }
    }
    
    // MARK: - Resturants
    static func getResturants(outcode: String,completion:@escaping (AFResult<Response>)->Void) {
        // decoder with custom key-decoding
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromUpperCamelCase
        performRequest(route: APIRouter.resturants(outcode: outcode),decoder: jsonDecoder, completion: completion)
    }
    
}

