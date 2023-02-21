//
//  CharacterDetailsInteractor.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import Foundation

class CharacterDetailsInteractor : CharacterDetailsInteractorProtocol {
    
    // MARK: - Service Calling
    
    func getComics(id : String?, onComplete: @escaping onComplete<CharacterDetails.ComicsResponse>){
        
        let path = String(format: APIPath.GetComics, id?.description ?? "")
        let endPoint = EndPoint( path: path, method: .get, parameters: nil, encoding: .url, headers: nil)
        API.shared.startAPI(endPoint:endPoint, onComplete: onComplete)
        
    }
    
    func getEvents(id : String?, onComplete: @escaping onComplete<CharacterDetails.EventsResponse>){
        
        let path = String(format: APIPath.GetEvents, id?.description ?? "")
        let endPoint = EndPoint( path: path, method: .get, parameters: nil, encoding: .url, headers: nil)
        API.shared.startAPI(endPoint:endPoint, onComplete: onComplete)
        
    }
    
    func getSeries(id : String?, onComplete: @escaping onComplete<CharacterDetails.SeriesResponse>){
        
        let path = String(format: APIPath.GetSeries, id?.description ?? "")
        let endPoint = EndPoint( path: path, method: .get, parameters: nil, encoding: .url, headers: nil)
        API.shared.startAPI(endPoint:endPoint, onComplete: onComplete)
        
    }
    
    func getStories(id : String?, onComplete: @escaping onComplete<CharacterDetails.StoriesResponse>){
        
        let path = String(format: APIPath.GetStories, id?.description ?? "")
        let endPoint = EndPoint( path: path, method: .get, parameters: nil, encoding: .url, headers: nil)
        API.shared.startAPI(endPoint:endPoint, onComplete: onComplete)
        
    }
    

}
