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
    var urlImage: String = ""
    var objCharacter: RMCharacter = RMCharacter()
    init(item: RMCharacter) {
        self.objCharacter = item
        super.init(nibName: "CharacterDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = objCharacter.name ?? ""
        characterImage.kf.setImage(with: URL(string: objCharacter.image ?? ""))
        characterName.text = objCharacter.name ?? ""
        characterStatus.text = "\(objCharacter.status ?? "unknown") - \(objCharacter.species ?? "unknown")"
        characterLocation.text = objCharacter.location?.name ?? ""
        characterFirstSeen.text = "Earth"
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
