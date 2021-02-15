//
//  ResultViewController.swift
//  MathGameAPP
//
//  Created by 井関竜太郎 on 2021/02/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    var point = 0
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var hightScorre: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordLabel.text = "あなたの得点は\(point)"
        UserDefaults.standard.register(defaults: ["record":0])
        let heightScore = UserDefaults.standard.integer(forKey: "record")
        if heightScore < point {
            UserDefaults.standard.setValue(point, forKey: "record")
        }else{
            hightScorre.text = "最高得点\(point)"
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        //始め戻る
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}
