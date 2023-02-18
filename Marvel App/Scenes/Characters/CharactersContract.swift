//
//  CharactersContract.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation
import SwiftUI

// MARK: - View
protocol CharactersViewProtocol: AnyObject {
    
    var presenter: CharactersPresenterProtocol {get set}
    func reloadData()
    func setCopyRightlabel(copyRightSring : String?)
    
}

// MARK: - Presenter

protocol CharactersPresenterProtocol: AnyObject {
    func viewDidLoad()
    var numberOfItems: Int {get}
    func configure(characterCell cell: CharacterCollectionlViewCellViewProtocol, forIndex indexPath: IndexPath)
    func didSelectRow(at indexPath: IndexPath)
  
}

// MARK: - Interactor

protocol CharactersInteractorProtocol: AnyObject {
    
    var presenter: CharactersInteractorOutputProtocol? {get set}
    func getCharacters()


}
// MARK: - Interactor Output

protocol CharactersInteractorOutputProtocol: AnyObject {
    func charactersLoadedSuccessfully(response:Characters.CharactersResponse)

}

// MARK: - Router

protocol CharactersCoordinatorProtocol : AnyObject {
    func navigateToCharacterDetails(id: String?)
}


// MARK: - CharacterCellViewProtocol
protocol CharacterCollectionlViewCellViewProtocol: AnyObject {
    func setItem(_ model: Characters.Result)
 }




