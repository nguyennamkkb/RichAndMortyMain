//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by namnl on 01/04/2023.
//

import UIKit
import ObjectMapper

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var isLoading = false
    var listLocations = [RMLocation]()
    var info = Info()
    @IBOutlet weak var LocationMainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LocationCell", bundle: nil)
        LocationMainTable.register(nib, forCellReuseIdentifier: "LocationCell")
        LocationMainTable.dataSource = self
        LocationMainTable.delegate = self
        getlistLocation()
        print("Location")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)  as? LocationCell else { return UITableViewCell()}
        let item = listLocations[indexPath.row]
        cell.locationName.text = "\(item.name ?? "unknown") - \(item.type ?? "unknown")"
        cell.dimensionName.text = "\(item.dimension ?? "unknown")"
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == listLocations.count - 10, !isLoading {
            updateNext()
        }
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
