//
//  CharacterDetailProtocols.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

protocol CharacterDetailViewInput: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayContent(_ item: Character)
    func displayError(_ error: NSError)
}

protocol CharacterDetailViewOutput {
    func loadContent(characterId: Int)
    func goBack()
}

protocol CharacterDetailInteractorInput {
    func loadInfo(characterId: Int)
}

protocol CharacterDetailInteractorOutput: class {
    func updateInfo(item: Character?, error: NSError?)
}

protocol CharacterDetailRouterInput {
    func goBackToCharactersList()
}
