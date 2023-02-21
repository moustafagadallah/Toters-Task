//
//  CharacterDetailsEntity.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import Foundation

enum CharacterDetails {
    
    struct ComicsResponse :GenericResponse {
        
        var code: Int?
        var status: String?
        var copyright: String?
        var attributionText: String?
        var attributionHTML: String?
        var etag: String?
        var data: DataClassResponse?
        
    }
    struct DataClassResponse: Codable {
        var offset, limit, total, count: Int?
        var results: [Result]?
    }
    
    struct Result: Codable {
        
        var id, digitalId: Int?
        var title: String?
        var issueNumber: Int?
        var variantDescription: String?
        var description: String?
        var isbn, upc, diamondCode, ean: String?
        var issn: String?
        var pageCount: Int?
        var resourceURI: String?
        var urls: [URLElement]?
        var series: Series?
        var variants, collections: [Series]?
        var dates: [DateElement]?
        var prices: [Price]?
        var thumbnail: Thumbnail?
        var images: [Thumbnail]?
        var creators: Creators?
        var characters: CharactersItem?
        var stories: Stories?
        var events: CharactersItem?
        
    }

    
    struct CreatorsItem: Codable {
        var resourceURI: String?
        var name: String?
        var role: String?
    }
    
    struct CharactersItem: Codable {
        var available: Int?
        var collectionURI: String?
        var items: [Series]?
        var returned: Int?
    }
    
    
    struct Creators: Codable {
        var available: Int
        var collectionURI: String
        var items: [CreatorsItem]
        var returned: Int
    }
    
    struct Series: Codable {
        var resourceURI: String?
        var name: String?
    }
    
    struct URLElement: Codable {
        var type: String?
        var url: String
    }
    
    struct DateElement: Codable {
        var type: String?
        
    }
    
    struct Thumbnail: Codable {
        var path: String
        var thumbnailExtension: String?
        
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
        
    }
    
    struct Price: Codable {
        var type: String?
        var price: Double?
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
        var thumbnail: Thumbnail?
        var type: String?
    }
    
    struct EventsResponse : GenericResponse {
        var code: Int?
        var status: String?
        var copyright: String?
        var attributionText: String?
        var attributionHTML: String?
        var etag: String?
        var data: EventsDataClass?
        
    }
    
    struct EventsDataClass: Codable {
        var offset, limit, total, count: Int?
        var results: [Event]?
    }
    
    struct Event: Codable {
        var id: Int?
        var title, description: String?
        var resourceURI: String?
        var urls: [URLElement]?
        var start, end: String?
        var thumbnail: Thumbnail?
        var stories: Stories?
        
    }
    
    struct SeriesResponse: GenericResponse {
        var code: Int?
        var status: String?
        var copyright: String?
        var attributionText: String?
        var attributionHTML: String?
        var etag: String?
        var data: SeriesDataClass?
    }
    
    struct SeriesDataClass: Codable {
        var offset, limit, total, count: Int?
        var results: [SeriesItem]?
    }
    
      struct SeriesItem: Codable {
        var id: Int?
        var title: String?
        var description: String?
        var resourceURI: String?
        var urls: [URLElement]?
        var startYear, endYear: Int?
        var rating, type: String?
        var thumbnail: Thumbnail?
        var stories: Stories?
    
    }
    
    struct StoriesResponse : GenericResponse  {
        var code: Int?
        var status: String?
        var copyright: String?
        var attributionText: String?
        var attributionHTML: String?
        var etag: String?
        var data: StoriesDataClass?
    
        
    }
    
    struct StoriesDataClass: Codable {
        var offset, limit, total, count: Int?
        var results: [StoryItem]?
    }
    
    struct StoryItem: Codable {
        var id: Int?
        var title, description: String?
        var resourceURI: String?
        var type: String?
        var thumbnail: Thumbnail?
        var originalIssue: OriginalIssue?
    }
    
    struct OriginalIssue: Codable {
        var resourceURI: String?
        var name: String?
        
    }
    
    struct Item: Codable {
        var resourceURI: String?
        var name: String?
        var role: String?
    }
    
    
}



