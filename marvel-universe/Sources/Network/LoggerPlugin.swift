//
//  LoggerPlugin.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/4/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import Foundation
import Moya

struct LoggerPlugin {
    
    static let jsonPlugin = NetworkLoggerPlugin(verbose: true) { data in
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data
        }
    }
}
