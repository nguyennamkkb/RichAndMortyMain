//
//  Helper.swift
//  RickAndMorty
//
//  Created by namnl on 02/04/2023.
//

import Foundation

class Helper {
    static func Logger (_ str: String){
        print("Nam: \(str)")
    }
    static func getParamFromDirectory(item: [String:String]) -> String {
        var param: String = ""
        for (key, value) in item {
            if value != "" {
                param.append(key+"="+value+"&")
            }
        }
        return param
    }
}
