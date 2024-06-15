import UIKit

//: # 확장(Extensions)

//: ---

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
// 애플이 만든 타입메서드 예시

Int.random(in: 1...100)


extension Int {
    
    static func printNumbersFrom1to5() {
        
        for i in 1...5 {
            
            print(i)
        }
    }
}


// 항상 1부터 5까지를 출력

Int.printNumbersFrom1to5()

/*: ---
 - 2-2. (인스턴스)메서드의 확장
 ---
 */
// Int타입에 특정 프린트 구문 확장해보기

// 소급 모델링

extension String {
    
    func printHelloRepetitions(of times: Int) {
        
        for _ in 0..<times {
            
            print("Hello \(self)!")
        }
    }
}



"Steve".printHelloRepetitions(of: 4)

// "Swift".printHelloRepetitions(of: 5)
    

// Hello Steve!
// Hello Steve!
// Hello Steve!
// Hello Steve!

/*: ---
 - mutating 인스턴스 메서드의 확장
 ---
 */

//:> 구조체(열거형)에서, 자신의 속성을 변경하는 메서드는 mutating키워드 필요

// 제곱하는 메서드 만들어 보기

extension Int {
    
    mutating func square() {    // 기존 메서드와 동일하게, mutating 키워드 필요
        
        self = self * self
    }
}


var someInt = 3

someInt.square()    // 9

// ---


/*: ## 3) 멤버의 확장(생성자)
 - 3.생성자의 확장
 ---
 */

//:> 클래스 - 편의 생성자만 구현 가능 / 구조체(값타입) - 지정생성자 형태로도 (자유롭게) 생성자 구현 가능

/**=========================================================================
 
  [클래스]
 
 - 편의 생성자만 추가 가능 (즉, 본체의 지정생성자를 호출하는 방법으로만 구현 가능) ⭐️
 
 - 지정생성자 추가 불가 / 소멸자 추가 불가 (항상 본래의 클래스에서 정의해야 함)

 
  [구조체]
 
 - 구조체는 (원래) 편의 생성자가 존재하지 않고, 상속과 관련이 없기 때문에
 
   지정생성자의 형태로도 (자유롭게) 생성자 구현 가능 ⭐️
 
   (1) (편의 생성자와 비슷한) 생성자를 추가하여 본체의 지정 생성자를 호출하는 방법으로도 구현 가능하고
 
   (2) 새롭게 지정생성자 형태로 구현하는 것도 가능
 
  [구조체 참고 사항]
 - (본체) 직접 생성자 구현하면, 기본 생성자 init() /멤버와이즈 생성자 제공 안되는 것이 원칙
 
 - (예외) (본체) 모든 저장속성에 기본값제공 + (본체에 직접) 생성자를 구현하지 않았다면, 확장에서는 괜찮음
 
 - (즉, 확장에서 생성자를 구현해도, 본체에는 여전히 기본 생성자/멤버와이즈 생성자가 자동 제공
 
    되고 본체의 기본 생성자/멤버와이즈 생성자 호출하는 방식으로의 구현도 가능)
=========================================================================**/

/*: ---
 - 구조체 - 생성자 확장의 예시
 ---
 */

// 포인트 구조체, 사이즈 구조체

struct Point {
    
    var x = 0.0, y = 0.0
    
    init() {    // 클래스의 편의 생성자와 사실상 동일한 개념
        
        self.init(x: 0.0, y: 0.0)
    }
    
    init(x: Double = 0.0, y: Double = 0.0) {
        
        self.x = x
        
        self.y = y
    }
    
}



struct Size {
    
    var width = 0.0, height = 0.0
}



// Rect구조체

struct Rect {     // 기본값 제공/생성자 구현안함  ===> 기본 생성자 / 멤버와이즈 생성자가 자동 제공 중
    
    var origin = Point()
    
    var size = Size()
    
}



let defaultRect = Rect()    // 기본생성자

// Rect(origin: Point(x: <#T##Double#>, y: <#T##Double#>), size: Size(width: <#T##Double#>, height: <#T##Double#>))

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          
                          size: Size(width: 5.0, height: 5.0))    // 멤버와이즈 생성자



extension Rect {
    
    // 센터값으로 Rect 생성하는 생성자 만들기
    
    // 예외적인 경우 (저장속성에 기본값 + 본체에 생성자 구현 안한 경우, 여전히 기본생성자/멤버와이즈 생성자 제공)
    
    init(center: Point, size: Size) {
        
        let originX = center.x - (size.width / 2)
        
        let originY = center.y - (size.height / 2)
        
        // (1) 본체의 멤버와이즈 생성자 호출 방식으로 구현 가능
        
        self.init(origin: Point(x: originX, y: originY), size: size)
        
        // (2) 직접 값을 설정하는 방식으로도 구현 가능
        //self.origin = Point(x: originX, y: originY)
        //self.size = size
    }
}


// 새로 추가한 생성자로 인스턴스 생성해보기

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))

/*: ---
 - 클래스 - 생성자 확장의 예시
 ---
 */

// UIColor 기본 생성자

// UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)

var color = UIColor(red: 0.3, green: 0.5, blue: 0.4, alpha: 1)
    


extension UIColor {      // 익스텐션 + 편의생성자 조합
    
    convenience init(color: CGFloat) {   // Float   / Double
        
        // CGFloat(Core Graphics:애플에서 미리 구현한 그래픽을 표현하는 실수형 데이터 타입)
        
        self.init(red: color/255, green: color/255, blue: color/255, alpha: 1)
    }

}


// 일단 아주 쉽게 객체 생성하는 방법을 제공 가능해짐

UIColor(color: 1)

//UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)

//: ---

/*: ## 4) 멤버의 확장(서브스크립트)
 - 4. 서브스크립트의 확장
 ---
 */

// 확장으로 서브스크립트 추가 가능함

// Int(정수형 타입)에 서브스크립트 추가해보기 (기본자리수의 n자리의 십진수 반환하도록 만들기)

// 예시

// 123456789[0]    // 9

// 123456789[1]    // 8

// 123456789[2]    // 7


extension Int {
    
    subscript(num: Int) -> Int {
        
        var decimalBase = 1
        
        for _ in 0..<num {
            
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
        
    }
}



123456789[0]      // (123456789 / 1) ==> 123456789 % 10 ==> 나머지 9

123456789[1]      // (123456789 / 10) ==> 12345678 % 10 ==> 나머지 8

123456789[2]      // (123456789 / 100) ==> 1234567 % 10 ==> 나머지 7

123456789[3]      // (123456789 / 1000) ==> 123456 % 10 ==> 나머지 6




// Int값에 요청된 자릿수가 넘어간 경우 0 반환

746381295[9]     // 0


// 앞에 0 이 존재 하는 것과 같음

746381295[12]

//: ---

/*: ## 5) 멤버의 확장(중첩타입)
 - 5. 중첩 타입(Nested Types)
 ---
 */

// 클래스, 구조체 및 열거형에 새 중첩 유형을 추가 가능

// Int(정수형 타입)에 종류(Kind) ====> 중첩 열거형 추가해 보기

extension Int {
    
    enum Kind {       // 음수인지, 0인지, 양수인지
        
        case negative, zero, positive
    }
    
    var kind: Kind {    // 계산 속성으로 구현
        switch self {
        case 0:                   // 0인 경우
            return Kind.zero
        case let x where x > 0:   // 0보다 큰경우
            return Kind.positive
        default:                  // 나머지 (0보다 작은 경우)
            return Kind.negative
        }
    }
}




let aa = 1
aa.kind       // 숫자 1의 (인스턴스) 계산속성을 호출 ====> 해당하는 열거형(Int.Kind타입)을 리턴

let b = 0
b.kind

let c = -1
c.kind


Int.Kind.positive
Int.Kind.zero
Int.Kind.negative


let d: Int.Kind = Int.Kind.negative





// 위의 확장을 통해서, 어떤 Int값에서도 중첩 열거형이 쓰일 수 있음

// 위의 확장을 활용한 ===> 함수 만들어보기

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}



// 함수 실행해보기

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])      

// + + - 0 - 0 +
