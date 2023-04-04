//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by namnl on 03/04/2023.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet var characterImage: UIImageView!
    
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterStatus: UILabel!
    @IBOutlet var characterLocation: UILabel!
    @IBOutlet var characterFirstSeen: UILabel!
    
    init(characterImage: UIImageView!, characterName: UILabel!, characterStatus: UILabel!, characterLocation: UILabel!, characterFirstSeen: UILabel!) {
        self.characterImage = characterImage
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterLocation = characterLocation
        self.characterFirstSeen = characterFirstSeen
        super.init(nibName: "CharacterDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail Character"
        // Do any additional setup after loading the view.
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
