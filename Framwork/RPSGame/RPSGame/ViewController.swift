//
//  ViewController.swift
//  RPSGame
//
//  Created by 김재혁 on 2024/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var myChoiceLable: UILabel!
    
    
    var myChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        
        comImageView.image = #imageLiteral(resourceName: "ready")
        
        myImageView.image = #imageLiteral(resourceName: "rock")
        
        comChoiceLabel.text = "준비"
        
        myChoiceLable.text = "준비"
        
        
        super.viewDidLoad()
        
        
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        
        
        let title = sender.currentTitle!
        
        switch title {
            
        case "가위":
            
          myChoice = Rps.scissors
            print("가위입니다.")
            
        case "바위":
            myChoice = Rps.rock
            print("바위입니다.")
            
        case "보":
           myChoice = Rps.paper
            print("보입니다.")
            
        default:
            break
            
        }
        
        
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
            
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLable.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLable.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLable.text = "가위"
        }
        
        if comChoice == myChoice {
            mainLabel.text = "비겼습니다."
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼습니다."
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼습니다."
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼습니다."
        } else {
            mainLabel.text = "졌습니다."
        }
        
    }
    
    
    
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        myImageView.image = #imageLiteral(resourceName: "rock")
        myChoiceLable.text = "준비"
        
        
        mainLabel.text = "선택하세요"
        
        
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        
    }
    
    
    
}

