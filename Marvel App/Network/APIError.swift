//
//  APIError.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Alamofire

enum APIError: Error {
    
    case noInternetConnection
    case _409
    case parseError
    case _405
    case _403
    case _401
    case AFError(AFError)
   
}

extension APIError {
    
    public var errorDescription: String? {
        switch self {
       
        case .noInternetConnection  : return "No Internet Connection, Please try again."
        case ._409     : return "Missing API Key"
        case .parseError            : return "Parsing Error."
        case ._405       : return "Method Not Allowed"
        case ._403   :  return "Forbidden"
        case ._401 :   return "Invalid Hash"
        case .AFError(let error)    : return  error.errorDescription ?? ""
       
    }
}

}
