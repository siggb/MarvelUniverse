//
//  Character.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import ObjectMapper

class Character: Mappable {
    var id: Int?
    var name: String?
    var description: String?
    var modified: Date?
    var resourceURI: String?
    var thumbnail: Thumbnail?
    var comics: [Comic]?
    var stories: [Story]?
    var events: [Event]?
    var series: [Series]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        modified <- map["modified"]
        resourceURI <- map["resourceURI"]
        thumbnail <- map["thumbnail"]
        comics <- map["comics.items"]
        stories <- map["stories.items"]
        events <- map["events.items"]
        series <- map["series.items"]
    }
}
