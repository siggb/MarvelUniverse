//
//  CharacterDetailInteractor.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/2/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class CharacterDetailInteractor: CharacterDetailInteractorInput {

    weak var output: CharacterDetailInteractorOutput?
    
    func loadInfo(characterId: Int) {
        CharactersProvider.request(.characterInfo(characterId)) { [weak self] result in
            switch result {
            case let .success(response):
                let mappingFailure = {
                    let error = NSError(domain: "Error recieved during mapping process", code: 401, userInfo: nil)
                    self?.output?.updateInfo(item: nil, error: error)
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
                        as? [String: AnyObject]
                    if let jsonData = json?["data"] {
                        if let items = Mapper<Character>().mapArray(JSONObject: jsonData["results"]!),
                            let item = items.first {
                            self?.output?.updateInfo(item: item, error: nil)
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
                self?.output?.updateInfo(item: nil, error: error as NSError)
            }
        }
    }
}
