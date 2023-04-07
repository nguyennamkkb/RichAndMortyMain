//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by namnl on 05/04/2023.
//

import UIKit

class CharacterDetailViewController: UIViewController,UINavigationControllerDelegate {

    var item: RMCharacter = RMCharacter()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    init(item: RMCharacter){
        self.item = item
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
