import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"),  #imageLiteral(resourceName: "black3"),  #imageLiteral(resourceName: "black4"),  #imageLiteral(resourceName: "black5"),  #imageLiteral(resourceName: "black6")]
    
    // 앱을 처음 실행시킬때 처음 실행되는 함수
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        firstImageView.image = diceArray.randomElement()
        
        secondImageView.image = diceArray.randomElement()
        
        mainLabel.textAlignment = NSTextAlignment.center
        
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        
        firstImageView.image = diceArray.randomElement()
        
        secondImageView.image = diceArray.randomElement()
        
        mainLabel.textColor = .white
        
        mainLabel.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        myButton.setTitleColor(.black, for: UIControl.State.normal)
        
        myButton.backgroundColor = .white
        
        
    }
    
}

