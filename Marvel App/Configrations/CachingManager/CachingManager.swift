//
//  CachingManger.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation

class CachingManager {
    
    class func store(value: Any?, forKey key: String) {
        
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func removeValue(forKey key: String) {
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    class func setCharaters(_ characters: Characters.CharactersResponse?) {
        
        guard let characters = characters else { return }
        
        do {
            let charactersData = try JSONEncoder().encode(characters)
            UserDefaults.standard.set(charactersData, forKey: CachingKeys.Characters)
            
        } catch { }
    }
    
    class func characters() ->  Characters.CharactersResponse? {
        
        guard let characters = UserDefaults.standard.object(forKey: CachingKeys.Characters) as? Data else { return nil }
        
        do {
            let characters = try JSONDecoder().decode(Characters.CharactersResponse.self, from: characters)
            return characters
            
        } catch { }
        
        return nil
    }
    
    
    
    
}
