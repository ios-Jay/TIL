import UIKit

/*: # 프로토콜(Protocols)
 */

/*: ## 프로토콜(Protocols)
 - 프로토콜의 필요성에 대한 인식
 ---
 > 프로토콜: 영어로 규약 / 협약
 */
// 프로토콜? 규약/협약(약속)  → "자격증" / "리모콘"


/*: ---
 -  왜 프로토콜의 개념이 필요할까?
 ---
 */

//: - 클래스와 상속의 단점

//: 1. 하나의 클래스만 상속가능(다중 상속 불가능)

//: 2. 기본적인 상위클래스의 메모리구조를 따라갈 수 밖에 없음(필요하지 않은 속성 / 메서드도 상속됨)

//: 3. 클래스(레퍼런스 타입)에서만 가능

//:>프로토콜:자격증의 개념 → (1) 간단한 규칙만 따르면 (2) 능력을 갖게된다.




// 정의

protocol DriverLicense {
    
    // 요구사항을 정의 (자격증의 필수 능력만 정의)
    
    func drive()
    
}

struct MyDriveStruct: DriverLicense {
    
    // 이제 자격증의 능력이 생긴 것임

    
    func drive() {
        
        // 구체적인 구현

        print("운전만해")
    }
    
}

// 클래스에서 채택

class MyDriveClass: DriverLicense {
    
    func drive() {
        
        print("너는 운전만해")
    }
}

//:> 프로토콜 채택 → 능력을 갖게 된다.

/*:
 ---
 * 프로토콜의 필요성에 대한 인식 - 클래스와 상속의 단점 ⭐️
 ---
 */
// 예제

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
    
    func fly() {
        print("새가 하늘로 날아간다.")
    }
}


class Eagle: Bird {
    
    // isFemale
    // layEgg()
    // fly()
    
    func soar() {
        print("새가 하늘로 날아간다.")
    }
}


class Penguin: Bird {
    
    // isFemale
    // layEgg()
    // fly()    // 상속 구조에서는 펭귄이 어쩔 수 없이 날게 됨 ⭐️
    
    func swim() {
        print("헤엄친다.")
    }
}

class Airplane: Bird {
    
    // isFemale
    
    // layEgg()     // 상속구조에서는 비행기가 알을 낳게됨 ⭐️
    
    override func fly() {
        print("비행기가 엔진을 사용해서 날아간다.")
    }
}

// 플라잉 박물관을 만듦

struct FlyingMuseum {
    
    func flyingDemo(flyingObject: Bird) {
        
        flyingObject.fly()
    }
}


let myEagle = Eagle()

myEagle.fly()

myEagle.layEgg()

myEagle.soar()


let myPenguin = Penguin()

myPenguin.layEgg()

myPenguin.swim()

myPenguin.fly()     // 문제 ===> 펭귄이 날개 됨(무조건적인 멤버 상속의 단점)


let myPlane = Airplane()

myPlane.fly()

myPlane.layEgg()         // 문제 ===> 비행기가 알을 낳음



let museum = FlyingMuseum()     // 타입 정의 ===> 오직 Bird 클래스 밖에 안됨

museum.flyingDemo(flyingObject: myEagle)

museum.flyingDemo(flyingObject: myPenguin)

museum.flyingDemo(flyingObject: myPlane)    // Bird를 상속해야만 사용 가능

/**======================================================================
 
 - 프로토콜은 위와 같은 상황을 해결해주는 해결책이다.

 - 1) "fly()"라는 동작을 따로 분리해내어서, 굳이 상속을 하지 않고도 사용가능하게 만들려면?
 
 - 2) 꼭 클래스가 아닌, 구조체에서도 "fly()"기능을 동작하게 하려면?
 
======================================================================**/


/*:
 ---
 * 프로토콜의 도입 - 클래스와 상속의 단점을 보완 ⭐️
 ---
 */
// "fly()"라는 기능을 따로 분리해 내기


protocol CanFly {
    
    // 구체적인 구현은 하지 않음 → 구체적인 구현은 자격증을 채택한 곳에서

    func fly()
}

class Bird1 {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
}

class Eagle1: Bird1, CanFly {
    // isFemale
    // layEgg()
    
    func fly() {
        print("독수리가 하늘로 날아 올라 간다.")
    }
    
    func soar() {
        print("공중으로 활공한다.")
    }
}


class Penguin1: Bird1 {
    
    // isFemale
    // layEgg()
    
    func swim() {
        print("물 속을 헤엄칠 수 있다.")
    }
}


// 구조체에서 채택도 가능

struct Airplane1: CanFly {
    func fly() {
        print("비행기가 날아간다")
    }
}

// 박물관을 만듦

struct FlyingMuseum1 {
    
    func flyingDemo(flyingObject: CanFly) {     
        
        // 중요한 기능 ===> 프로토콜을 타입으로 인식
        
        flyingObject.fly()
        
    }
    
}

let myEagle1 = Eagle1()

myEagle1.fly()

myEagle1.layEgg()

myEagle1.soar()


let myPenguin1 = Penguin1()

myPenguin1.layEgg()

myPenguin1.swim()

// myPenguin1.fly()     // 더이상 펭귄이 날지 않음


let myPlane1 = Airplane1()

//myPlane1.layEgg()         // 더이상 비행기가 알을 낳지 않음

myPlane1.fly()


let museum1 = FlyingMuseum1()

museum1.flyingDemo(flyingObject: myEagle1)

//museum1.flyingDemo(flyingObject: myPenguin1)   // 더이상 "CanFly"자격증이 없는 펭귄은 날지 못함

museum1.flyingDemo(flyingObject: myPlane1)

// 예제 출처 (유데미 - 안젤라 님 강의)

// https://www.udemy.com/course/ios-13-app-development-bootcamp/

//: ---


/*:
 ## 2) 프로토콜(Protocols) 문법
 * 프로토콜의 기본 문법
 ---
 */

//:> 프로토콜?: 규약(약속) → "자격증"
// 1) 정의

protocol Myprotocol {
    
    // 최소한의 요구사항 나열
    
    func dosomething() -> Int
}

//:> 클래스에서 상속이 있는 경우, 1) 상위 클래스를 먼저 선언 후, 2) 프로토콜 채택 선언
class FamilyClass { }

// 2) 채택(클래스, 구조체, 열거형 다 가능)

class Myclass: FamilyClass, Myprotocol {
    
    // 상위클래스인 FamilyClass를 먼저 선언
    
    // 3) (속성/메서드) 구체적인 구현
    
    func dosomething() -> Int {
        
        return 10
    }
}

struct Mystruct: Myprotocol {
    
    // 3) (속성/메서드) 구체적인 구현
    
    func dosomething() -> Int {
        
        return 10
    }
}


enum MyEnum: Myprotocol {
    
    // 3) (속성/메서드) 구체적인 구현
    
    func dosomething() -> Int {
        
        return 10
    }
}


/*: ---
 - 프로토콜의 요구사항의 종류
 ---
 */

//: 프로토콜을 채택하려는 클래스, 구조체, 열거형에 최소한 이런 내용을 구현해야한다고 선언하는 부분


/*: 1. 속성 요구사항
 2. 메서드 요구사항 (메서드/생성자/서브스크립트)
 */

/*: ## 2-1) 속성의 요구사항 정의하는 방법
 - 속성 요구사항 정의
 ---
 */
protocol RemoteMouse {
    
    var id: String { get }
    
    // ===> let 저장속성 / var 저장속성 / 읽기계산속성 / 읽기,쓰기 계산속성
    
    var name: String { get set }
    
    // ===> var 저장속성 / 읽기,쓰기 계산속성

    static var type: String { get set }
    
    // ===> 타입 저장 속성 (static)
                                          
    // ===> 타입 계산 속성 (class)
}


// 채택하면, (최소한의)요구사항을 정확하게 따라서 구현해야함

struct TV: RemoteMouse {
    
    // var id: String = "456"
    
    var id: String {
        
        get {
            
            return "안녕하세요."
        }
        
        
        set {
            
        }
    }
    
    // var name: String = "삼성티비"
    
    var name: String {
        
        get {
            return "삼성티비"
        }
        
        set {
            
        }
    }
    
    static var type: String = "리모콘"
}

let myTV = TV()
myTV.id
myTV.name
TV.type

// 타입 속성 ===================================

// 1) 저장 타입 속성으로 구현

class SmartPhone: RemoteMouse {
    
    var id: String {
        
        return "777"
    }
    
    var name: String {
        
        get { "아이폰" }
        
        set { }
        
    }
    
    static var type: String = "리모콘"     // 타입 저장 속성은 (상속은 되지만) 재정의 원칙적 불가능
}


// 2) 계산 타입 속성으로 구현

class Ipad: RemoteMouse {
    
    var id: String = "777"
    
    var name: String = "아이패드"
    
    class var type: String {
        
        // 타입 계산 속성은 재정의 가능 (class키워드 가능)
        
        get { "리모콘" }
        
        set { }
    }
}

//: ---

/*: ## 2-2) 메서드의 요구사항 정의하는 방법
 - 메서드 요구사항 정의
 ---
 */

/**===============================================================
 
 [프로토콜 메서드 요구사항]
 
 - 메서드의 헤드부분(인풋/아웃풋)의 형태만 요구사항으로 정의
 
 - mutating 키워드: (구조체로 제한하는 것은 아님) 구조체에서 저장 속성 변경하는 경우, 구조체도 채택 가능하도록 허락하는 키워드
 
 - 타입 메서드로 제한 하려면, static키워드만 붙이면 됨
 
   (채택해서 구현하는 쪽에서 static / class 키워드 모두 사용 가능)
 
=================================================================**/


protocol RandomNumber {
    
    static func reset()
    
    func random() -> Int
}

class Number: RandomNumber {
    
    var num: Int = 0
    
    static func reset() {
        print("리셋")
    }
    
    func random() -> Int {
        
        return Int.random(in: 1...100)
    }
    
}

let calculator = Number()

calculator.random()

Number.reset()


struct Calculator: RandomNumber {
    
    var num = 0
    
    static func reset() {
        print("다시 셋팅")
    }
    
    func random() -> Int {
        
        return Int.random(in: 1...100)
    }
    
    mutating func numbering() {
        
        self.num = 10
    }
}


var calculator1 = Calculator()

Calculator.reset()
calculator1.random()
calculator1.numbering()

// 1) 정의

protocol Togglable {
    
    mutating func toggle()
    
    // mutating의 키워드는 메서드 내에서 속성 변경의 의미일뿐(클래스에서 사용 가능)
}


// 2) 채택 / 3) 구현


enum OnOffSwitch: Togglable {
    
    case on
    
    case off
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var s = OnOffSwitch.off

s.toggle()
s.toggle()


class BigSwitch: Togglable {
    
    var isOn = false
    
    
    func toggle() {
        isOn = isOn ? false : true
    }
}

var big = BigSwitch()

print(big.isOn)

big.toggle()

print(big.isOn)


/*: ---
 - 메서드 요구사항: 생성자 요구사항
 ---
 */
protocol SomeProtocol {     // 생성자를 요구사항으로 지정 가능
    
    init(num: Int)
}


/**===================================================================
 
 [생성자 요구사항] (실제 프로젝트에서 사용하는 경우 드뭄)
 
 - (1) 클래스는 (상속 고려해야함) 생성자 앞에 required를 붙여야함 (하위에서 구현을 강제)
 
       (구조체의 경우 상속이 없기 때문에, required키워드 필요 없음)
 
 - (2) 아니면 final을 붙여서 상속을 막으면 required 생략가능
 
 - (3) 클래스에서는 반드시 지정생성자로 구현할 필요없음(편의생성자로 구현도 가능)
 
 =====================================================================**/

// 예제 - 1 ======================

class SomeClass: SomeProtocol {
    
    required init(num: Int) {
        
        // 실제 구현
        
    }
}

class SomeSubClass: SomeClass {
    
    // 하위 클래스에서 생성자 구현 안하면 필수 생성자는 자동 상속
    
    // required init(num: Int)
    
}



// 예제 - 2 ======================

protocol AProtocol {
    
    init()
    
}

class ASuperClass {
    
    init() {
        
        // 생성자의 내용 구현
    }
}

class ASubClass: ASuperClass, AProtocol {
    
    // AProtocol을 채택함으로 "required" 키워드 필요하고, 상속으로 인한 "override(재정의)" 재정의 키워드도 필요
    
    required override init() {
        
        // 생성자의 내용 구현
    }
}

/*: ---
 - 생성자 요구사항 - 실패가능 생성자의 경우
 */

/**==========================================================
 
 (실패가능/불가능 생성자 요구사항)
 
 - init?() 요구사항 ➡︎  init() / init?() / init!()로 구현 (O)
 
 - init()  요구사항 ➡︎  init?() 로 구현 (X - 범위가 더 넓어지는 것 안됨)
 
 ===========================================================**/

// 실패가능 생성자

protocol AProto {
    
    init?(num: Int)        // (객체의 타입이 맞을까?)  AClass? <==== AClass은 범위가 속해있음
}


// 구조체에서 채택 (required 키워드는 필요없음)

struct AStruct: AProto {  // Failable/Non-failable 모두 요구사항을 충족시킴
    
    //init?(num: Int) {}
    
    init(num: Int)  {}
    
    //init!(num: Int)  {}     // 이것도 괜찮음
}


// 클래스에서 채택

class AClass: AProto {
    
    required init(num: Int) {}
    
}

/*: ---
 - 메서드 요구사항 - 서브스크립트 요구사항
 ---
 */

/**===================================================================
 
 [서브스크립트 요구사항]
 
 - get, set 키워드를 통해서 읽기/쓰기 여부를 설정 (최소한의 요구사항일뿐)
 
 - get키워드 ===> 최소한 읽기 서브스크립트 구현 / 읽기,쓰기 모두 구현 가능
 
 - get/set키워드 ===> 반드시 읽기,쓰기 모두 구현해야함
 
 =====================================================================**/


protocol DataList {
    
    subscript(idx: Int) -> Int { get }     // (서브스크립트 문법에서) get 필수 (set 선택)
}



struct DataStructure: DataList {
    
//    subscript(idx: Int) -> Int {    // 읽기 전용 서브스크립트로 구현한다면
//        get {
//            return 0
//        }
//    }
    
    subscript(idx: Int) -> Int {    // (최소한만 따르면 됨)
        get {
            return 0
        }
        set {                 // 구현은 선택
            // 상세구현 생략
        }
    }
}


/*: ---
 - (관습적인) 프로토콜 채택과 구현 - 확장(Extension)에서
 ---
 */

protocol Certificate {
    
    func doSomething()
    
}


class Person {
    
}

// 관습적으로 본체보다는 확장에서, 채택 구현 (코드의 깔끔한 정리 가능)

extension Person: Certificate {
    
    func doSomething() {
        
        print("Do something")
        
    }
}
