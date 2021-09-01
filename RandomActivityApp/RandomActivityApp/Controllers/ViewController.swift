//
//  ViewController.swift
//  RandomActivityApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 30/08/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var typeInfoLabel: UILabel!
    @IBOutlet weak var participantInfoLabel: UILabel!
    @IBOutlet weak var difficultyInfoLabel: UILabel!
    @IBOutlet weak var activityInfoLabel: UILabel!
    
    let activityRequest = ActivityRequest()
    var isRequesting = false
    let participantEmojis:[String] = ["😉","🙂","😃","😎","😊","😙"]
    let emojisButtons:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        configure()
    }
    
    func configure(){
        if isRequesting{
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            self.isRequesting = true
            self.activityRequest.getRandom { [weak self] result in
                switch result{
                case .success(let activity):
                    DispatchQueue.main.async {
                        self?.typeInfoLabel.text = activity.type
                        self?.participantInfoLabel.text = self!.randomParticipantEmojis(participants: activity.participants)
                        self?.difficultyInfoLabel.text = "\(Int(activity.accessibility * 100))%"
                        self?.activityInfoLabel.text = activity.activity
                        self?.isRequesting = false
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func randomParticipantEmojis(participants: Int) -> String{
        if participants > 5{
            //Caso tiver uma quantiade maior do que 5 retorna só o numero
            return String(participants)
        }
        
        var pa = ""
        for _ in 0...participants{
            let randomIndex = Int.random(in: 0..<participantEmojis.count)
            
            pa = pa + participantEmojis[randomIndex]
        }
        
        return pa
    }
    
    @IBAction func configurationButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Configuration", bundle: nil)
        let vc =  sb.instantiateViewController(identifier: "ConfigurationView") as! ConfigurationViewController
        
        
        //navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: self)
    }
    
    @IBAction func emojiFaceButtonClicked(_ sender: UIButton) {
        configure()
    }
    
}

