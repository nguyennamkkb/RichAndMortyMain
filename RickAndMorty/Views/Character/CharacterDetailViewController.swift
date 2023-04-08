//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by namnl on 05/04/2023.
//

import UIKit

class CharacterDetailViewController: UIViewController,UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITableViewDataSource , UITableViewDelegate  {
    
    
    
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameCharacter: UILabel!
    var item: RMCharacter = RMCharacter()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        tableView.delegate = self
        tableView.dataSource = self
        self.nameCharacter.text = item.name ?? ""
        let nib1 = UINib(nibName: "CharacterImageCell", bundle: .main)
        tableView.register(nib1, forCellReuseIdentifier: "CharacterImageCell")
        let nib = UINib(nibName: "TypeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "TypeCell")
        
        
        
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
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterImageCell", for: indexPath) as? CharacterImageCell else {return UITableViewCell()}
            cell.imageCharacter.kf.setImage(with: URL(string: item.image ?? ""))
            
            return cell
        }
        else{

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath) as? TypeCell else {return UITableViewCell()}
            cell.bindData(item: item)
            return cell
        }
    }
}
