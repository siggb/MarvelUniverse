//
//  CharacterDetailDataSource.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/6/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Rswift

class CharacterDetailDataSource: NSObject, UITableViewDataSource {

    var item: Character!
    
    func registerReusableViews(tableView: UITableView) {
        tableView.register(R.nib.characterDetailCell)
    }
    
    func configureHeaderView(tableView: UITableView) {
        let width = UIScreen.main.bounds.width
        let headerView = CharacterDetailHeaderView(character: item)
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 200))
        tableHeaderView.addSubview(headerView)
        tableView.tableHeaderView = tableHeaderView
        headerView.autoPinEdge(.top, to: .top, of: tableView.superview!, withOffset: 0, relation: .lessThanOrEqual)
        headerView.autoPinEdge(toSuperviewEdge: .bottom)
        headerView.autoSetDimension(.width, toSize: width)
        headerView.autoSetDimension(.height, toSize: 200, relation: .lessThanOrEqual)
        headerView.layoutIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.characterDetailCell.identifier, for: indexPath)
        if let cell = cell as? CharacterDetailCell {
            cell.configure(item: item)
        }
        return cell
    }
}
