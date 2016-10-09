//
//  CharacterDetailViewController.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    var dataSource = CharacterDetailDataSource()
    var output: CharacterDetailViewOutput!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = dataSource
        dataSource.registerReusableViews(tableView: tableView)
        dataSource.configureHeaderView(tableView: tableView)
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onBack() {
        output.goBack()
    }
    
    func onPullToRefresh() {
        output.loadContent(characterId: dataSource.item.id!)
    }
}

extension CharacterDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}

extension CharacterDetailViewController: CharacterDetailViewInput {
    
    func showLoadingIndicator() {
        refreshControl.beginRefreshing()
    }
    
    func hideLoadingIndicator() {
        refreshControl.endRefreshing()
    }
    
    func displayContent(_ item: Character) {
        dataSource.item = item
        tableView.reloadData()
    }
    
    func displayError(_ error: NSError) {
        //dataSource.item = nil
        tableView.reloadData()
    }
}
