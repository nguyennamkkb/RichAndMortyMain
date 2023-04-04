//
//  UIImageViewExtension.swift
//  RickAndMorty
//
//  Created by namnl on 01/04/2023.
//

import UIKit


//UIImageView
extension UIImageView {
    
}

//String
extension String {
    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }
        
        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]
        
        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }
}
//Double
extension Double {
    func rounded(toPlaces places:Int) -> String {
        let divisor = pow(10.0, Double(places))
        var returnValue = "\((self * divisor).rounded() / divisor)"
        if(returnValue.split(separator: ".")[1].count == 1 && places > 1) {
            returnValue += "0"
        }
        return returnValue
    }
}

//Date
extension Date {
    func getCurrentDate(_ format: String = "dd/MM/yyyy HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: Date())
    }
}
