//
//  CharactersAPI.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import Moya

let CharactersProvider = MoyaProvider<MarvelCharacters>(plugins: [LoggerPlugin.jsonPlugin])

enum MarvelCharacters {
    case list(Int, Int)
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
            return String(format: ApiEndpoints.characterInfo, String(id))
        case .characterComics(let id):
            return String(format: ApiEndpoints.characterComics, String(id))
        case .characterEvents(let id):
            return String(format: ApiEndpoints.characterEvents, String(id))
        case .characterSeries(let id):
            return String(format: ApiEndpoints.characterSeries, String(id))
        case .characterStories(let id):
            return String(format: ApiEndpoints.characterStories, String(id))
        }
    }
    
    var method: Moya.Method {
        return .GET
    }
    
    var parameters: [String: Any]? {
        var dict = ["ts": ApiCreditionals.timestamp, "apikey": ApiCreditionals.publicKey, "hash": ApiCreditionals.hash]
        switch self {
        case .list(let offset, let limit):
            dict["orderBy"] = "name"
            dict["offset"] = String(offset)
            dict["limit"] = String(limit)
        default:
            break
        }
        return dict
    }
    var sampleData: Data {
        return "sample".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .request
    }
}
