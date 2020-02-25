//
//  ApiRouter.swift
//  JustEat
//
//  Created by Farhan Mirza on 14/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case resturants (outcode: String)
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .resturants:
            return .get
            
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .resturants(let outcode):
            return "/restaurants?q=\(outcode)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .resturants:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let base = URL(string: JustEatApp.Server.baseURL)!
        let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
        let url = URL(string: baseAppend!)
        
        var urlRequest =  URLRequest(url: url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(HTTPHeaderFieldValue.AcceptTenant.rawValue, forHTTPHeaderField: HTTPHeaderField.AcceptTenant.rawValue)
        urlRequest.setValue(HTTPHeaderFieldValue.AcceptLanguage.rawValue, forHTTPHeaderField: HTTPHeaderField.AcceptLanguage.rawValue)
        urlRequest.setValue(HTTPHeaderFieldValue.Authorization.rawValue, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        urlRequest.setValue(HTTPHeaderFieldValue.Host.rawValue, forHTTPHeaderField: HTTPHeaderField.Host.rawValue)
        
        // Parameters if added
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

