//
//  EndPoint.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation

enum APIMethod {
    
    case get
    case post
    case put
    case delete
}

enum APIEncoding {
    
    case url
    case json
    case query
}


struct EndPoint {
    
    // MARK: - Variables
    
    var path: String
    var method: APIMethod
    var parameters: [String : Any]?
    var encoding: APIEncoding?
    var headers: [String : Any]?
    var fullURL: String?
    
    var url: String {
        
        return fullURL ?? "\(environment.baseURL)\(path)"
        
    }
   
    
    // MARK: - Initialization

    init() {
         self.path = ""
        self.method = .get
        self.parameters = nil
        self.encoding = nil
        self.headers = nil
        self.fullURL = nil
      
    }
    

    init(path: String,
        method: APIMethod? = .post,
         parameters: [String : Any]? = nil,
         encoding: APIEncoding? = nil,
         headers: [String : Any]? = nil,
         fullURL: String? = nil) {
        self.path = path 
        self.method = method ?? .post
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.fullURL = fullURL
    }
}


