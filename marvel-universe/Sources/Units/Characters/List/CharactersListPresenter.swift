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
    
    private var isFirstLoading = true
    private var state = LoadingState.downtime
    private var offset = 0
    private let limit = 10
    
    enum LoadingState {
        case downtime
        case loading
        case batchLoading
    }
    
    // MARK: - CharactersListViewOutput
    
    func loadContentIfNeeded(forced: Bool) {
        guard state == .downtime else {
            return
        }
        guard isFirstLoading || forced else {
            return
        }
        state = .loading
        offset = 0
        view?.showLoadingIndicator()
        interactor.loadItems(offset: offset, limit: limit)
    }
    
    func loadNextBatch() {
        guard state == .downtime else {
            return
        }
        state = .batchLoading
        view?.showLoadingIndicator()
        interactor.loadItems(offset: offset, limit: limit)
    }
    
    func prepareContent(batched: Bool, origin: [Character]?, items: [Character]) -> [Character] {
        guard batched else {
            return items
        }
        guard let origin = origin else {
            return items
        }
        return [origin, items].flatMap{ $0 }
    }
    
    func showCharacterDetail(characterId: Int) {
        router.showCharacterDetail(characterId: characterId)
    }
    
    // MARK: - CharactersListInteractorOutput
    
    func updateItems(items: [Character]?, error: NSError?) {
        defer {
            state = .downtime
        }
        view?.hideLoadingIndicator()
        if let error = error {
            view?.displayError(error)
        } else if let items = items {
            if isFirstLoading {
                isFirstLoading = false
            }
            offset += limit + 1
            view?.displayContent(items, batched: state == .batchLoading)
        }
    }
}
