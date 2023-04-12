//
//  Helper.swift
//  RickAndMorty
//
//  Created by namnl on 02/04/2023.
//

import Foundation
class Helper {
    let today = Date()

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
    static func getHours() -> String {
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        return fixLen(str: String(hours), len: 2)
    }
    static func getMinutes() -> String {
        let today = Date()
        let minutes   = (Calendar.current.component(.minute, from: today))
        return fixLen(str: String(minutes), len: 2)
    }
    static func fixLen(str: String, len: Int) -> String {
        var strIn: String = str
        while strIn.count < len {
            strIn = "0"+strIn
        }
        return strIn
    }
}
