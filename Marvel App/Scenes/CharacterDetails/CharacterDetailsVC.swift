//
//  CharacterDetailsVC.swift
//  Marvel App
//
//  Created by Moustafa Gadallah on 27/07/1444 AH.
//

import UIKit

class CharacterDetailsVC: UIViewController , CharacterDetailsViewProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CharactersDetailsPresenterProtocol
   
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        presenter.viewDidLoad()
        setUpTableView()
        title = "Details"
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
        reloadData()
        tableView.register(UINib.init(nibName: CharacterDetailsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CharacterDetailsTableViewCell.identifier)
        
    }
    
    func reloadData() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate
extension CharacterDetailsVC : UITableViewDelegate {
    
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


        presenter.configureIntenalTableViewCell(characterCell: cell , forIndex: indexPath)
        
        return cell
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
}

