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
    var refreshControl = UIRefreshControl()
    var dataSource = CharactersListDataSource()
    var presenter: CharactersListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Characters"
        tableView.delegate = self
        tableView.rowHeight = 66
        tableView.dataSource = dataSource
        dataSource.registerReusableViews(tableView: tableView)
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadContentIfNeeded(forced: false)
    }
    
    func onPullToRefresh() {
        presenter?.loadContentIfNeeded(forced: true)
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

extension CharactersListViewController: CharactersListViewInput {
    
    func displayContent(_ items: [Character]) {
        refreshControl.endRefreshing()
        dataSource.items = items
        tableView.reloadData()
    }
    
    func displayError(_ error: NSError) {
        refreshControl.endRefreshing()
        dataSource.items = nil
        tableView.reloadData()
        // TODO: show error
    }
}
