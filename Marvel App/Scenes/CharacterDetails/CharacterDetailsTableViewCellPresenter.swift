//
//  CharacterDetailsTableViewCellPresenter.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 29/07/1444 AH.
//

import Foundation


class CharacterDetailsTableViewCellPresenter: CharacterDetailsViewTabelViewCellPresenterProtocol {
    
    var view :  TBCellViewProtocol?
    var comicItems = [CharacterDetails.Result]()
    var storiesItems = [CharacterDetails.StoryItem]()
    var seriesItems = [CharacterDetails.SeriesItem]()
    var eventItems = [CharacterDetails.Event]()

    init(view: TBCellViewProtocol) {
        self.view = view
    }
    
    func setComics(_ models: [CharacterDetails.Result]) {
     
        self.comicItems = models
        //view?.setComics(comicItems)
       
         //view?.reloadData()
        
        
    }
    
    func setEvents(_ models: [CharacterDetails.Event]) {
     
        self.eventItems  = models
   //     view?.setEvents(eventItems)
        //view?.reloadData()
        
    }
    
    func setSeries(_ models: [CharacterDetails.SeriesItem]) {
    
        self.seriesItems = models
     //   view?.setSeries(seriesItems)
        print("sisi1")
        print("\(models)")

   //   view?.reloadData()
    
  
    }
    
    
    func getItemsCount(section: Int) -> Int? {
        
      return 1
    
    
    }
    
    func setStories(_ models: [CharacterDetails.StoryItem]) {
        
        self.storiesItems = models
      //  view?.setStories(models)
        print("sisi")
        print("\(models)")
//       view?.reloadData()
    }
    
    
    func configure(characterCell cell: CharacterCollectionlViewCellViewProtocol, forIndex indexPath: IndexPath ) {
       
        
        
        switch indexPath.row {
        case 0 :
            let model = comicItems[indexPath.row]
            cell.setComic(model)
        case 1:
            let model = storiesItems[indexPath.row]
             cell.setStory(model)
        case 2 :
            let model = seriesItems[indexPath.row]
            cell.setSeries(model)
        case 3 :
            let model = eventItems[indexPath.row]
            cell.setEvent(model)

        default:
            break
            
        }
        
    }
    
}
