//
//  CharactersListProtocol.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

protocol CharactersListViewInput {
    func updateList(items: [Character])
    func displayError(error: NSError)
}

protocol CharactersListViewOutput {
    func refreshList()
    func loadWithPagination()
    func openDetail(item: Character) // -> in Router
}

protocol CharactersListInteractorInput {
    func loadItems(offset: Int, limit: Int)
}

protocol CharactersListInteractorOutput {
    func updateItems(offset: Int, limit: Int)
}
