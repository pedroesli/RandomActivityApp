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
        
        let testFilters = TypeFilter(array: [false, false, true, true, true, false, false, true, true])
        
        UserData.saveFilters(filter: testFilters)
        
        let a = UserData.getFilters()
        
        let data = a.getValuesAsBool()
        
        print(data as Any)
        
    }
    
    @IBAction func configurationButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Configuration", bundle: nil)
        let vc =  sb.instantiateViewController(identifier: "ConfigurationView") as! ConfigurationViewController
        
        
        //navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: self)
    }
}

