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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func configurationButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Configuration", bundle: nil)
        let vc =  sb.instantiateViewController(identifier: "ConfigurationView") as! ConfigurationViewController
        
        
        //navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: self)
    }
}

