//
//  Thumbnail.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import ObjectMapper

class Thumbnail: Mappable {
    var path: String?
    var fileExtension: String?
    
    var largeImageURL: URL? {
        guard let fpath = self.path, let fextension = self.fileExtension else {
            return nil
        }
        return URL(string: "\(fpath).\(fextension)")
    }
    var smallImageURL: URL? {
        guard let fpath = self.path, let fextension = self.fileExtension else {
            return nil
        }
        return URL(string: "\(fpath)/standard_xlarge.\(fextension)")
    }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        path <- map["path"]
        fileExtension <- map["extension"]
    }
}
