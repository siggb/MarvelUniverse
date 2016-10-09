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
    var output: CharactersListViewOutput!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marvel Universe"
        tableView.delegate = self
        tableView.rowHeight = 66
        tableView.dataSource = dataSource
        dataSource.registerReusableViews(tableView: tableView)
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        output.loadContentIfNeeded(forced: false)
    }
    
    func onPullToRefresh() {
        output.loadContentIfNeeded(forced: true)
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
        defer {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        output.showCharacterDetail(character: dataSource.items?[indexPath.row])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let redundant = tableView.contentSize.height - tableView.frame.size.height - 64
        if scrollView.contentOffset.y > redundant {
            output.loadNextBatch()
        }
    }
}

extension CharactersListViewController: CharactersListViewInput {
    
    func showLoadingIndicator() {
        refreshControl.beginRefreshing()
    }
    
    func hideLoadingIndicator() {
        refreshControl.endRefreshing()
    }
    
    func displayContent(_ items: [Character], batched: Bool) {
        dataSource.items = output.prepareContent(batched: batched, origin: dataSource.items, items: items)
        tableView.reloadData()
    }
    
    func displayError(_ error: NSError) {
        dataSource.items = nil
        tableView.reloadData()
    }
}
