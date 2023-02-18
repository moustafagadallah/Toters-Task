//
//  CharacterDetailsTableViewCell.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsTableViewCell: UITableViewCell {
    

    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Variables
    
    static let identifier = "\(CharacterDetailsTableViewCell.self)"

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    
    func setCollectionView() {
        
        collectionView.register(UINib.init(nibName: CharacterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

  
    

}

// MARK: - UICollectionViewDataSource

extension CharacterDetailsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      return  UICollectionViewCell()
        
     }

}

// MARK: - UICollectionViewDelegate
extension CharacterDetailsTableViewCell: UICollectionViewDelegate {
    
    
}
