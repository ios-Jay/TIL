import UIKit

//: ## 구조체, 클래스의 초기화의 의미
//: - 객체의 생성
//: ---
// 너무나 당연하게도 데이터를 언제나 일일히 수동으로 하나하나 찍어내는 것은 사실상 불가능

// 그렇기 때문에 생성자 라는게 필요하다.

class Dog {
    
    var name = "강아지"    // 속성에 기본값을 넣어서 생성
    
    var weight = 0
    
    func sit() {
        
        print("앉았습니다.")
    }
    
    func layDown() {
        
        print("누웠습니다.")
    }
}



var bori = Dog()

bori.name

bori.weight



bori.name = "보리"

bori.name

bori.weight = 15

bori.weight




/*:---
 - 초기화 메서드 / 이니셜라이저(Initializer)
 ---
 */

//:> 생성자(이니셜라이저)는 인스턴스를 만들때 사용하는 특별한 메서드
class Player {
    
    var name: String
    
    var height: Double
    
    var age: Int
    
    // 생성자:초기화(initializer)
    
    init(name: String, height: Double, age: Int) {
        // self.name: 인스턴스(실제 데이터)를 의미. 인스턴스의 name
        
        self.name = name
        self.height = height
        self.age = age
        
        /*
         
          마치 함수를 선언하듯이
         
          name: 파라미터의 name
         
          만약 name = name 으로 할당해 버리면 함수 안에서 동일한 파라미터
         
          이름을 쓰면 가장 가까운게 파라미터의 name이기 때문에
         
          인스턴스의 name을 무조건 파라미터로 인식하게 된다. 그래서 에러가 발생
         
          그래서 인스턴스의 네임을 self로 지칭해 주는 것이다.
         
         그냥 문법적 약속이므로 자주 쓰면서 익히면 된다.
         
         */
        
        
    }
    
    func profile() {
        
        
        print("\(name) 선수의 나이는 \(age)년생이며 키는 \(height)cm 입니다.")
        
        
    }
}


var myPlayer = Player(name: "라민 야말", height: 181.2, age: 2007)



// var myPlayer = Player() 불가: 모든 속성이 초기값을 가져야 함

// 초기값을 가진다는 것은 메모리 공간에 데이터가 존재한다는 것을 의미

// 클래스(구조체도 동일)를 찍어낼 때 타입을 선언하였기 때문에

// 구체적인 데이터가 반드시 존재해야 한다.


var myPlayer1 = Player(name: "세르지 로베르토", height: 178.3, age: 1992)  // 초기화 완료

/**==========================================================================
 
 - 초기화 메서드 / 이니셜라이저
 
 - init(파라미터)

 - 모든 저장 속성(변수)을 초기화 해야함 (구조체, 클래스 동일): 모든 속성에 값을 넣어줘야 한다.
 
 - 생성자 실행 종료시점에는 모든 속성의 초기값이 저장되어 있어야 함
 
 - (초기화가 완료되지 않으면 컴파일 에러)
 
 - 생성자의 목적은 결국 "저장속성 초기화"

 - 클래스, 구조체, (열거형)은 모두 설계도 일뿐이고,
 
 - 실제 데이터(속성), 동작(메서드)을 사용하기 위해서는 ===> 초기화 과정이 반드시 필요함
 
=============================================================================**/

var myPlayer2: Player = Player(name: "주앙 펠릭스", height: 181.1, age: 1998)


var myPlayer3: Player = Player.init(name: "주앙 칸셀루", height: 182.0, age: 1994)


// .init: 정식 문법. 보통 줄여서 쓰기에 위의 경우처럼 쓴다.

// 생성자의 의미: 데이터를 실제로 메모리에 생성하기 위한 필수적인 과정
//:> 인스턴스 초기화 완료 ➞ 메모리에 정상적으로 인스턴스가 생성

/*: ---
 - 생성자(이니셜라이저)와 self 키워드
 ---
 */
class Player1 {
    
    var name: String
    
    var height: Double
    
    var age: Int
    
    init(name: String, height: Double, age: Int) {
        self.name = name
        self.height = height
        self.age = age
    }
    
    func dribble() {
        print("\(self.name) 선수가 드리블을 합니다.")
    }
    
    func run() {
        print("\(name)선수가 달립니다.")
    }
    
}



// 인스턴스내에서 동일한 변수명, 상수명을 사용할때

// 가르키는 것을 명확하게 하기 위해 self 키워드를 사용

//:> self 키워드는 클래스/구조체 내에서 해당 인스턴스(자기자신)를 가르킴

/*: ---
 - 초기화의 의미 - 속성이 옵셔널 타입인 경우
 ---
 */


//:> 속성 하나하나도 옵셔널로 선언 가능. 그리고 그 값을 주지 않으면 nil로 초기화된다.
class Player2 {
    
    var name: String?
    
    // 옵셔널 스트링으로 선언하면 값이 없어도 상관없음. nil로 초기화
    
    var height: Double
    
    var age: Int
    
    
    init(name: String? = nil, height: Double, age: Int) {
        
        // self.name = "페드리" //Optional("페드리")
        
        // 기본값 제시도 가능 init(name: String? = "페드리")
        
        // 초기화 메서드로 값을 재설정하지 않는 한 "페드리"가 출력됨
        
        
        
        self.name = name
        self.height = height
        self.age = age
    }
    
    func run() {
        print("\(name) 선수가 달립니다.")
    }
    
    
    
    
}


//:> 옵셔널타입을 가진 변수의 경우는 반드시 초기화값이 있을 필요는 없음 ➞ nil로 초기화되기 때문





var myPlayer4 = Player2(height: 178, age: 2002)


myPlayer4.name








//:> 초기화의 의미: 우리가 정의해 놓은 붕어빵 틀(클래스 / 구조체의 원형)에서 붕어빵(인스턴스)을 생성할 때 모든 저장 속성이 값을 가져야 한다.






