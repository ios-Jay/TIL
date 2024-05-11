import UIKit

/*: # 클래스의 상속과 초기화
 ## 1) 클래스의 상속
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



//:> 상속의 기본 개념: 수직 확장 -> 본질적으로 성격이 비슷한 타입을 새로 만들어 데이터(저장 속성)를 추가하거나 기능(메서드)를 변형시켜 사용하는 것

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
