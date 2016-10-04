//
//  CharactersListProtocol.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

protocol CharactersListViewInput: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayContent(_ items: [Character])
    func displayError(_ error: NSError)
}

protocol CharactersListViewOutput {
    func loadContentIfNeeded(forced: Bool)
    func showCharacterDetail(characterId: Int)
}

protocol CharactersListInteractorInput {
    func loadItems()
}

protocol CharactersListInteractorOutput: class {
    func updateItems(items: [Character]?, error: NSError?)
}

protocol CharactersListRouterInput {
    func showCharacterDetail(characterId: Int)
}
