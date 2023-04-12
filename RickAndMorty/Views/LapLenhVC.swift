//
//  LapLenhVC.swift
//  RickAndMorty
//
//  Created by namnl on 12/04/2023.
//

import UIKit

class LapLenhVC: UIViewController {
    
    @IBOutlet var moneyTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTF.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCopy(_ sender: UIButton) {
        showAlert(mess: moneyTF.text)
    }
    
    @IBAction func bntLayOTP(_ sender: UIButton) {
        var otp: String = ""
        let url = URL(string: "http://113.190.248.142:58080/autobank/services/smsOTP/testxxx?f=0917951277&p=thuhavoyeu")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let code: String = (String(data: data, encoding: .utf8)!)
            let start = code.index(code.startIndex, offsetBy: 145)
            let end = code.index(code.startIndex, offsetBy: 152)
            let range = start...end
            let newString = String(code[range])
            otp = newString

            
            
        }

        task.resume()
        showAlert(mess: otp)
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
    
}
