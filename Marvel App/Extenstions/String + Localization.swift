//
//  String + Localization.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import Foundation



extension String {

    var localized: String {
        
           return NSLocalizedString(self, comment:"")
       }
    
}
