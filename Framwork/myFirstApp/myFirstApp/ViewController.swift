import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    // 버튼 역시 아울렛으로 연결시킬 수 있음
    
    @IBOutlet weak var myButton: UIButton!
    
    // 앱을 처음 실행시키면 맨 처음 실행시키는 함수
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        mainLabel.text = "안녕하세요." 
        // 스토리보드에 "반갑습니다"가 입력 되었다라도 시뮬레이터를 실행 시키면 "안녕하세요"가 실행됨
        mainLabel.backgroundColor = UIColor.yellow  // 배경 색상 변경
        mainLabel.textAlignment = NSTextAlignment.center    // 텍스트 가운데 정렬
        
        
        
        
    }
    
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        
        
        mainLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        mainLabel.text = "안녕하세요!"
        
        
        mainLabel.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        
        myButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
    }
    

}

