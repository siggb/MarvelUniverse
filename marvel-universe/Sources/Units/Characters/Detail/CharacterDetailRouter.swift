//
//  CharacterDetailRouter.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/8/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

class CharacterDetailRouter: CharacterDetailRouterInput {
    
    func goBackToCharactersList() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let _ = appDelegate.navigationController?.popViewController(animated: true)
    }
}
