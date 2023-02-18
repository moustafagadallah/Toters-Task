//
//  Environment.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation


#if DEVELOPMENT
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.production
#endif


enum Environment {
    
    case development
    case production
    
    
    var baseURL: String {
        
        switch self {
            
        case .development:

            return AppUrls.developement
  
        
        case .production:
            
            return AppUrls.production
 
        }
    }
    
}
