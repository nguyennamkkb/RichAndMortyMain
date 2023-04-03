//
//  NamCell1.swift
//  RickAndMorty
//
//  Created by cvcuong on 03/04/2023.
//

import UIKit

class LocationCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var dimensionName: UILabel!
    @IBOutlet weak var locationName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
