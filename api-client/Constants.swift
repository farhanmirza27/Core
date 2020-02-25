//
//  Constants.swift
//  JustEat
//
//  Created by Farhan Mirza on 14/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


// constants

struct JustEatApp {
    struct Server {
        static let baseURL = "https://public.je-apis.com"
    }
    
    struct APIParameterKey {
        // TODO : can be added in future
    }
}

// header fields
enum HTTPHeaderField: String {
    case AcceptTenant = "Accept-Tenant"
    case AcceptLanguage = "Accept-Language"
    case  Authorization = "Authorization"
    case Host = "Host"
    
}

// header fields values
enum HTTPHeaderFieldValue: String {
    case AcceptTenant = "uk"
    case AcceptLanguage = "en-GB"
    case  Authorization = "Basic VGVjaFRlc3Q6bkQ2NGxXVnZreDVw"
    case Host = "public.je-apis.com"
}

