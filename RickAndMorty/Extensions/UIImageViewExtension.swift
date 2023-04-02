//
//  UIImageViewExtension.swift
//  RickAndMorty
//
//  Created by namnl on 01/04/2023.
//

import UIKit

extension UIImageView {
  func loadFromUrl(URLAddress: String) {
    guard let url = URL(string: URLAddress) else {
      return
    }
    Helper.Logger("asdasdasd")
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
