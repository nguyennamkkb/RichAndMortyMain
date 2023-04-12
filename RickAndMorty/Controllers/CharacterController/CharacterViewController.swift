//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by namnl on 29/03/2023.
//

import UIKit
import ObjectMapper
import Kingfisher
import DropDown
class CharacterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var viewSearch: UIView!
    var listCharacter = [RMCharacter]()
    var info = Info()
    var page: Int = 1
    var titleController: String?
    
    let dropdownStatus = DropDown()
    let dropdownSpecies = DropDown()
    let dropdownType = DropDown()
    let dropDodropdownGenderwn = DropDown()
    var viewSearchHeight: Int = 0
    var filterIsExpanded: Int = 0
    @IBOutlet var collectionView: UICollectionView!
    
    let dropDownStatus = DropDown()
    let dropDownGender = DropDown()
    @IBOutlet var textFieldNameSearch: UITextField!
    
    @IBOutlet var viewNav: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSearchHeight = Int(viewSearch.frame.size.height)
        LoadingScreen.shared.show()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.viewSearch.isHidden = true
        view.backgroundColor = .white
        let nib = UINib(nibName: "CharacterCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        setLayout()
        getFirstCharacters()
        LoadingScreen.shared.hide()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
    
    @IBAction func selectStatus(_ sender: UIButton) {
        dropdownStatus.dataSource = ["Alive", "Dead", "unknown"]
        dropdownStatus.anchorView = sender //5
        dropdownStatus.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropdownStatus.show() //7
        dropdownStatus.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        }
    }
    
    @IBAction func selectSpecies(_ sender: UIButton) {
        dropdownStatus.dataSource = ["Alive", "Dead", "unknown"]
        dropdownStatus.anchorView = sender //5
        dropdownStatus.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropdownStatus.show() //7
        dropdownStatus.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        }
    }
    
    @IBAction func selectType(_ sender: UIButton) {
        dropdownStatus.dataSource = ["Alive", "Dead", "unknown"]
        dropdownStatus.anchorView = sender //5
        dropdownStatus.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropdownStatus.show() //7
        dropdownStatus.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        }
    }
    
    @IBAction func selectGender(_ sender: UIButton) {
        dropdownStatus.dataSource = ["Female", "Female","Female", "unknown"]
        dropdownStatus.anchorView = sender //5
        dropdownStatus.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropdownStatus.show() //7
        dropdownStatus.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        }
    }
    @IBAction func selectFilter(_ sender: UIButton) {
        filterIsExpanded = filterIsExpanded == 1 ? 0 : 1
        UIView.animate(withDuration: 0.2) {
            self.viewSearch.alpha = CGFloat(self.filterIsExpanded)
            self.viewSearch.isHidden = (self.filterIsExpanded != 1)
        }
        
    }
    
    @IBAction func bntSelectType(_ sender: UIButton) {
        dropDownStatus.dataSource = ["alive", "dead", "unknown"]//4
        dropDownStatus.anchorView = sender //5
        dropDownStatus.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDownStatus.show() //7
        dropDownStatus.selectionAction = { [weak self] (index: Int, item: String) in //8
             guard let _ = self else { return }
             sender.setTitle(item, for: .normal) //9
           }
    }
    
    @IBAction func bntSelectGender(_ sender: UIButton) {
        dropDownGender.dataSource = ["female", "male", "genderless", "unknown"]//4
        dropDownGender.anchorView = sender //5
        dropDownGender.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDownGender.show() //7
        dropDownGender.selectionAction = { [weak self] (index: Int, item: String) in //8
             guard let _ = self else { return }
             sender.setTitle(item, for: .normal) //9
           }
    }
    
    @IBAction func btnSearch(_ sender: UIButton) {
        print("Search")
        let name = textFieldNameSearch.text ?? nil
        
        let param = CharacterParam()
        param.status = dropDownStatus.selectedItem ?? nil
        param.gender = dropDownGender.selectedItem ?? nil
        param.name = name
        
        let paramRequest = Helper.getParamFromDirectory(item: param.toJSON())
        
        print(paramRequest)
        ServiceManager.common.getFilterCharacters(param: paramRequest){
            (response) in
            if response?.results != nil {
        
                guard let character =  Mapper<RMCharacter>().mapArray(JSONObject: response?.results) else {return}
                self.listCharacter = character
                self.info = response?.info ?? Info()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {
                self.listCharacter = []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
}
