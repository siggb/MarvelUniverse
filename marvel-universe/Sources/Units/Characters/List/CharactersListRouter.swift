//
//  CharactersListRouter.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/4/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharactersListRouter: CharactersListRouterInput {
    
    func showCharacterDetail(characterId: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.navigationController?.pushViewController(CharacterDetailViewController(), animated: true)
    }
}
