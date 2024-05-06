import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 랜덤으로 숫자 선택
    
    var comNumber: Int = Int.random(in: 1...10)
    
    // 내가 선택한 숫자를 담는 변수
    
    // var myNumber: Int = 1
    
    
    // 앱의 화면에 들어오면 가장 처음에 실행되는 함수
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 1) 메인레이블에 "선택하세요."
        
        mainLabel.text = "선택하세요."
        
        // 2) 숫자 레이블은 "" (빈문자열)
        
        numberLabel.text = ""
        
        // 3) 컴퓨터가 랜덤 숫자를 선택
        
        
        
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // 1) 버튼의 숫자를 가져와야함
        
        guard let numString = sender.currentTitle else { return }
        
        // 2) 숫자 레이블이 변하도록(숫자에 따라)
        
        numberLabel.text = numString
        
        // 3) 선택한 숫자를 변수에다가 저장(선택) 문자열 ---->정수로 변환한 다음 저장
        
       //  guard let num =  Int(numString) else { return }
    
       //  myNumber = num
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 또다른 방법 제시
        
        // 숫자레이블에 있는 문자열 가져오기(옵셔널 벗기기)
        
        
        guard let myNumString = numberLabel.text else { return }
        
        // 타입 변환(문자열->정수)
        
        guard let myNumber = Int(myNumString) else { return }
        
        
        
        
        
        
        
        // 1) 컴퓨터의 숫자와 내가 선택한 숫자를 비교해서 UP,Down,Bingo 판별
        
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "Down"
        } else {
            mainLabel.text = "Bingo🎃"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 메인레이블 "선택하세요."
        
        mainLabel.text = "선택하세요."
        
        // 2) 숫자 레이블 ""
        
        numberLabel.text = ""
        
        // 3) 컴퓨터의 랜덤숫자를 다시 선택하기
        
        comNumber = Int.random(in: 1...10)
        
    }
    

}

