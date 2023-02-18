//
//  CharactersRouter.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit


class CharactersRouter {
    // MARK: - Variables
    let navigationController: UINavigationController

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let interactor = CharacterInteractor(network: API())
        let presenter = CharacterPresenter.init(interactor: interactor, wirframe: self)
        let vc = CharactersVC(presenter: presenter)
        vc.presenter = presenter
        presenter.view = vc
        interactor.presenter = presenter
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}



extension CharactersRouter :CharactersCoordinatorProtocol {
    
    
    func navigateToCharacterDetails(id: String?) {
        
    }
    
   

    
    
    
    
}

