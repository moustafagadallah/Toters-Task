//
//  String + MD5.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import UIKit
import Foundation
import CryptoKit

extension String {
    
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }

}


