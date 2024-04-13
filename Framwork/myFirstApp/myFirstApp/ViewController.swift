import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        mainLabel.backgroundColor = UIColor.yellow
        
    }
    
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        
        
        mainLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        mainLabel.text = "안녕하세요!"
        
        
        mainLabel.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        
    }
    

}

