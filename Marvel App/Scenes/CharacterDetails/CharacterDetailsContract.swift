//
//  CharacterDetailsContract.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//


import Foundation

// MARK: - CharacterDetailsViewProtocol

protocol CharactersDetailsPresenterProtocol: AnyObject {
    
    func viewDidLoad()
    func configureIntenalTableViewCell(characterCell cell: TBCellViewProtocol, forIndex indexPath: IndexPath)
}



// MARK: - CharacterDetailsInteractorProtocol
protocol CharacterDetailsInteractorProtocol: AnyObject {
    
    
   func getComics(id : String?, onComplete: @escaping onComplete<CharacterDetails.ComicsResponse>)
   func getEvents(id : String?, onComplete: @escaping onComplete<CharacterDetails.EventsResponse>)
   func getSeries(id : String?, onComplete: @escaping onComplete<CharacterDetails.SeriesResponse>)
   func getStories(id : String?, onComplete: @escaping onComplete<CharacterDetails.StoriesResponse>)
    
 }



// MARK: - CharacterDetailsViewProtocol

protocol CharacterDetailsViewProtocol : AnyObject {
    
    func reloadData()
}


protocol CharacterCoordinatorProtocol  : AnyObject {

    
}

protocol TBCellViewProtocol: AnyObject {
   
    func setComics(_ models: [CharacterDetails.Result])
    func setEvents(_ models: [CharacterDetails.Event])
    func setSeries(_ models: [CharacterDetails.SeriesItem])
    func setStories(_ models: [CharacterDetails.StoryItem])
    func  reloadData()
 
}

protocol CharacterDetailsViewTabelViewCellPresenterProtocol {
    
    func configure(characterCell cell: CharacterCollectionlViewCellViewProtocol, forIndex indexPath: IndexPath )
    var view : TBCellViewProtocol?  { get set }
    func getItemsCount(section: Int) -> Int?
    func setComics(_ models: [CharacterDetails.Result])
    func setEvents(_ models: [CharacterDetails.Event])
    func setSeries(_ models: [CharacterDetails.SeriesItem])
    func setStories(_ models: [CharacterDetails.StoryItem])
    
}

protocol CharacterDetailsViewTabelViewCellProtocol : AnyObject {
   
    func reloadData()
 

}

