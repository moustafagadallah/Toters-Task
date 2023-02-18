//
//  NetworkManager.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation

import UIKit
import Alamofire

typealias onComplete<T> = (_ result: APIResponseModel<T>) -> Void


class API {
    
    static let shared = API()
    init() {}
   
    let session = Alamofire.Session(interceptor: APIInterceptor())
    
    func startAPI<Response: GenericResponse>(endPoint: EndPoint,
                                                               req: Request? = nil,
                                                               onComplete: @escaping onComplete<Response>) {
        
        session.request(endPoint.url, method: httpMethod(forEndPoint: endPoint), parameters: httpParameters(forEndPoint: endPoint), encoding: encoding(forEndPoint: endPoint), headers: httpHeaders(forEndPoint: endPoint)).responseData { response in
        
            self.handleResponse(response, onComplete: onComplete)
        }
    }
    
    func handleResponse<T:GenericResponse>(_ response: AFDataResponse<Data>,
                                            onComplete: @escaping onComplete<T>) {
        
        if case let .success(data) = response.result {
            
            print(response.result)
            guard let model = T.decode(data) else {
                
               
                onComplete(.failure(.parseError))
                return
            }
            
            onComplete(.success(model))
            
        }
        
        if case let .failure(error) = response.result {
            onComplete(.failure(.AFError(error)))
        }
    }

    
}
