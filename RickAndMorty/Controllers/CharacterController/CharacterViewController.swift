//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by namnl on 29/03/2023.
//

import UIKit
import ObjectMapper
import Kingfisher
class CharacterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var listCharacter = [RMCharacter]()
    var info = Info()
    var page: Int = 1
    var titleController: String?
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingScreen.shared.show()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .white
        let nib = UINib(nibName: "CharacterCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        setLayout()
        getFirstCharacters()
        LoadingScreen.shared.hide()
    }
    func setUpNavBar(){
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
        let item = listCharacter[indexPath.row]
        cell.layer.cornerRadius = 5.0
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 0.1
        
        cell.backgroundView?.layer.shadowColor = UIColor.black.cgColor
        cell.backgroundView?.layer.shadowRadius = 5
        cell.backgroundView?.layer.shadowOpacity = 1
        cell.backgroundView?.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        
        cell.nameCharacter.text = item.name
        cell.statusCharacter.text = "\(item.status ?? "unknown") - \(item.species ??  "unknown")"
        cell.imageCharacter.kf.setImage(with: URL(string: item.image ?? ""))
        
        cell.data = item
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //    print(listCharacter[indexPath.row].toJSON())
        let item = listCharacter[indexPath.row]
        let vc = CharacterDetailViewController(item: item)
        vc.hidesBottomBarWhenPushed = true
        pushVC(controller: vc)

        
    }
    func setLayout(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = screenWidth / 2 - 7.5
        let height = 300
        layout.minimumInteritemSpacing = 2.5
        layout.minimumLineSpacing = 5
        layout.itemSize.width = width
        layout.itemSize.height = CGFloat(height)
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            updateNext()
        }
    }
    func getFirstCharacters(){
        ServiceManager.common.getCharacters(param: nil){
            (response) in
            if response?.results != nil {
                guard let character =  Mapper<RMCharacter>().mapArray(JSONObject: response?.results) else {return}
                self.listCharacter = character
                self.info = response?.info ?? Info()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {return}
        }
    }
    func updateNext(){
        ServiceManager.common.getMore(router: self.info.next, param: nil){
            (response) in
            if response?.results != nil {
                guard let characters =  Mapper<RMCharacter>().mapArray(JSONObject: response?.results) else {return}
                self.listCharacter.append(contentsOf: characters)
                self.info = response?.info ?? Info()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {return}
        }
        //requests another set of data (20 more items) from the server.
        //      DispatchQueue.main.async(execute: collectionView.reloadData)
    }
    func pushVC(controller vc: UIViewController, animation anima: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: anima)
    }
    
}
