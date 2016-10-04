//
//  CharactersListInteractor.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class CharactersListInteractor: CharactersListInteractorInput {
    
    weak var output: CharactersListInteractorOutput?
    
    func loadItems() {
        CharactersProvider.request(.list) { [weak self] result in
            switch result {
            case let .success(response):
                let mappingFailure = {
                    let error = NSError(domain: "Error recieved during mapping process", code: 401, userInfo: nil)
                    self?.output?.updateItems(items: nil, error: error)
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
                        as? [String: AnyObject]
                    if let jsonData = json?["data"] {
                        if let items = Mapper<Character>().mapArray(JSONObject: jsonData["results"]) {
                            self?.output?.updateItems(items: items, error: nil)
                        } else {
                            mappingFailure()
                        }
                    } else {
                        mappingFailure()
                    }
                } catch {
                    mappingFailure()
                }
            case let .failure(error):
                self?.output?.updateItems(items: nil, error: error as NSError)
            }
        }
    }
}
