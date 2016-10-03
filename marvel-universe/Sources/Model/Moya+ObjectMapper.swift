//
//  Moya+ObjectMapper.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

public extension Response {
    public func mapObject<T: Mappable>(_ type: T.Type) throws -> T {
        guard let object = Mapper<T>().map(JSONObject: try mapJSON()) else {
            throw Error.jsonMapping(self)
        }
        return object
    }
    
    public func mapArray<T: Mappable>(_ type: T.Type) throws -> [T] {
        guard let objects = Mapper<T>().mapArray(JSONObject: try mapJSON()) else {
            throw Error.jsonMapping(self)
        }
        return objects
    }
}
