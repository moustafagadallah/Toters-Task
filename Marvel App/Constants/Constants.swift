//
//  Constants.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation


enum Keys {
    
    static let PublicKey = "0697085de54f89ac7a104398bb64c801"
    static let PrivateKey = "a83f8593e20e6a3448e711c97b8015730ff3d3a0"
    static let Stamp = Date.currentTimeStamp.description
    static let HashingValue   = Stamp + PrivateKey + PublicKey
}


enum APIPath {
    
    static let  GetComics =  "/%@/comics"
    static let  GetEvents = "/%@/events"
    static let  GetSeries = "/%@/series"
    static let  GetStories   = "/%@/stories"
    
}
