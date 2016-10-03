//
//  CharactersAPI.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

let CharactersProvider = MoyaProvider<MarvelCharacters>(plugins:
    [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)]
)

enum MarvelCharacters {
    case list
    case characterInfo(Int)
    case characterComics(Int)
    case characterEvents(Int)
    case characterSeries(Int)
    case characterStories(Int)
}

extension MarvelCharacters: TargetType {
    var baseURL: URL {
        return URL(string: "\(ApiCreditionals.scheme)\(ApiCreditionals.domain)\(ApiEndpoints.path)")!
    }
    
    var path: String {
        switch self {
        case .list:
            return ApiEndpoints.characters
        case .characterInfo(let id):
            return String(format: ApiEndpoints.characterInfo, id)
        case .characterComics(let id):
            return String(format: ApiEndpoints.characterComics, id)
        case .characterEvents(let id):
            return String(format: ApiEndpoints.characterEvents, id)
        case .characterSeries(let id):
            return String(format: ApiEndpoints.characterSeries, id)
        case .characterStories(let id):
            return String(format: ApiEndpoints.characterStories, id)
        }
    }
    
    var method: Moya.Method {
        return .GET
    }
    
    var parameters: [String: Any]? {
        return ["ts": ApiCreditionals.timestamp, "apikey": ApiCreditionals.publicKey, "hash": ApiCreditionals.hash]
    }
    var sampleData: Data {
        return "sample".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .request
    }
}
