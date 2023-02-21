//
//  CharacterDetailsVC.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var idLabel: UILabel! {
        didSet {
            idLabel.text =  "\("\("ID = ")\((presenter.characterIdentifier))")"
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variabels
    
    var presenter: CharactersDetailsPresenterProtocol
    var activityView: UIActivityIndicatorView?

    
    // MARK: - View Life Cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        title = presenter.characterIdentifier
        
    }
    
    // MARK: - Init
    
    init(presenter: CharactersDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName:"\(CharacterDetailsVC.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Setup
    
    func setUpTableView() {
        
        tableView.register(UINib.init(nibName: CharacterDetailsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CharacterDetailsTableViewCell.identifier)
        
    }
    
   
}

// MARK: - UITableViewDelegate

extension CharacterDetailsVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let cell = cell as? CharacterDetailsTableViewCell {
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.section
            cell.collectionView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        view.tintColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return  "Comics"
        case 1:
            return "Stories"
        case 2:
            return "Series"
        case 3:
            return "Events"
            
        default:
            return ""
        }
        
        
    }
    
    
}
// MARK: - UITableViewDataSource

extension CharacterDetailsVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailsTableViewCell.identifier, for: indexPath) as? CharacterDetailsTableViewCell else {
            fatalError("PODTableViewCell Cell Not Registered")
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    
}


// MARK: - UICollectionViewDelegate

extension CharacterDetailsVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.getItemsCount(section: collectionView.tag) ?? 0
    }
    
}

// MARK: - UICollectionViewDataSource

extension CharacterDetailsVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("Cell Not Registered")
        }
        
        presenter.configure(characterCell: cell, forIndex: indexPath, collectionViewTag: collectionView.tag)
        return cell
        
    }
}


// MARK: - CharacterDetailsViewProtocol

extension CharacterDetailsVC: CharacterDetailsViewProtocol {
    
    func reloadData() {
        
        setUpTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
     
    }
    
    
}
