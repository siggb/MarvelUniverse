//
//  CharactersListViewController.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var dataSource = CharactersListDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Characters"
        
        tableView.delegate = self
        tableView.rowHeight = 66
        tableView.dataSource = dataSource
        dataSource.registerReusableViews(tableView: tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension CharactersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CharactersListViewController: CharactersListViewOutput {
    
    func refreshList() {
        
    }
    
    func loadWithPagination() {
        
    }
    
    func openDetail(item: Character) {
        
    }
}
