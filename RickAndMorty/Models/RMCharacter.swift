//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by namnl on 01/04/2023.
//

import Foundation
import ObjectMapper

class RMCharacter: Mappable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: Origin?
    var location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
    
    init() {}
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        status <- map["status"]
        species <- map["species"]
        type <- map["type"]
        
        gender <- map["gender"]
        origin <- map["origin"]
        location <- map["location"]
        image <- map["image"]
        episode <- map["episode"]
        url <- map["url"]
        created <- map["created"]
        
    }
    
}
class Location: Mappable {
    var name: String?
    var url: String?
    
    init(){}
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}

class Origin: Mappable {
    var name: String?
    var url: String?
    init(){}
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}

