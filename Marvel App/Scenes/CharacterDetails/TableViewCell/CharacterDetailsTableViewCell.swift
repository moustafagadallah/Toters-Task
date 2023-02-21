//
//  CharacterDetailsTableViewCell.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsTableViewCell: UITableViewCell   {
   

    // MARK: - Outlets
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    
    static let identifier = "\(CharacterDetailsTableViewCell.self)"
  
    override func awakeFromNib() {
        super.awakeFromNib()

        setCollectionView()
    }
    
 
    
    

    // MARK: - Setup CollectionView

    func setCollectionView() {
        
        collectionView.register(UINib.init(nibName: CharacterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
            collectionView.delegate = self
        
    }


}


// MARK: - UICollectionViewDelegate
extension CharacterDetailsTableViewCell: UICollectionViewDelegate { }


// MARK: - Extentions UICollectionViewDelegateFlowLayout

extension CharacterDetailsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.bounds.width/3.0
        return CGSize(width: cellWidth, height:(cellWidth))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
