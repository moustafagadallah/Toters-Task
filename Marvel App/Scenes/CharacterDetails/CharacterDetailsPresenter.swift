//
//  CharacterDetailsPresenter.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 28/07/1444 AH.
//

import UIKit

class CharacterDetailsPresenter {
    
    // MARK: - Variables
    
    private let interactor: CharacterDetailsInteractorProtocol
    let wirframe: CharacterCoordinatorProtocol
    var comicItems = [CharacterDetails.Result]()
    var storiesItems = [CharacterDetails.StoryItem]()
    var seriesItems = [CharacterDetails.SeriesItem]()
    var eventItems = [CharacterDetails.Event]()
    private var characterId: String?
    weak var view: CharacterDetailsViewProtocol?
    
    // MARK: - Init
    
    init(interactor: CharacterDetailsInteractorProtocol,
         wirframe: CharacterCoordinatorProtocol, charactedId: String?) {
        self.interactor = interactor
        self.wirframe = wirframe
        self.characterId = charactedId
        
    }
}

// MARK: - CharactersDetailsPresenterProtocol

extension CharacterDetailsPresenter: CharactersDetailsPresenterProtocol {
   
    func configure(characterCell cell: CharacterCollectionlViewCellViewProtocol, forIndex indexPath: IndexPath, collectionViewTag: Int) {
        
        switch collectionViewTag {
        case 0 :
            if comicItems.count > 0 {
                let model = comicItems[indexPath.item]
                cell.setComic(model)
            }
        case 1:
            if   storiesItems.count > 0 {
             let model = storiesItems[indexPath.item]
                cell.setStory(model)
            }
        case 2 :
            if  seriesItems.count > 0 {
                
                let model = seriesItems[indexPath.item]
                cell.setSeries(model)
            }
        case 3 :
            if eventItems.count > 0 {
                let model = eventItems[indexPath.item]
                cell.setEvent(model)
            }
            
        default:
            break
            
        }
        
    }
    
    
    func getItemsCount(section: Int) -> Int? {
        
        switch section {
        case 0 :
            return numberofComics
        case 1:
            return numberofStories
        case 2 :
            return numberofSeries
        case 3 :
            return  numberofEvents
        default:
            return 0
            
        }
        
    }
    
    func isObjectsCached() -> Bool? {
        
        var isobjectsCached :Bool?
        if  (CachingManager.series() != nil &&  CachingManager.stories() != nil && CachingManager.comics() != nil && CachingManager.events() != nil) {
            
            isobjectsCached = true
        }
        
        return isobjectsCached
        
    }
    
    
    func viewDidLoad() {
        
        if (isObjectsCached() ?? false) && (characterId == CachingManager.cachedCharacterId()) {
            
            self.eventItems = CachingManager.events() ?? []
            self.comicItems = CachingManager.comics() ?? []
            self.seriesItems = CachingManager.series() ?? []
            self.storiesItems = CachingManager.stories() ?? []
            
            self.view?.reloadData()
        } else {
            
            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            
            
            interactor.getComics(id: self.characterId) { result in
                
                switch result {
                    
                case .success(let response):
                    if response.code == 200 {
                        
                        let resposeArray = response.data?.results
                        self.comicItems += resposeArray ?? []
         
                        
                    }
                    
                case .failure(_):
                    break
                    
                }
                
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            
            interactor.getStories(id: self.characterId) { result in
                
                switch result {
                    
                case .success(let response):
                    if response.code == 200 {
                        
                        let resposeArray = response.data?.results
                        self.storiesItems += resposeArray ?? []
                        
                        
                    }
                    
                case .failure(_):
                    break
                    
                }
                
                dispatchGroup.leave()
            }
            
            
            dispatchGroup.enter()
            
            interactor.getSeries(id: self.characterId) { result in
                
                switch result {
                    
                case .success(let response):
                    if response.code == 200 {
                        let resposeArray = response.data?.results
                        self.seriesItems += resposeArray ?? []
                    
                        
                        
                    }
                    
                case .failure(_):
                    break
                    
                }
                
                dispatchGroup.leave()
                
            }
            
            dispatchGroup.enter()
            interactor.getEvents(id: self.characterId) { result in
                
                switch result {
                    
                case .success(let response):
                    if response.code == 200 {
                        
                        let resposeArray = response.data?.results
                        self.eventItems += resposeArray ?? []
                       
                        
                    }
                    
                case .failure(_):
                    break
                    
                }
                
                dispatchGroup.leave()
            }
            
            dispatchGroup.notify(queue: .main) {
                CachingManager.setEvents(self.eventItems)
                CachingManager.setComics(self.comicItems)
                CachingManager.setSeries(self.seriesItems)
                CachingManager.setStories(self.storiesItems)
                CachingManager.store(value: self.characterId, forKey: CachingKeys.CachedCharacterId)
                self.view?.reloadData()
            }
            
            
            
        }
        
    
        
    }
    
    var characterIdentifier: String {
        
        return self.characterId   ?? ""
    }
    
    
    var numberofComics: Int {
        
        return comicItems.count > 3 ?  3 :  comicItems.count
        
    }
    
    var numberofStories: Int {
        
        return seriesItems.count > 3 ?  3 :  seriesItems.count
        
    }
    
    var numberofSeries: Int {
        return storiesItems.count > 3 ?  3 :  storiesItems.count
    }
    
    var numberofEvents: Int {
        
        return eventItems.count > 3 ?  3 :  eventItems.count
    }
    
}
