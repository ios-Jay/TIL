import Foundation

var comChoice: Int = Int.random(in: 1...100)

var myChoice: Int = 0

// 계속 숫자를 읽어오는 방법이 필요(앱을 실행시키면 터미널에서 1회만 실행되고 종료): While 반복문 사용(특정 조건을 만족하지 않으면 앱을 무한으로 실행)


while true {
    
    
    // 숫자 입력
    
    var userInput = readLine()
    
    
    if let input = userInput {  // 옵셔널 스트링타입을 한번 벗겨내고
        
        
        if let number = Int(input) {    // 다시 한번 더 스트링타입을 인트타입으로 변환시키면서 myChoice 변수에 담은뒤 조건문을 비교해야함
            
            
            myChoice = number
            
        }
        
        
    }
    
    
    
    
    
    if comChoice > myChoice {
        print("up")
    } else if comChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
        break
    }
    
    
}
