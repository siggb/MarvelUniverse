//
//  CharactersListPresenter.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharactersListPresenter: CharactersListViewOutput, CharactersListInteractorOutput {
    
    weak var view: CharactersListViewInput?
    var interactor: CharactersListInteractorInput!
    var router: CharactersListRouterInput!
    
    // MARK: - CharactersListViewOutput
    
    func loadContentIfNeeded(forced: Bool) {
        // TODO: check forced case
        view?.showLoadingIndicator()
        interactor.loadItems()
    }
    
    func showCharacterDetail(characterId: Int) {
        router.showCharacterDetail(characterId: characterId)
    }
    
    // MARK: - CharactersListInteractorOutput
    
    func updateItems(items: [Character]?, error: NSError?) {
        view?.hideLoadingIndicator()
        if let error = error {
            view?.displayError(error)
        } else if let items = items {
            view?.displayContent(items)
        }
    }
}
