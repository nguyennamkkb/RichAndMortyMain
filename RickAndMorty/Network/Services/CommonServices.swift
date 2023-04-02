//
//  CommonService.swift
//  QRYTe
//
//  Created by nguyen tam on 8/26/19.
//  Copyright © 2019 VuNM. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

fileprivate class ListCommonService {
  static let CHARACTER = ServiceManager.ROOT + "character"
  static let LOCATION = ServiceManager.ROOT + "location"
}

fileprivate enum ECommonURLs {
  case character
  case location


  func getPath() -> String {
    switch self {
    case .character:
      return ListCommonService.CHARACTER

    case .location:
      return ListCommonService.LOCATION
    }
  }

}
class CommonServices {


  // dang nhap

  //LoginVParam

  func getCharacters(param: CharacterParam?, completion: @escaping (_ reponse: BaseResponse?) -> Void) {
    let router = ECommonURLs.character

    if !ServiceManager.isConnectedToInternet() {
      completion(nil)
    }
    BaseNetWorking.shared.requestData(fromURl: router.getPath(), method: .get, parameter: nil) { (success, result, error) in
      if success {
        if result != nil {
          if let baseResponse = Mapper<BaseResponse>().map(JSONObject: result) {
            completion(baseResponse)
          }
        }else{
          completion(nil)
        }
      } else {
        completion(nil)
      }
    }
  }
  func getMore(router: String?, param: CharacterParam?, completion: @escaping (_ reponse: BaseResponse?) -> Void) {
    if !ServiceManager.isConnectedToInternet() {
      completion(nil)
    }
    BaseNetWorking.shared.requestData(fromURl: router ?? "", method: .get, parameter: nil) { (success, result, error) in
      if success {
        if result != nil {
          if let baseResponse = Mapper<BaseResponse>().map(JSONObject: result) {
            completion(baseResponse)
          }
        }else{
          completion(nil)
        }
      } else {
        completion(nil)
      }
    }
  }
  func getLocations(param: CharacterParam?, completion: @escaping (_ reponse: BaseResponse?) -> Void) {
    let router = ECommonURLs.location
    if !ServiceManager.isConnectedToInternet() {
      completion(nil)
    }
    BaseNetWorking.shared.requestData(fromURl: router.getPath(), method: .get, parameter: nil) { (success, result, error) in
      if success {
        if result != nil {
          if let baseResponse = Mapper<BaseResponse>().map(JSONObject: result) {
            completion(baseResponse)
          }
        }else{
          completion(nil)
        }
      } else {
        completion(nil)
      }
    }
  }

}




