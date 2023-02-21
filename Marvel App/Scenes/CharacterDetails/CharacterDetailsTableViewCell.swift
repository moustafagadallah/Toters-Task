//
//  CharacterDetailsTableViewCell.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsTableViewCell: UITableViewCell , TBCellViewProtocol  {
  
  
    // MARK: - Outlets
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    
    static let identifier = "\(CharacterDetailsTableViewCell.self)"
    var presenter :  CharacterDetailsViewTabelViewCellPresenterProtocol?
   

    override func awakeFromNib() {
        super.awakeFromNib()
        presenter = CharacterDetailsTableViewCellPresenter(view: self)
        setCollectionView()
        
    }
    
    func reloadData() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
   
   
    }
    
    

    // MARK: - Setup CollectionView

    func setCollectionView() {
        
        collectionView.register(UINib.init(nibName: CharacterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
            collectionView.dataSource = self
            collectionView.delegate = self
    }


}

// MARK: - UICollectionViewDataSource

extension CharacterDetailsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int  {
        
        return 1
    }
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->       Int {

       return presenter?.getItemsCount(section:section) ?? 0
        
    }
    
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("Cell Not Registered")
        }
    
        //presenter?.view = self
        presenter?.configure(characterCell: cell, forIndex: indexPath)
   
        return cell
        
     }
    
    func setComics(_ models: [CharacterDetails.Result]) {
        
        presenter?.setComics(models)
   
    }
    

    func setEvents(_ models: [CharacterDetails.Event]) {
      
        presenter?.setEvents(models)
     
    
    }
    
    func setSeries(_ models: [CharacterDetails.SeriesItem]) {
    
        presenter?.setSeries(models)
        
  
        
    }
    
    func setStories(_ models: [CharacterDetails.StoryItem]) {
        
        presenter?.setStories(models)
   

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
