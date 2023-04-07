//
//  CharacterImageCell.swift
//  RickAndMorty
//
//  Created by namnl on 08/04/2023.
//

import UIKit

class CharacterImageCell: UITableViewCell {

    @IBOutlet var imageCharacter: UIImageView!
    var imageString: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
