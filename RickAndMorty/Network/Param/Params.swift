//
//  Params.swift
//  QRYTe
//
//  Created by nguyen tam on 8/27/19.
//  Copyright © 2019 VuNM. All rights reserved.
//

import Foundation
import ObjectMapper

class CharacterParam: Mappable {
  var name: String?
  var status: String?
  var species: String?
  var type: String?
  var gender: String?
  var page: Int?

  init(){}
  required init?(map: Map) {}

  func mapping(map: Map) {
    name <- map["name"]
    status <- map["status"]
    species <- map["species"]
    type <- map["type"]
    gender <- map["gender"]
    page <- map["page"]
  }
}

