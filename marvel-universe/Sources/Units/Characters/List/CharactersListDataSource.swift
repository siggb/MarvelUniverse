//
//  CharactersListDataSource.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/3/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Rswift

class CharactersListDataSource: NSObject, UITableViewDataSource {
    
    var items: [Character]? {
        didSet {
            // reload
        }
    }
    
    func registerReusableViews(tableView: UITableView) {
        tableView.register(R.nib.charactersListCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // показывать заглушку когда нет элементов
        return 15//items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.charactersListCell.identifier, for: indexPath)
        if let cell = cell as? CharactersListCell {
            //cell.configure(item: items![indexPath.row])
            cell.configure(item: nil)
        }
        return cell
    }

}
