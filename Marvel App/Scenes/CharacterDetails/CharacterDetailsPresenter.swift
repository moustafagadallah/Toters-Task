//
//  CharacterDetailsPresenter.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 28/07/1444 AH.
//

import Foundation

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
    var presenter :  CharacterDetailsViewTabelViewCellPresenterProtocol?
    
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
    
    
    func configureIntenalTableViewCell(characterCell cell: TBCellViewProtocol, forIndex indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0 :
            cell.setComics(self.comicItems)
        case 1:
            cell.setStories(self.storiesItems)
        case 2 :
        
            cell.setSeries(self.seriesItems)
        case 3 :
          
            cell.setEvents(self.eventItems)

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
    func viewDidLoad() {
        
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
            
            self.presenter?.setComics(self.comicItems)
            self.presenter?.setStories(self.storiesItems)
            self.presenter?.setSeries(self.seriesItems)
            self.presenter?.setEvents(self.eventItems)
       //     self.view?.reloadData()
        }
        

    }

    var numberofComics: Int {
        
        return comicItems.count
    }
    
    var numberofStories: Int {
        
        return storiesItems.count
        
    }
    
    var numberofSeries: Int {
        return seriesItems.count
    }
    
    var numberofEvents: Int {
        
        return eventItems.count
    }
    
  
    
    
}
