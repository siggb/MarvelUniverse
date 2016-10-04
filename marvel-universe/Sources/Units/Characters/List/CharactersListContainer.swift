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
        container.register(CharactersListRouterInput.self) { r in
            CharactersListRouter()
        }
        container.register(CharactersListInteractorInput.self) {  (r, presenter: CharactersListInteractorOutput) in
            let interactor = CharactersListInteractor()
            interactor.output = presenter
            return interactor
        }
        container.register(CharactersListViewOutput.self) { (r, view: CharactersListViewInput) in
            let presenter = CharactersListPresenter()
            let interactor = r.resolve(CharactersListInteractorInput.self, argument: presenter)!
            let router = r.resolve(CharactersListRouterInput.self)
            presenter.router = router
            presenter.interactor = interactor
            presenter.view = view
            return presenter
        }
        container.register(CharactersListViewInput.self) { r in
            let view = CharactersListViewController()
            let presenter = r.resolve(CharactersListViewOutput.self, argument: view)!
            view.output = presenter
            return view
        }
    }
}
