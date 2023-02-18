//
//  APIResult.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation


enum APIResponseModel<T> {
    case success(T)
    case failure(APIError)
    
}

protocol GenericResponse: Codable {
    
    var status: String? { get set }
    var copyright: String? { get set }
    var attributionText: String? { get set }
    var attributionHTML: String? { get set }
    var etag : String? { get set }
    
}
