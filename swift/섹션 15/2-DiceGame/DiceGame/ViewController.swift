//
//  ViewController.swift
//  DiceGame
//
//  Created by Allen H on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[0]
        
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
        
    }
    
    
    
    

}

