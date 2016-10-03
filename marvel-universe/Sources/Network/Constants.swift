//
//  Constants.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import CryptoSwift

struct ApiCreditionals {
    static let scheme = "https://"
    static let domain = "gateway.marvel.com"
    static let timestamp = "1"
    static let publicKey = "11acd51d521035b2468cdba537720e69"
    static let privateKey = "ff9d484676376b7b71c0e6b71df26a6bfa170d87"
    static let hash = "\(timestamp)\(privateKey)\(publicKey)".md5()
}

struct ApiEndpoints {
    static let path = "/v1/public/"
    static let characters = "characters"
    static let characterInfo = "character/%@"
    static let characterComics = "character/%@/comics"
    static let characterEvents = "character/%@/events"
    static let characterSeries = "character/%@/series"
    static let characterStories = "character/%@/stories"
}
