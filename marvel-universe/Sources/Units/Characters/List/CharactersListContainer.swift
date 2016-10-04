//
//  CharactersListContainer.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/4/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import Swinject

class CharactersListContainer: AssemblyType {
    
    func assemble(container: Container) {
        container.register(CharactersListRouterInput.self) { _ in
            CharactersListRouter()
        }
        container.register(CharactersListInteractorInput.self) { _ in
            CharactersListInteractor()
        }
        container.register(CharactersListViewInput.self) { r in
            let view = CharactersListViewController()
            let presenter = r.resolve(CharactersListViewOutput.self)!
            view.output = presenter
            return view
        }
        container.register(CharactersListViewOutput.self) { r in
            let router = r.resolve(CharactersListRouterInput.self)
            let presenter = CharactersListPresenter()
            let interactor = r.resolve(CharactersListInteractorInput.self)!
            presenter.router = router
            presenter.interactor = interactor
            (interactor as? CharactersListInteractor)!.output = presenter
            return presenter
        }
        .initCompleted { (r, output) in
            let presenter = output as? CharactersListPresenter
            presenter!.view = r.resolve(CharactersListViewInput.self)
        }
    }
}
