//
//  CharacterDetailPresenter.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharacterDetailPresenter: CharacterDetailViewOutput, CharacterDetailInteractorOutput {

    weak var view: CharacterDetailViewInput?
    var interactor: CharacterDetailInteractorInput!
    var router: CharacterDetailRouterInput!
    
    private var state = LoadingState.downtime
    enum LoadingState {
        case downtime
        case loading
    }
    
    // MARK: - CharacterDetailViewOutput
    
    func loadContent(characterId: Int) {
        guard state == .downtime else {
            return
        }
        state = .loading
        view?.showLoadingIndicator()
        interactor.loadInfo(characterId: characterId)
    }
    
    func goBack() {
        router.goBackToCharactersList()
    }
    
    // MARK: - CharacterDetailInteractorOutput
    
    func updateInfo(item: Character?, error: NSError?) {
        defer {
            state = .downtime
        }
        view?.hideLoadingIndicator()
        if let error = error {
            view?.displayError(error)
        } else if let item = item {
            view?.displayContent(item)
        }
    }
}
