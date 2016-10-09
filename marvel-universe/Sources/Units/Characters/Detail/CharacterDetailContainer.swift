//
//  CharacterDetailContainer.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/6/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import Swinject

class CharacterDetailContainer: AssemblyType {
    
    func assemble(container: Container) {
        container.register(CharacterDetailRouterInput.self) { _ in
            CharacterDetailRouter()
        }
        container.register(CharacterDetailInteractorInput.self) { _ in
            CharacterDetailInteractor()
        }
        container.register(CharacterDetailViewInput.self) { r in
            let view = CharacterDetailViewController()
            let presenter = r.resolve(CharacterDetailViewOutput.self)!
            view.output = presenter
            return view
        }
        container.register(CharacterDetailViewOutput.self) { r in
            let router = r.resolve(CharacterDetailRouterInput.self)
            let presenter = CharacterDetailPresenter()
            let interactor = r.resolve(CharacterDetailInteractorInput.self)!
            presenter.router = router
            presenter.interactor = interactor
            (interactor as? CharacterDetailInteractor)!.output = presenter
            return presenter
        }
        .initCompleted { (r, output) in
            let presenter = output as? CharacterDetailPresenter
            presenter!.view = r.resolve(CharacterDetailViewInput.self)
        }
        container.register(CharacterDetailViewInput.self) { (r, character: Character) in
            let detailVC = r.resolve(CharacterDetailViewInput.self) as? CharacterDetailViewController
            detailVC!.dataSource.item = character
            return detailVC!
        }
    }
}
