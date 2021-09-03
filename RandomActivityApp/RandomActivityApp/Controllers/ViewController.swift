//
//  ViewController.swift
//  RandomActivityApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 30/08/21.
//

import UIKit
import Alamofire

enum Difficulty: String{
    case Easy
    case Medium
    case Hard
    
    init?(rawValue: Float) {
        let value = Int(rawValue * 100)
        switch value {
        case 0...20:
            self = .Easy
        case 21...45:
            self = .Medium
        case 46...100:
            self = .Hard
        default:
            self = .Easy
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var typeInfoLabel: UILabel!
    @IBOutlet weak var participantInfoLabel: UILabel!
    @IBOutlet weak var difficultyInfoLabel: UILabel!
    @IBOutlet weak var activityInfoLabel: UILabel!
    @IBOutlet weak var randomActivityButton: UIButton!
    
    var isRequesting = false
    let participantEmojis:[String] = ["😉","🙂","😃","😎","😊","😙"]
    let randomActivityButtonEmojis:[String] = ["🤩","🤠","😁","😋","😆","🤗","🙂","😎","😉","😋","😛","😙","😀","😄","😙","😜","😺","😸","😽"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        configure()
        changeEmoji()
    }
    
    func configure(){
        if isRequesting {
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            self.isRequesting = true
            ActivityRequest.getRandom(type: UserData.getFilters(), complition: { [weak self] result in
                switch result{
                case .success(let activity):
                    DispatchQueue.main.async {
                        self?.typeInfoLabel.text = activity.type.capitalized
                        self?.participantInfoLabel.text = self!.randomParticipantEmojis(participants: activity.participants)
                        let diffuculty = Difficulty(rawValue: activity.accessibility)
                        self?.difficultyInfoLabel.text = diffuculty?.rawValue
                        self?.activityInfoLabel.text = activity.activity
                        self?.isRequesting = false
                    }
                case .failure(let error):
                    print(error)
                }
            })
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
    
    func randomButtonEmoji() -> String{
        let randomIndex = Int.random(in: 0..<randomActivityButtonEmojis.count)
        return randomActivityButtonEmojis[randomIndex]
    }
    
    @IBAction func configurationButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Configuration", bundle: nil)
        let vc =  sb.instantiateViewController(identifier: "ConfigurationView") as! ConfigurationViewController
        
        //navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: self)
    }
    
    @IBAction func emojiFaceButtonClicked(_ sender: UIButton) {
        changeEmoji()
        animate()
        configure()
    }
    
    func changeEmoji(){
        UIView.performWithoutAnimation {
            randomActivityButton.setTitle(randomButtonEmoji(), for: .normal)
        }
    }
    
    func animate(){
        let oldButtonTransform = randomActivityButton.transform
        let newButtonTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.animate(withDuration: 0.1) {
            self.randomActivityButton.transform = newButtonTransform
        } completion: { done in
            UIView.animate(withDuration: 0.2) {
                self.randomActivityButton.transform = oldButtonTransform
            }
        }
    }
    
}

