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
    func displayContent(_ items: [Character], batched: Bool)
    func displayError(_ error: NSError)
}

protocol CharactersListViewOutput {
    func loadContentIfNeeded(forced: Bool)
    func loadNextBatch()
    func prepareContent(batched: Bool, origin: [Character]?, items: [Character]) -> [Character]
    func showCharacterDetail(characterId: Int)
}

protocol CharactersListInteractorInput {
    func loadItems(offset: Int, limit: Int)
}

protocol CharactersListInteractorOutput: class {
    func updateItems(items: [Character]?, error: NSError?)
}

protocol CharactersListRouterInput {
    func showCharacterDetail(characterId: Int)
}
