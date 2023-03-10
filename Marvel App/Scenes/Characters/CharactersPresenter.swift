//
//  CharactersPresenter.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation

class CharacterPresenter  {
    
    // MARK: - Variables
    weak var view: CharactersViewProtocol?
    let wirframe: CharactersCoordinatorProtocol
    private let interactor: CharactersInteractorProtocol
    private var charactersItems = [Characters.Result]()
    private var characterFullResponse = Characters.CharactersResponse()
    
    // MARK: - Init
    init(interactor: CharactersInteractorProtocol,
         wirframe: CharactersCoordinatorProtocol) {
        self.interactor = interactor
        self.wirframe = wirframe
        
    }
    
    
}


// MARK: - CharactersPresenterProtocol

extension CharacterPresenter: CharactersPresenterProtocol {
    
    
    func didSelectRow(at indexPath: IndexPath) {
        
        let selectedItem = charactersItems[indexPath.row]
        print(selectedItem.id?.description ?? "")
        wirframe.navigateToCharacterDetails(id: selectedItem.id?.description ?? "")
        
    }
    
    func viewDidLoad() {
        
        if  (CachingManager.characters() != nil) {
            self.charactersItems = CachingManager.characters()?.data?.results ?? []
        } else {
            interactor.getCharacters()
        }
        
        
    }
    
    var numberOfItems: Int {
        
        return charactersItems.count
    }
    
    func configure(characterCell cell: CharacterCollectionlViewCellViewProtocol, forIndex indexPath: IndexPath) {
        
        let model = charactersItems[indexPath.row]
        cell.setItem(model)
        
    }
    
}


extension CharacterPresenter: CharactersInteractorOutputProtocol {
    
    func charactersLoadedSuccessfully(response: Characters.CharactersResponse) {
        
        charactersItems = []
        let resposeArray =  response.data?.results
        charactersItems += resposeArray ?? []
        view?.reloadData()
        view?.setCopyRightlabel(copyRightSring: response.attributionText ?? CachingManager.characters()?.attributionText)
        
    }
}
