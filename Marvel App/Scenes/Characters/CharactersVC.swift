//
//  CharactersVC.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 26/07/1444 AH.
//

import UIKit


class CharactersVC: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var hinLabel: UILabel!
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    
    
    // MARK: - Variables
   var presenter: CharactersPresenterProtocol
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
      super.viewDidLoad()
    
        presenter.viewDidLoad()
        setupCollectionView()
    }
    
    
    // MARK: - Init
    
    init(presenter: CharactersPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName:"\(CharactersVC.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    
}
    
    // MARK: - Setup
    
    
    private func setupCollectionView() {
        
        charactersCollectionView.register(UINib.init(nibName: CharacterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        charactersCollectionView.dataSource = self
        charactersCollectionView.delegate = self
        
    }
    
}

// MARK: - Extentions

extension CharactersVC: CharactersViewProtocol {

    func setCopyRightlabel(copyRightSring: String?) {

        hinLabel.text  = copyRightSring ?? ""
    }
    
   
    func reloadData() {

        charactersCollectionView.reloadData()
    }

    
}


// MARK: - Extentions UICollection View Delegate

extension CharactersVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

// MARK: - Extentions UICollection View DataSource

extension CharactersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItems
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("Cell Not Registered")
        }
        presenter.configure(characterCell: cell, forIndex: indexPath)
        return cell
    
    }
 
    
    
}

// MARK: - Extentions UICollectionViewDelegateFlowLayout

extension CharactersVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width/3.0
        return CGSize(width: cellWidth, height: (cellWidth))
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
