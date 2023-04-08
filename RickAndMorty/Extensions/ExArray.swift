//
//  ExArray.swift
//  RickAndMorty
//
//  Created by namnl on 09/04/2023.
//

import Foundation

extension Array {
    //Lấy item tại index đã check nil
    func itemAtIndex(index: Int) -> Element? {
        if self.count > index, index >= 0 {
            return self[index]
        } else {
            return nil
        }
    }
}

