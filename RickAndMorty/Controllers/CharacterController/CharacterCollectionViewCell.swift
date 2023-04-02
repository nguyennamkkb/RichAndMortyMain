//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by namnl on 29/03/2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    var data = RMCharacter()
    @IBOutlet var imageCharacter: UIImageView!
    @IBOutlet var nameCharacter: UILabel!
    @IBOutlet var statusCharacter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}
