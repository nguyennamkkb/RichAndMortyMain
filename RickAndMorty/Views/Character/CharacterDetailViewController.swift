//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by namnl on 05/04/2023.
//

import UIKit

class CharacterDetailViewController: UIViewController,UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITableViewDataSource , UITableViewDelegate  {
    
    
    
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var imageCharacter: UIImageView!
    @IBOutlet var nameCharacter: UILabel!
    var item: RMCharacter = RMCharacter()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        tableView.delegate = self
        tableView.dataSource = self
        self.nameCharacter.text = item.name ?? ""
        self.imageCharacter.kf.setImage(with: URL(string: item.image ?? ""))
        let nib = UINib(nibName: "TypeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "TypeCell")
        tableView.rowHeight = 400


    }
    init(item: RMCharacter){
        self.item = item
        super.init(nibName: nil, bundle: nil)
        
    }
    
    @IBAction func BacktoMainCharacter(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath) as? TypeCell else {return UITableViewCell()}
        cell.location.text = item.location?.name ?? "Unknown"
        cell.type.text = item.type ?? "Unknown"
        cell.gender.text = item.gender ?? "Unknown"
        cell.status.text = item.status ?? "Unknown"
        cell.spceies.text = item.species ?? "Unknown"
        cell.origin.text = item.origin?.name ?? "Unknown"
        return cell
    }
}
