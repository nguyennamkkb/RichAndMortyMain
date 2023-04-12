//
//  LapLenhVC.swift
//  RickAndMorty
//
//  Created by namnl on 12/04/2023.
//

import UIKit

class LapLenhVC: UIViewController {
    
    @IBOutlet var moneyTF: UITextField!
    var strCopy: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTF.text = ""
        // Do any additional setup after loading the view.
    }
    @IBAction func editChangeText(_ sender: UITextField) {
        strCopy = moneyTF.text ?? ""
    }
    
    @IBAction func btnCopy(_ sender: UIButton) {
        showAlert(mess: moneyTF.text)
    }
    
    @IBAction func bntLayOTP(_ sender: UIButton) {
        makeHTTPRequest(url: "http://113.190.248.142:58080/autobank/services/smsOTP/testxxx?f=0917951277&p=thuhavoyeu") { responseString in
            if let responseString = responseString {
                DispatchQueue.main.sync {
                    let code: String = responseString
                    let start = code.index(code.startIndex, offsetBy: 145)
                    let end = code.index(code.startIndex, offsetBy: 150)
                    let range = start...end
                    let newString = String(code[range])
                    self.showAlert(mess: newString)
                }
            } else {
                print("Error: Failed to get response string.")
            }
        }
    }
    
    func showAlert(mess: String?){
        UIPasteboard.general.string = mess ?? ""
        print(mess ?? "")
        let alert = UIAlertController(title: "copied", message: mess ?? "", preferredStyle: .alert)
        self.present(alert, animated: true)
        
        let dismissTime = DispatchTime.now() + 1
        let dismissAlert = DispatchWorkItem { alert.dismiss(animated: true) }
        DispatchQueue.main.asyncAfter(deadline: dismissTime, execute: dismissAlert)
    }
    func makeHTTPRequest(url: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                completion(responseString)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    @IBAction func btnCopyMK(_ sender: UIButton) {
        UIPasteboard.general.string = "clskaoe#676%ZALBWQW"
    }
    
    @IBAction func btnGetContent(_ sender: UIButton) {
        let title = sender.titleLabel?.text ?? ""
        let time = Helper.getHours()+Helper.getMinutes()
        let str = "\(title) \(time)"
        showAlert(mess: str)
    }
}
