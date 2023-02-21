//
//  CharacterDetailsRouter.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsRouter {
  
    
    // MARK: - Variables
    let navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(id: String?) {
        
        let interactor = CharacterDetailsInteractor()
        let presenter = CharacterDetailsPresenter(interactor: interactor, wirframe: self, charactedId: id)
        let vc = CharacterDetailsVC(presenter: presenter)
         presenter.view = vc
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
}
    
}


extension CharacterDetailsRouter: CharacterCoordinatorProtocol {
    
    
    
    
    
}
