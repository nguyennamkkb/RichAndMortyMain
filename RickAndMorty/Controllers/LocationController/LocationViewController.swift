//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by namnl on 01/04/2023.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var listLocations = RMLocation

  @IBOutlet weak var LocationMainTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
      LocationMainTable.delegate = self
      LocationMainTable.dataSource = self
        // Do any additional setup after loading the view.
    }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let
  }

}
