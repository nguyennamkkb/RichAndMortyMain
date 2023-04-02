//
//  ViewController.swift
//  RickAndMorty
//
//  Created by namnl on 29/03/2023.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let characterVC = CharacterViewController()
        characterVC.titleController = "Character"
        characterVC.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
    
        
        let locationVC  = LocationViewController()
        locationVC.title = "Location"
        locationVC.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "person"), tag: 1)
        
        self.viewControllers = [characterVC, locationVC]
        
    }


}

