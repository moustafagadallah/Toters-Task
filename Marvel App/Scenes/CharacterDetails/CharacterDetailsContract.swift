//
//  CharacterDetailsContract.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//


import UIKit

// MARK: - CharacterDetailsViewProtocol

protocol CharactersDetailsPresenterProtocol: AnyObject {
    
    func viewDidLoad()
    func configure(characterCell cell: CharacterCollectionlViewCellViewProtocol, forIndex indexPath: IndexPath, collectionViewTag: Int)
   func getItemsCount(section: Int) -> Int?
    var characterIdentifier: String  {get}
   
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

protocol CharacterCoordinatorProtocol  : AnyObject { }
