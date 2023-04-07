//
//  TypeCell.swift
//  RickAndMorty
//
//  Created by namnl on 07/04/2023.
//

import UIKit

class TypeCell: UITableViewCell {

    
    @IBOutlet var location: UILabel!
    @IBOutlet var spceies: UILabel!
    @IBOutlet var origin: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
