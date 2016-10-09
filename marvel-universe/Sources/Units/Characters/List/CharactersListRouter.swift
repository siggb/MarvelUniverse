//
//  CharactersListRouter.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/4/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Swinject

class CharactersListRouter: CharactersListRouterInput {
    
    func showCharacterDetail(character: Character) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let detailVC = appDelegate.assembler?.resolver.resolve(CharacterDetailViewInput.self, argument: character)
            as? CharacterDetailViewController
        appDelegate.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
