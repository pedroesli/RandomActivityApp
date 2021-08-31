//
//  ViewController.swift
//  RandomActivityApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 30/08/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        
        let a = UserData.shared
        let b = UserData.shared
        
        if a == b {
            print("aoba")
        }
        
    }
    
    @IBAction func configurationButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Configuration", bundle: nil)
        let vc =  sb.instantiateViewController(identifier: "ConfigurationView") as! ConfigurationViewController
        
        
        //navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: self)
    }
}

