//
//  ViewController.swift
//  RickAndMorty
//
//  Created by namnl on 29/03/2023.
//

import UIKit

class MainViewController: UITabBarController {

    let customNavBar = CustomNavigationBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let characterVC = CharacterViewController()
        characterVC.title = "Character"
        characterVC.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
        let nav1 = UINavigationController(rootViewController: characterVC)
        nav1.navigationBar.backgroundColor = .white
        
        let locationVC  = LocationViewController()
        locationVC.title = "Location"
        locationVC.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "person"), tag: 1)
        let nav2 = UINavigationController(rootViewController: locationVC)
       
       
        
        self.viewControllers = [nav1, nav2]
        
    }


}

