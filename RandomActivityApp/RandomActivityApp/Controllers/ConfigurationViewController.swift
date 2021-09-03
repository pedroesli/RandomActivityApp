//
//  ConfigurationViewController.swift
//  RandomActivityApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 30/08/21.
//

import UIKit

class ConfigurationViewController: UITableViewController {

    var values: [Bool] = []
    
    @IBOutlet weak var educationSwitch: UISwitch!
    @IBOutlet weak var recreationalSwitch: UISwitch!
    @IBOutlet weak var relaxationSwitch: UISwitch!
    @IBOutlet weak var charitySwitch: UISwitch!
    @IBOutlet weak var cookingSwitch: UISwitch!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var busyworkSwitch: UISwitch!
    @IBOutlet weak var diySwitch: UISwitch!
    @IBOutlet weak var socialSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        tableView.alwaysBounceVertical = false
        
        saveButton.titleLabel?.highlightedTextColor = UIColor.darkGray
        enableSaveButton(false)
        
        values = UserData.getFilters().getValuesAsBool()
        setupSwitches()
    }

    @IBAction func filterSwitchPressed(_ sender: UISwitch) {
        values[sender.tag] = !values[sender.tag]
        
        enableSaveButton(true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let filters = TypeFilter(array: values)
        UserData.saveFilters(filter: filters)
        
        enableSaveButton(false)
    }
    
    func enableSaveButton(_ state: Bool){
        saveButton.isEnabled = state
        saveButton.titleLabel?.isHighlighted = !state
    }
    
    func setupSwitches(){
        educationSwitch.setOn(values[0], animated: false)
        recreationalSwitch.setOn(values[1], animated: false)
        relaxationSwitch.setOn(values[2], animated: false)
        charitySwitch.setOn(values[3], animated: false)
        cookingSwitch.setOn(values[4], animated: false)
        musicSwitch.setOn(values[5], animated: false)
        busyworkSwitch.setOn(values[6], animated: false)
        diySwitch.setOn(values[7], animated: false)
        socialSwitch.setOn(values[8], animated: false)
    }
}
