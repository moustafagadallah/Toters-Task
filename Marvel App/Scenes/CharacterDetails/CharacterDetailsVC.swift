//
//  CharacterDetailsVC.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
   
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpTableView()
        
    }
    
// MARK: - Setup
    
    func setUpTableView() {
       
        tableView.register(UINib.init(nibName: CharacterDetailsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CharacterDetailsTableViewCell.identifier)
    
    }
    
    
    

}
