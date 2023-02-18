//
//  CharactersInteractor.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation


class CharacterInteractor : CharactersInteractorProtocol {
    
    
    // MARK: - Variables
    private var network: API
    var presenter: CharactersInteractorOutputProtocol?
    // MARK: - Init
    init(network: API) {
        self.network = network
    }
    
    func getCharacter(req : Characters.CharactersReq, onComplete: @escaping onComplete<Characters.CharactersResponse>) {
        
        let endPoint = EndPoint( path: "", method: .get, parameters: nil, encoding: .url, headers: nil)
        API.shared.startAPI(endPoint:endPoint, onComplete: onComplete)
        
    }
    
    
    func getCharacters() {
        
        self.getCharacter(req: Characters.CharactersReq(apikey: Keys.PublicKey)) { result in
            
            switch result {
                
            case .success(let response):
                if response.code == 200 {
                    
                    self.presenter?.charactersLoadedSuccessfully(response: response)
                
                }
                
            case .failure(_):
                break
                
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
}
