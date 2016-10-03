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

class CharactersListInteractor: NSObject, CharactersListInteractorInput {

    var presenter: CharactersListInteractorOutput?
    var provider = CharactersProvider
    
    func loadItems() {
        provider.request(.list) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
                        as? [String: AnyObject]
                    if let jsonData = json?["data"] {
                        if let items = Mapper<Character>().mapArray(JSONObject: jsonData["results"]) {
                            self?.presenter?.updateItems(items: items, error: nil)
                        } else {
                            //
                        }
                    } else {
                        //
                    }
                } catch {
                    //
                }
            case let .failure(error):
                self?.presenter?.updateItems(items: nil, error: error as NSError?)
            }
        }
    }
}
