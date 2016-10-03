//
//  CharactersListPresenter.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharactersListPresenter: NSObject, CharactersListViewOutput, CharactersListInteractorOutput {
    
    var interactor: CharactersListInteractorInput?
    var view: CharactersListViewInput?
    
    // MARK: - CharactersListViewOutput
    
    func loadContentIfNeeded(forced: Bool) {
        // TODO: check forced case
        interactor?.loadItems()
    }
    
    // MARK: - CharactersListInteractorOutput
    
    func updateItems(items: [Character]?, error: NSError?) {
        if let error = error {
            view?.displayError(error)
        } else if let items = items {
            view?.displayContent(items)
        }
    }
}
