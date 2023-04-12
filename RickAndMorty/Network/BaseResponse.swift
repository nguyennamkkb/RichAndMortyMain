//
//  BaseResponse.swift
//  QRYTe
//
//  Created by nguyen tam on 8/27/19.
//  Copyright © 2019 VuNM. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    var info: Info?
    var results: Any?
    var error: String?
    init() {
        
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        info <- map["info"]
        results <- map["results"]
        error <- map["error"]
    }
}

class Info: Mappable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
    
    init() {
    }
    
  required init?(map: Map) {
      mapping(map: map)
  }
    func mapping(map: Map) {
        count <- map["count"]
        pages <- map["pages"]
        next <- map["next"]
        prev <- map["prev"]
    }
}


