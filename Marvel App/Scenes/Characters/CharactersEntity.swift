//
//  CharactersEntity.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Alamofire

enum Characters {
    
    struct CharactersReq :Codable {
        var apikey: String?
    }
    struct CharactersResponse: GenericResponse {
     
        var code:Int?
        var status: String?
        var copyright: String?
        var attributionText: String?
        var attributionHTML: String?
        var etag: String?
        var data: DataStruct?
        
    }
    
    struct DataStruct: Codable {
        var offset, limit, total, count: Int?
        var results: [Result]?
    }
    
    struct Result: Codable {
        var id: Int?
        var name, description: String?
        var thumbnail: Thumbnail?
        var resourceURI: String?
        var comics, series: Comics?
        var stories: Stories?
        var events: Comics?
        var urls: [URLElement]?
    }
    
    struct Comics: Codable {
        var available: Int?
        var collectionURI: String?
        var items: [ComicsItem]?
        var returned: Int?
    }
    
    struct ComicsItem: Codable {
        var resourceURI: String?
        var name: String?
    }
    
    struct Stories: Codable {
        var available: Int?
        var collectionURI: String?
        var items: [StoriesItem]?
        var returned: Int?
    }
    
    struct StoriesItem: Codable {
        var resourceURI: String?
        var name: String?
        var type: String?
    }
    
    struct Thumbnail: Codable {
        var path: String?
        var thumbnailExtension: String?

    }

    struct URLElement: Codable {
        var type: String?
        let url: String?
    }

    
}
