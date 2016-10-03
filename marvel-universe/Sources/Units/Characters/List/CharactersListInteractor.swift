//
//  CharactersListInteractor.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Moya

class CharactersListInteractor: NSObject, CharactersListInteractorInput {

    var presenter: CharactersListInteractorOutput?
    var provider = CharactersProvider
    
    func loadItems() {
        provider.request(.list) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    let items = try response.mapArray(Character.self)
                    self?.presenter?.updateItems(items: items, error: nil)
                } catch {
                    self?.presenter?.updateItems(items: nil, error: NSError())
                }
            case let .failure(error):
                self?.presenter?.updateItems(items: nil, error: error as NSError?)
            }
        }
    }
}
