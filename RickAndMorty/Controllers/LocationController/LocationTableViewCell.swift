//
//  LocationTableViewCell.swift
//  RickAndMorty
//
//  Created by namnl on 02/04/2023.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var dimention: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  
}
