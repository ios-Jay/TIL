import UIKit

//: # 확장(Extensions)

/*: ## 확장(Extensions)
 - 확장의 개념에 대한 이해
 ---
 */

/**=================================================================================
 
 - 상속과 확장의 비교
 
 - (상속 - 수직적 개념) 성격이 비슷한 "타입을 새로" 만들어, 데이터를 추가하고, 기능(메서드)을 변형시켜 사용하려는 것
 
 - (확장 - 수평적 개념) "현재 존재하는 타입"에 기능(메서드)을 추가하여 사용하려는 것
 
 
 - 현재 존재하는 타입
 
 - 1)클래스, 2)구조체, 3)열거형 (그리고 프로토콜) 타입에 확장(새로운 기능 추가)이 가능함
 
 - (새 기능을 추가 할 수 있지만 기존 기능을 재정의 할 수는 없음)
 
 
 - 확장의 장점
 
 - 원본 소스 코드에 대한 액세스 권한이없는 유형을 확장하는 기능이 포함 (소급-모델링 retroactive modeling)
 
 - 예) Int, String, Double 등 애플이 미리 만들어 놓은 타입에 확장도 가능
 
 ===================================================================================**/

/*: ---
 - 확장 문법
 ---
 */
// 기존 타입(오리지널 타입, 본체)

class SomeType {
    
}

// 기존 유형에 새 기능을 추가하기 위해 확장을 정의하면

// 확장이 정의되기 전에 생성된 경우에도 기존 인스턴스에서 새 기능을 사용 가능함

// 예시)

var a = SomeType()


a.doSomething()


extension SomeType {
    
    // 기존의 타입에 extension 이라는 키워드를 사용해서 확장하고, 새로운 기능을 정의
    
    // 새로운 기능을 추가 가능(메서드 형태만 가능) ⭐️
    
    // 구조체, 열거형도 가능
    
    func doSomething() {
        
        print("Do something")
        
    }
}

// 코드는 당연히 여기까지 실행해야 a.dosomething 실행 가능

/*: ---
 - 예시를 통한 확장의 이해
 ---
 */

class Person {
    
    var id = 0
    
    var name = "이름"
    
    var email = "1234@gmail.com"
    
    func walk() {
        
        print("사람이 걷는다.")
    }
}


class Student: Person {
    
    var studentId = 1
    
    override func walk() {
        
        print("학생이 걷는다.")
    }
    
    func study() {
        
        print("학생이 공부한다.")
    }
}

extension Student {
    
    // 스위프트에서는 확장에서 구현한 메서드에 대한 재정의가 불가
    
    // ⭐️ (@objc 붙이면 가능): objc func play() { print("학생이 논다.") }
    
     func play() {
        
        print("학생이 논다.")
        
    }
}

class Undergraduate: Student {
    
    var major = "전공"
    
    override func walk() {
        
        print("대학생이 걷는다.")
    }
    
    override func study() {
        
        print("대학생이 공부한다.")
    }
    
    func party() {
        
        print("대학생이 파티한다.")
    }
    
    
    
    // func play()
    
//    override func play() {     // 스위프트에서는 확장에서 구현한 메서드에 대한 재정의가 불가 ⭐️
//        print("대학생이 논다.")
//    }
}



var under = Undergraduate()     // 상속되었으므로 당연히 확장이 구현된다.
under.play()

// extension Undergraduate {

//    override func play() {

//        print("대학생이 논다.")

//    }

// }

/*: ---
 - 확장의 장점
 ---
 */
// 기존에 손댈수 없었던 타입의 기능을 확장을 통해 사용할 수 있음. -> 소급-모델링

extension Int {
    
    var squared: Int {
        
        return self * self
    }
}


5.squared

3.squared

7.squared

/*: ---
 - 확장 가능 멤버의 종류
 ---
 */

//:> 확장에서는 메서드형태만 정의 가능

/**==========================================================================================
 
 - 클래스, 구조체, (열거형) 확장가능 멤버
 
 - (원본 형식이 붕어빵틀 역할을 하기 때문에), 저장속성은 정의할 수 없음
 
 
 - 1) (타입) 계산 속성, (인스턴스) 계산 속성
 
 - 2) (타입) 메서드, (인스턴스) 메서드
 
 - 3) 새로운 생성자  (⭐️ 다만, 클래스의 경우 편의생성자만 추가 가능 / 지정생성자 및 소멸자는 반드시 본체에 구현)
 
 - 4) 서브스크립트
 
 - 5) 새로운 중첩 타입 정의 및 사용
 
 - 6) 프로토콜 채택 및 프로토콜 관련 메서드
 
 
 - 프로토콜에 대한 확장도 가능(자세한 내용은 프로토콜에서 다룰 예정)
 
 ============================================================================================**/

//:> 지정생성자는 본체에서 인스턴스를 찍어내는 중요역할을 하므로 ➞ 지정생성자는 확장에서 구현하지 못함

//: ---


/*: ## 1) 멤버의 확장(계산 속성)
 - 1-1. (타입)계산 속성의 확장
 ---
 */

// (타입) 계산 속성 또는 (인스턴스) 계산 속성 확장 가능

// (저장된 속성을 추가하거나 기존 속성에 속성 관찰자를 추가 할 수는 없음)


extension Double {
    
    static var zero: Double { return 0.0 }
}

Double.zero

/*:---
 - 1-2. (인스턴스)계산 속성의 확장
 ---
 */

// 인스턴스의 (읽기전용) 계산 속성을 기존의 애플이 만든 Double 타입에 추가 하는 예제


// 자신의 단위를 입력하여 ==> 미터 기준으로 바꾸는 예제

extension Double {
    var km: Double { return self * 1_000.0 }   // 인스턴스 자신에 1000 곱하기
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


let oneInch = 25.4.mm

print("1인치는 \(oneInch) 미터")

// 1인치는 0.0254 미터"


let threeFeet = 3.ft

print("3피트는 \(threeFeet) 미터")

// 3피트는 0.914399970739201 미터"




// 인스턴스자체에 즉, Double의 리터럴값에 .(점)문법을 사용하여 거리 변환을 수행하도록 만듦


// Double 값 1.0  ===> "1 미터"를 나타내는 것으로 간주됨

// m 계산 속성이 self를 반환 (1.m 표현식은 Double값 1.0을 계산하는 것임)

// 1 킬로미터는 Double 값에 1_000.00을 곱하여 "미터로 변환"

// ft 계산 속성은 Double 값을 3.28084로 나누어 피트에서 "미터로 변환"



let aMarathon = 42.km + 195.m
print("마라톤은 \(aMarathon) 미터의 길이임")        // 마라톤은 42195.0 미터의 길이임"





extension Int {
    
    var squared1: Int {
        
        return self * self
    }
}


func squared(num: Int) -> Int {

    // 이런식으로 함수를 만드는 것보다 훨씬 간단하고, 더 간결하게 만들 수 있음
    
    return num * num
    
}


Int(123).squared1

123.squared1


squared(num: 123)


//: ---

/*: ## 2) 멤버의 확장(메서드)
 - 2-1. (타입)메서드의 확장
 ---
 */
