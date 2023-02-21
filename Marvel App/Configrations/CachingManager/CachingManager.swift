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
    
    class func getValue(forKey key: String) -> Any? {
        
        return UserDefaults.standard.value(forKey: key)
    }
    
    class func removeValue(forKey key: String) {
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    class func cachedCharacterId() -> String? {
        
        return CachingManager.getValue(forKey: CachingKeys.CachedCharacterId) as? String
    }

    
    class func setCharaters(_ characters: Characters.CharactersResponse?) {
        
        guard let characters = characters else { return }
        
        do {
            let charactersData = try JSONEncoder().encode(characters)
            UserDefaults.standard.set(charactersData, forKey: CachingKeys.Characters)
            
        } catch { }
    }
    
    class func setComics(_ comics: [CharacterDetails.Result]?) {
        
        guard let comics = comics else { return }
        
        do {
            let charactersData = try JSONEncoder().encode(comics)
            UserDefaults.standard.set(charactersData, forKey: CachingKeys.Comics)
            
        } catch { }
    }
    
    class func setSeries(_ series: [CharacterDetails.SeriesItem]?) {
        
        guard let series = series else { return }
        
        do {
            let charactersData = try JSONEncoder().encode(series)
            UserDefaults.standard.set(charactersData, forKey: CachingKeys.Series)
            
        } catch { }
    }
    
    class func setStories(_ stories: [CharacterDetails.StoryItem]?) {
        
        guard let stories = stories else { return }
        
        do {
            let charactersData = try JSONEncoder().encode(stories)
            UserDefaults.standard.set(charactersData, forKey: CachingKeys.Stories)
            
        } catch { }
    }
    
    class func setEvents(_ events: [CharacterDetails.Event]?) {
        
        guard let events = events else { return }
        
        do {
            let charactersData = try JSONEncoder().encode(events)
            UserDefaults.standard.set(charactersData, forKey: CachingKeys.Events)
            
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
    
    
    class func comics() ->  [CharacterDetails.Result]? {
        
        guard let comics = UserDefaults.standard.object(forKey: CachingKeys.Comics) as? Data else { return nil }
        
        do {
            let comics = try JSONDecoder().decode([CharacterDetails.Result]?.self, from: comics)
            return comics
            
        } catch { }
        
        return nil
    }
    
    class func series() ->  [CharacterDetails.SeriesItem]? {
        
        guard let series = UserDefaults.standard.object(forKey: CachingKeys.Series) as? Data else { return nil }
        
        do {
            let series = try JSONDecoder().decode([CharacterDetails.SeriesItem]?.self, from: series)
            return series
            
        } catch { }
        
        return nil
    }
    
    class func stories() ->  [CharacterDetails.StoryItem]? {
        
        guard let stories = UserDefaults.standard.object(forKey: CachingKeys.Stories) as? Data else { return nil }
        
        do {
            let stories = try JSONDecoder().decode([CharacterDetails.StoryItem]?.self, from: stories)
            return stories
            
        } catch { }
        
        return nil
    }
    
    
    class func events() ->  [CharacterDetails.Event]? {
        
        guard let events = UserDefaults.standard.object(forKey: CachingKeys.Events) as? Data else { return nil }
        
        do {
            let events = try JSONDecoder().decode([CharacterDetails.Event]?.self, from: events)
            return events
            
        } catch { }
        
        return nil
    }
    
    
    
    
    
    
    
}
