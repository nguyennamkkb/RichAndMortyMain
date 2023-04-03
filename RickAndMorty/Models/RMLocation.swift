//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by namnl on 02/04/2023.
//

import Foundation
import ObjectMapper

class RMLocation: Mappable {
    
    var id: Int?
    var name: String?
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
    init(){}
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        name <- map["name"]
        type <- map["type"]
        dimension <- map["dimension"]
        residents <- map["residents"]
        url <- map["url"]
        created <- map["created"]
    }
    
  	
}
