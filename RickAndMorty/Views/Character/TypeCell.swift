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

  @IBOutlet weak var viewStatus: UIStackView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    selectionStyle = .none
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func bindData(item: RMCharacter) {
    location.text = item.location?.name ?? "Unknown"
    type.text = item.type ?? "Unknown"
    gender.text = item.gender ?? "Unknown"
    status.text = item.status ?? "Unknown"
    spceies.text = item.species ?? "Unknown"
    origin.text = item.origin?.name ?? "Unknown"
  }

}
