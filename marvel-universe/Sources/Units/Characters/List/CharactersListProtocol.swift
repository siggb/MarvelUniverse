//
//  CharactersListProtocol.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

protocol CharactersListViewInput {
    func displayContent(_ items: [Character])
    func displayError(_ error: NSError)
}

protocol CharactersListViewOutput {
    func loadContentIfNeeded(forced: Bool)
    // TODO: pagination
    // TODO: open character info
}

protocol CharactersListInteractorInput {
    func loadItems()
}

protocol CharactersListInteractorOutput {
    func updateItems(items: [Character]?, error: NSError?)
}
