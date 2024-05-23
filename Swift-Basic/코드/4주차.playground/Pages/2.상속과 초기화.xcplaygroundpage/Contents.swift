import UIKit

/*: # 클래스의 상속과 초기화
 ---
 */

/*: ## 1) 클래스의 상속
 - 상속(Inheritance)
 ---
 */

//:> 상속은 유일하게 클래스에서만 지원하는 기능(구조체는 상속 불가능)
/**=============================================================
 
 - 상속은 쉽게 말하면, 본질적으로 성격이 비슷한 타입을 새로 만들어
 
 - 1) 데이터(저장속성)를 추가하거나 2) 기능(메서드)를 변형시키서 사용하려는 것
 
 =============================================================**/

/*:---
 - 상속의 기본 문법
 ---
 */
class Aclass {
    
    var clubTeam = "FC 바르셀로나"
    
}


class Bclass: Aclass {
    
    // clubTeam
    
    var playerName = "귄도안"
    
}


// BClass는 AClass를 상속해서 구현

// 서브클래스는 슈퍼클래스로부터 멤버를 상속함

/*
 
 fianl class AClass {
 
 var name = "FC 바르셀로나"
 
 }
 
 class BClass: AClass { final 키워드 선언시 에러 발생
 
 
 Inheritance from a final class 'AClass': 에러 발생
 
 // name
 
 var id = 0
 
 
 }
 
 
 */

/*:
 - 경우에 따라서, 클래스의 상속을 금지해야하는 경우가 있음
 - final을 각 멤버 앞에 붙인 경우, 해당 멤버 재정의 불가라는 뜻
 */

/*: ---
 - 상속(Inheritance)의 예시
 ---
 */

//:> 기본적으로 상속은 데이터(저장 속성)을 추가하는 관점에서 생각

class Person {
    
    var id = 0
    
    var name = "이름"
    
    var email = "abc@gamil.com"
    
}


class Student: Person {     // 상속
    
    // id
    
    // name
    
    // email
    
    // 상속을 했기 때문에 자동으로 위 세가지 속성을 가지고 태어남.
    
    var studentID = 2024
    
    
}

class Undergraduate: Student {
    
    // id
    
    // name
    
    // email
    
    // studentId
    
    var major = "전공"
}

var person1 = Undergraduate()

person1.major

person1.email

person1.id

person1.name

person1.studentID

/*:---
 - 상위 클래스에서 존재하는 멤버를 변형하는 것을 재정의라고 함

 - 재정의를 하려는 멤버에는 override 키워드를 붙여야함

 - 상속의 기본 개념: 저장 속성을 추가하는 행위.
---
 */



//:> 상속의 기본 개념: 수직 확장 → 본질적으로 성격이 비슷한 타입을 새로 만들어 데이터(저장 속성)를 추가하거나 기능(메서드)를 변형시켜 사용하는 것

/*: ## 2) 재정의(Overriding)
 - 오버로딩(overloading) vs 오버라이딩(overriding)
 ---
 */

/**==============================================================================
 
 - 오버로딩(overloading) - (엉어 뜻: 과적) 함수에서 함수의 하나의 이름에 여러 함수를 대응시켜서 사용
 
 - 오버라이딩(overriding) - (영어 뜻: 재정의) 클래스의 상속에서 상위클래스의 속성/메서드를 재정의(기능을 약간 변형하여 사용)하는 것

 - 재정의
 
 - 서브클래스에서 슈퍼클래스의 동일한 멤버를 변형하여 구현

 - 재정의 가능한 대상(멤버)
 
 - 1) 속성 (하지만, 저장 속성에 대한 재정의는 어떠한 경우에도 불가능)
 
 - 2) 메서드 (메서드, 서브스크립트, 생성자)

    ==> 속성과 메서드는 재정의 방식이 다름 ⭐️
 
 ==============================================================================**/




class Play {
    func run() {
        print("달린다.")
    }
}


class PlayFootball: Play {
    
    override func run() {
        
        super.run()
        
        print("축구공을 드리블한다.")
    }
}


//:> 저장속성의 재정의는 원칙적 불가 (데이터 구조의 변형은 불가)



/*: ---
 - 재정의(overriding)의 기본 문법
 ---
 */
class someSuperClass {
    
    // 저장속성
    
    var aValue = 0
    
    // 메서드
    
    func doSomething() {
        
        print("do Something")
        
    }
    
}


class someSubClass: someSuperClass {
    
    // 저장속성의 재정의는 원칙적 불가
    
    // override var aValue = 3 ==> 불가
    
    // 저장속성 ===> (재정의) 계산속성
    
    // 그러나, 메서드 형태로 부수적 추가는 가능
    
    
    override var aValue: Int {
        
        
        get {
            
            return 1
        }
        
        set {
            
            super.aValue = newValue
        }
    }
    
    override func doSomething() {
        
        super.doSomething()
        
        print("do anything")
        
        // super.doSomething()
    }
    
    
    
    
}

/*: ---
 */




/*: ## 3) 초기화(Initialization)
 - 초기화(Initialization)와 생성자(Initializer)
 ---
 */
class Dog {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

//: 초기화 메서드(생성자)
/**================
 
 - 함수의 구현이 특별한 키워드인 init으로 명명됨
 - 인스턴스를 생성 과정: 저장 속성에 대한 초기값을 설정하여 사용 가능한 상태가 되는 것
 - 생성자 메서드 실행의 목적은, 모든 저작 속성 초기화를 통한 인스턴스 생성
 - 즉, 생성자 실행의 종료시점에는 모든 저장 속성에 대한 값이 저장되어 있어야 함
 - 설계도(클래스, 구조체, 열거형)를 실제로 사용하기 위해 인스턴스를 찍어내는 과정
 - 생성자 실행시, 메모리 내에 실제 인스턴스를 생성하는 복잡한 코드가 자동 구현
 =================**/

//: 오버로딩 지원
// 다양한 파라미터 조합으로 생성자를 여러개 구현 가능

// 여러가지 방식으로 인스턴스를 생성하는 방법을 제공하는 것

//:> 생성자를 직접 구현하지 않으면: (사용자 정의(직접) 구현이 원칙) → 개발자의 의도가 우선
/**=======================================
 
 (1) 모든 저장 속성에 기본값(또는 옵셔널 타입) 전제
 
 - 클래스: 기본생성자 init() 제공 (초기화 방법 필요)
 - 구조체: 기본생성자 init() 제공(초기화 방법 필요 + 멤버와이즈 이니셜라이저도 제공(편의를 위해 기본 제공 / 새로운 값으로 설정 가능)
 
 (2) 일부 저장 속성에 기본값(또는 옵셔널 타입)전제
 
 - 클래스: 원칙적으로 일부 값만 가지고, 생성자 구현하지 않는 방법이 존재하지 않음
 -  구조체: 멤버와이즈 이니셜라이저 기본 제공
 (편의를 위한 기본 제공 ➡︎ 일부 / 전체 저장 속성 새로운 값으로 설정 가능)
 
 - 멤버와이즈 이니셜라이저: 직접 구현하지 않아도, 자동으로 제공해주는 저장 속성 설정가능한 생성자
 ==========================================*/







/**=====================================================================
 
 - 초기화는 클래스, 구조체, 열거형의 인스턴스를 생성하는 과정임
 
 - 각 "저장 속성"에 대한 초기값을 설정하여 인스턴스를 사용가능한 상태로 만드는 것
 
   (열거형은 저장속성이 존재하지 않으므로, case중에 한가지를 선택 및 생성)

 - 결국, 이니셜라이저의 실행이 완료되었을 때,
 
 - 인스턴스의 모든 저장속성이 초기값을 가지는 것이 ==> 생성자(Initializer)의 역할

 - 참고) 소멸자
 
 - 생성자와 반대개념의 소멸자(Deinitializer)도 있음
 
 - 소멸자 ==> 인스턴스가 해제되기 전에 해야할 기능을 정의하는 부분
 
=====================================================================**/











/*:---
 - 생성자(Initializer) 구현의 기본
 ---
 */
// 클래스, 구조체, (열거형) 동일

class Color {
    
    // let red, green, blue: Double    // 동일한 타입일때, 한줄에 작성가능

    
    let red: Double
    
    let green: Double
    
    let blue: Double
    
    // 생성자도 오버로딩(Overloading)을 지원 (파리미터의 수, 아규먼트 레이블, 자료형으로 구분)
    
    // "init()" -> 기본 생성자. 저장 속성의 기본값을 설정하면 "자동" 구현이 제공됨

    init() {
        red = 0.0
        green = 0.0
        blue = 0.0
    }
    
    
    init(white: Double) {   // 하나의 값만 가지도록 하는 생성자
        red = white
        green = white
        blue = white
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    
    
    
    
}

/**===================================================
 
 - 초기화의 방법(저장속성이 초기값을가져야 함)
 
 - 1) 저장 속성의 선언과 동시에 값을 저장
 
 - 2) 저장 속성을 옵셔널로 선언 (초기값이 없어도 nil로 초기화됨)
 
 - 3) 생성자에서 값을 초기화

 - 반드시 생성자를 정의해야만 하는 것은 아님 ⭐️
 
 - 1-2번 방법으로 이니셜라이저를 구현하지 않아도,
 
 - 컴파일러는 기본 생성자(Default Initializer)를 자동으로 생성함 ==> init()
 
 - ==> 이니셜라이저 구현하면, 기본 생성자를 자동으로 생성하지 않음
 
======================================================**/

// 기본 생성자 호출. 결국 Color()는 생성자를 호출하는 것임 (메서드 호출 문법과 형태 동일)


var color = Color()
// var color2 = Color.init()


color.red
color.green
color.blue

// color = Color(white: <#T##Double#>)

// color = Color.init(white: <#T##Double#>)


// color = Color(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>)

// color = Color.init(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>)

// 개발자에게 여러 가지 선택권을 줄 수 있게 됨


/*: ---
 - 멤버와이즈 이니셜라이저(Memberwise Initializer) - 구조체의 특별한 생성자
 ---
 */

//:> 구조체는 멤버와이즈 이니셜라이저 자동 제공
// 생성자를 구현하지 않아도 자동으로 생성

// 기본값을 가지고 있더라도 멤버와이즈 이니셜라이즈를 자동으로 제공



struct Color1 {
    var red: Double
    var green: Double
    var blue: Double
}


// var c2 = Color1(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>)



/**============================================================
 
 - 생성자 기본 원칙
 
 - 컴파일러는 기본 생성자(Default Initializer)를 자동으로 생성함 ==> init()
 
 - ==> 이니셜라이저 구현하면, 기본 생성자를 자동으로 생성하지 않음

 - 구조체는 저장 속성들이 기본값을 가지고 있더라도,
 
 - 추가적으로 Memberwise멤버와이즈(멤버에 관한) 이니셜라이저를 자동으로 제공함

 - 개발자가 직접적으로 생성자를 구현하면, 멤버와이즈 이니셜라이저가 자동으로 제공되지 않음 ⭐️
 
   (멤버와이즈 이니셜라이저는 편의적 기능일뿐)
 ==============================================================**/


// 구조체에서만 선언된 저장 속성의 이름을 파라미터로 제공하기 때문에

// 멤버에 관한 생성자를 제공한다는 뜻에서 멤버와이즈 이니셜라이저라고 부름

// (Memberwise 뜻: 멤버에 관하여) ( ~ wise:  ~ 에 관하여)


/**==================================================
 
 - 왜 멤버와이즈 이니셜라이저를 제공할까?
 
 - 굳이 이유를 찾자면, 클래스보다 더 편하게 쓰기 위함일 것으로 추측
 
 - 클래스의 경우에는, 생성자가 상속하고 관련이 있기 때문에 복잡
 
=====================================================**/

//: ---


/*: ## 4) 생성자(Initializer)
 ---
 - 구조체 vs 클래스 생성자(Initializer)
 ---
  */
/**=======================================
 - (지정)생성자   <=====>  편의 생성자


 [구조체의 생성자]
 - 1) 지정 생성자, (자동제공되는 멤버와이즈생성자)
 - 2) 실패가능생성자


 [클래스의 생성자]
 - 1) 지정 생성자
 - 2) 편의 생성자  (상속과 관련)
 - 3) 필수 생성자  (상속과 관련)
 - 4) 실패가능생성자
=========================================**/

//: ---

/*: ## 구조체 생성자
 - 여러 개의 지정 생성자 구현
 ---
 */

//:> 구조체나 클래스, 둘다 아래처럼 구현 가능(오버로딩을 지원하므로)
// 그렇지만, 이런 방식이 올바른 구현 방법은 아님

struct Color2 {
    let red, green, blue: Double
    
    
    init() {    // 기본 생성자. 기본값을 설정하면 자동으로 제공됨
        
        red = 0.0
        green = 0.0
        blue = 0.0
        
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

/*: ---
 - 구조체(값타입)의 지정생성자의 구현
 ---
 */
struct Color3 {
    
    let red, green, blue: Double
    
    init() {      // 구조체는 다른 생성자를 호출하는 방식도 가능 ⭐️
        //red = 0.0
        //green = 0.0
        //blue = 0.0
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }

    init(white: Double) {    // 구조체는 다른 생성자를 호출하는 방식도 가능 ⭐️
        //red   = white
        //green = white
        //blue  = white
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
}

// 값타입(구조체)의 경우 자체 지정생성자 작성할 때



// 생성자 내에서 self.init(...)를 사용하여 다른 이니셜라이저를 호출하도록 할 수 있음

//: ---
/*: ## 클래스 생성자
 ---
 - 클래스의 지정(Designated) vs 편의 생성자(Convenience)
 ---
 */
class Color4 {
    
    let red, green, blue: Double
    
    convenience init() {
        self.init(red: 0.0, green: 0.0, blue: 0.0)
        //self.init(white: 0.0)
    }

    convenience init(white: Double) {
        //red   = white
        //green = white
        //blue  = white
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    
}

/**========================================================================
 - 일단 편의 생성자는 편리하게 생성하기 위한 서브(Sub)생성자라고 보면됨(메인이 아닌)
 - ===> (메인) 지정 생성자에 의존하는 방식 (지정 생성자 호출)

 - 지정 생성자는 모든 속성을 초기화 해야함
 - 편의 생성자는 모든 속성을 초기화 할 필요가 없음(편의적 성격)

  ⭐️
 - 클래스는 상속을 지원하므로, 변수가 여러개 이고,
 - 여러 지정 생성자를 지원했을때 상속 관계에서 개발자가 실수할 수 있는 여러가지 가능성이 있음.
 - 따라서, 초기화 과정을 조금 간편하게 만들고,
 - 상속관계에서 개발자가 실수 할 수 있는 여러가능성을 배제하기 위한 생성자임

 - 반대로 말하자면 모든 속성을 초기화하지 않는다면 ===> 편의생성자로 만드는 것이 복잡도나 실수를 줄일 수 있음
 - 결국, 생성자의 가능한 중복을 없애고 다른 지정 생성자를 호출하는 패턴으로 구현해야 함
 ==========================================================================**/




//:> (이미 모든 속성을 초기화하는 지정생성자가 있다면) 모든 속성을 초기화하지 않는 경우 편의생성자로 구현을 권장

var colorLiteral = Color3()

colorLiteral.red
colorLiteral.green
colorLiteral.blue


var colorLiteral1 = Color3(white: 0.5)

colorLiteral1.red
colorLiteral1.green
colorLiteral1.blue


// var colorLiteral2 = Color3(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>)

