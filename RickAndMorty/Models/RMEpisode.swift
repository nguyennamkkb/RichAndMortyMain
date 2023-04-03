//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by cvcuong on 03/04/2023.
//

import Foundation
import ObjectMapper

class RMEpisode: Mappable {
    var id: Int?
    var name: String?
    var airDate: String?
    var episode: String?
    var characters: [String]?
    var url: String?
    var created: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        airDate <- map["airDate"]
        episode <- map["episode"]
        characters <- map["characters"]
        url <- map["url"]
        created <- map["created"]
    }
    
}
