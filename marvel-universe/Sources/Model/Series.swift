//
//  Series.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import ObjectMapper

class Series: Mappable {
    var name: String?
    var resourceURI: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        name <- map["name"]
        resourceURI <- map["resourceURI"]
    }
}
