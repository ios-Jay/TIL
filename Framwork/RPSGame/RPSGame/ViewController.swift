//
//  ViewController.swift
//  RpsGame
//
//  Created by 김재혁 on 5/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    // 클래스의 속성(properties)
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    
    @IBOutlet weak var comImageView: UIImageView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var comChoicelabel: UILabel!
    
    
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    var myChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    
    
    // 앱이 실행되면 처음 화면에서 실행되는 함수
    
    override func viewDidLoad() {
        
        mainLabel.text = "가위바위보 게임"
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        comChoicelabel.text = "준비"
        myChoiceLabel.text = "준비"
        

    
        super.viewDidLoad()
        
        

    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
       
    // 가위 바위 보 버튼을 선택하면 나의 이미지뷰와 레이블이 각각의 가위바위보 이미지와 텍스트로 변해야 함
    // 그러기 위해서는 버튼의 값이 옵셔널이므로 값을 벗기고, 그 값을 스위치문을 통해 분기처리한다.
    // 가위 바위 보 버튼 중 내가 선택한 열거형 값이 select 버튼을 통해서 전달이 되어야 한다.
    // 컴퓨터의 경우는 랜덤으로 값을 선택해야만 하므로 select 버튼 함수 내부에서 값이 전달되면 된다.
        
        
        guard let myselectTitle = sender.currentTitle else { return }
        
        
        switch myselectTitle {
        case "가위":
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
            myChoice = .scissors
        case "바위":
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
            myChoice = .rock
        case "보":
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
            myChoice = .paper
        default:
            break
        }
        
        
    }
    
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoicelabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoicelabel.text = "보"
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoicelabel.text = "가위"
        }
        
        
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        if comChoice == myChoice {
            mainLabel.text = "비겼습니다."
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "당신이 이겼습니다."
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "당신이 이겼습니다."
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "당신이 이겼습니다."
        } else {
            mainLabel.text = "당신은 졌습니다."
        }
        
        
        
    }
    
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        mainLabel.text = "가위바위보 게임"
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        comChoicelabel.text = "준비"
        myChoiceLabel.text = "준비"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        
        
    }
    
    
    
    
    
    


}

