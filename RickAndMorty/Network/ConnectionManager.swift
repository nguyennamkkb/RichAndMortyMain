//
//  ConnectionManager.swift
//  QRYte
//
//  Created by Nguyễn Mạnh Vũ on 10/2/20.
//  Copyright © 2020 Vimass. All rights reserved.
//

import Foundation
import UIKit

class ConnectionManager {

static let sharedInstance = ConnectionManager()
    private var reachability : Reachability!// = Reachability()

func observeReachability(){
//    self.reachability = Reachability()
    NotificationCenter.default.addObserver(self, selector:#selector(self.reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
    do {
        try self.reachability = Reachability()
        try self.reachability.startNotifier()
    }
    catch(let error) {
        print("Error occured while starting reachability notifications : \(error.localizedDescription)")
    }
}

@objc func reachabilityChanged(note: NSNotification) {
    let reachability = note.object as! Reachability
//    switch reachability.connection {
//    case .cellular:
//        print("Network available via Cellular Data.")
//        Common.isInternet = true
//        break
//    case .wifi:
//        print("Network available via WiFi.")
//        Common.isInternet = true
//        break
//    case .none:
//        print("Network is not available.")
//        Common.isInternet = false
//        break
//    case .unavailable:
//        print("Network is  unavailable.")
//        Common.isInternet = false
//        break
//    }
    
//    if UIApplication.topViewController() is BaseViewController {
//        let home = UIApplication.topViewController() as! BaseViewController
//        home.commitOff()
//    }
  }
}

