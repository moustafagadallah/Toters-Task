//
//  CharacterCollectionViewCell.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import Foundation
import UIKit
import AlamofireImage

class CharacterCollectionViewCell : UICollectionViewCell {
    

    // MARK: - Outlets
    
    @IBOutlet weak var characterImageView: UIImageView!
        {
            didSet {
                characterImageView.makeCircular()
            }
        }
  
    @IBOutlet weak var nameLabl: UILabel!
    
    
    // MARK: - Variables
    
    static let identifier = "\(CharacterCollectionViewCell.self)"

    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }
    
}

// MARK: - CharacterCollectionlViewCellViewProtocol

extension CharacterCollectionViewCell :CharacterCollectionlViewCellViewProtocol {
    
    
    func setItem(_ model: Characters.Result) {
        nameLabl.text = model.name ?? ""
        characterImageView.image = nil
        let finalimagePath = "\(model.thumbnail?.path ?? "")\(".")\(model.thumbnail?.thumbnailExtension ?? "jpg")"
        
        if let imageUrl = URL(string: finalimagePath) {
            
            characterImageView.af.setImage(withURL: imageUrl)
        }
        
    }
    
}
