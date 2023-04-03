//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by namnl on 01/04/2023.
//

import UIKit
import ObjectMapper

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listLocations = [RMLocation]()
    var info = Info()
    @IBOutlet weak var LocationMainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationMainTable.register(LocationTableViewCell.self, forCellReuseIdentifier: "locationTableViewCell")
        LocationMainTable.dataSource = self
        LocationMainTable.delegate = self
        
        
     
        getlistLocation()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationTableViewCell", for: indexPath)  as? LocationTableViewCell else{return UITableViewCell()}
        let item = listLocations[indexPath.row]
//        print(item.toJSON())
//        print(item.name)
//        cell.name.text = "\(item.name ?? "unknown") - \(item.type ?? "unknown")"
//        cell.dimention.text = "\(item.dimension ?? "unknown")"
        
        cell.locationName.text = item.name ?? "s"
        return cell
    }
    
    func getlistLocation(){
        ServiceManager.common.getLocations(param: nil){
            (response) in
            if response?.results != nil {
                guard let locations =  Mapper<RMLocation>().mapArray(JSONObject: response?.results) else {return}
                self.listLocations = locations
                self.info = response?.info ?? Info()
                DispatchQueue.main.async {
                    self.LocationMainTable.reloadData()
                }
            } else {return}
        }
    }
    func updateNext(){
        ServiceManager.common.getMore(router: self.info.next, param: nil){
          (response) in
          if response?.results != nil {
            guard let losactions =  Mapper<RMLocation>().mapArray(JSONObject: response?.results) else {return}
            self.listLocations.append(contentsOf: losactions)
            self.info = response?.info ?? Info()
            DispatchQueue.main.async {
              self.LocationMainTable.reloadData()
            }
          } else {return}
        }
    }
    
}
