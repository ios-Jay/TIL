import UIKit

/*: # 프로토콜(Protocols)
 */

/*: ## 프로토콜(Protocols)
 - 프로토콜의 필요성에 대한 인식
 ---
 > 프로토콜: 영어로 규약 / 협약
 */

//: - 프로토콜? 규약/협약(약속)  → "자격증" / "리모콘"

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

/*: ---
 ## 3-1) 타입으로써의 프로토콜(Protocols as Types)
 - 프로토콜은 타입이다.
 ---
 */

//:> 프로토콜은 타입이다!


// 프로토콜은 ===> First Class Citizen(일급객체)이기 때문에, 타입(형식)으로 사용할 수 있음

// 일급객체: 타입으로 사용 가능. 변수에 할당 가능, 파라미터로 전달 가능, 프로토콜 반환 가능



protocol RemoteController {
    
    func turnOn()
    
    func turnOff()
}

class Tv: RemoteController {
    
    func turnOn() {
        print("Tv 켜기")
    }
    
    func turnOff() {
        print("Tv 끄기")
    }
}

struct SetTopBox: RemoteController {
    
    func turnOn() {
        print("셋톱박스 켜기")
    }
    
    func turnOff() {
        print("셋톱박스 끄기")
    }
    
    func doNetflix() {
        print("넷플릭스 시청하기")
    }
}

// 타입 캐스팅

var tv: RemoteController = Tv()
tv.turnOn()
tv.turnOff()

var sBox: RemoteController = SetTopBox()

sBox.turnOn()
sBox.turnOff()
// sBox.doNetflix()

/*: ---
 - 프로토콜 타입 취급의 장점
 ---
 */
// 프로토콜의 타입 취급의 장점 - 1 ⭐️

// 프로토콜의 형식으로 담겨있음

let electronic: [RemoteController] = [tv, sBox]

for item in electronic {
    
    // 켜기, 끄기 기능만 사용하니 타입캐스팅을 쓸 필요도 없음 (다만, 프로토콜에 있는 멤버만 사용가능)
    
    item.turnOn()
}

// 프로토콜의 타입 취급의 장점 - 2 ⭐️

func turnOnSomeElectronics(item: RemoteController) {
    
    item.turnOn()
    
}

turnOnSomeElectronics(item: tv)

turnOnSomeElectronics(item: sBox)


/*: ---
 - 프로토콜 준수성 검사
 ---
 */
/**==================================================================================
 
 - is / as 연산자 사용가능

 - is 연산자 ===> 특정 타입이 프로토콜을 채택하고 있는지 확인 (참 또는 거짓) / 그 반대도 확인가능
 
 - as 연산자 ===> 타입 캐스팅 (특정 인스턴스를 프로토콜로 변환하거나, 프로토콜을 인스턴스 실제형식으로 캐스팅)
 
====================================================================================**/


// 1) is연산자 ==============================

// 특정타입이 프로토콜을 채택하고 있는지 확인

tv is RemoteController

sBox is RemoteController


// 프로토콜 타입으로 저장된 인스턴스가 더 구체적인 타입인지 확인 가능

electronic[0] is Tv

electronic[1] is SetTopBox




// 2) as연산자 ==============================

// 업캐스팅(as)

let newBox = sBox as RemoteController

newBox.turnOn()

newBox.turnOff()



// 다운캐스팅(as?/as!)

let sbox2: SetTopBox? = electronic[1] as? SetTopBox

sbox2?.doNetflix()

// (electronic[1] as? SetTopBox)?.doNetflix()


//: ---


/*: ## 3-2) 기타 프로토콜(Protocols)관련 문법
 - 프로토콜은 1) 프로토콜 간에 상속이 가능하고 2) 다중 상속이 가능
 ---
 */

//:> 프로토콜도 상속이 가능 / 다중 상속이 가능 (어짜피 여러가지 요구사항의 나열일뿐)
protocol MyRemote {
    
    func turnOn()
    
    func turnOff()
}

protocol AirConRemote {
    
    func Up()
    
    func Down()
    
}


protocol SuperRemoteController: MyRemote, AirConRemote {
    
    // 프로토콜끼리, 상속 구조를 만드는 것이 가능 ⭐️
    
    // func turnOn()
    
    // func turnOff()
    
    // func Up()
    
    // func Down()
    
    
    func doSomething()
    
    
}

// 프로토콜의 채택 및 구현

class HomePot: SuperRemoteController {
    
    func turnOn() { }
    
    func turnOff() { }
    
    func Up() { }
    
    func Down() { }
    
    func doSomething() { }
}

/*: ---
 - 클래스 전용 프로토콜 (AnyObject)
 ---
 */
// 클래스 전용 프로토콜로 선언

// (AnyObject프로토콜을 상속)

protocol SomeProtocol1: AnyObject {
    
    // AnyObject는 클래스 전용 프로토콜
    
    func doSomething()
}


// 구조체에서는 채택할 수 없게 됨 ⭐️

//struct AStruct: SomeProtocol {
//
//}


// 클래스에서만 채택 가능
class AClass1: SomeProtocol1 {
    func doSomething() {
        print("Do something")
    }
}

/*: ---
 - 프로토콜 합성(Protocol Composition) 문법
 ---
 */
// 프로토콜을 합성하여 임시타입으로 활용 가능 ⭐️

protocol Named {
    
    var name: String { get }
}

protocol Aged {
    
    var age: Int { get }
}


// 하나의 타입에서 여러개의 프로토콜을 채택하는 것 당연히 가능 (다중 상속과 비슷한 역할)

struct Person1: Named, Aged {
    
    var name: String
    var age: Int
}


// 프로토콜을 두개를 병합해서 사용 하는 문법(&로 연결)

func wishHappyBirthday(to celebrator: Named & Aged) {   // 두 가지 프로토콜을 채택
    
    // 임시적인 타입으로 인식
    
    print("생일축하해, \(celebrator.name), 넌 이제 \(celebrator.age)살이 되었구나!")
}


let birthdayPerson = Person1(name: "홍길동", age: 20)

wishHappyBirthday(to: birthdayPerson)



let whoIsThis: Named & Aged = birthdayPerson      // 임시적인 타입으로 저장 (두개의 프로토콜을 모두 채택한 타입만 저장 가능)


(whoIsThis as! Person1).name

//: ---

/*: ## 4) 선택적 요구사항의 구현(Optional Protocol Requirements)
 - 어트리뷰트
 ---
 */
/**==================================================================================
 
 - 어튜리뷰트 키워드
 
 - @available, @objc, @escaping, @IBOutlet, @IBAction 등등

 - Attribute(어트리뷰트) ===> 컴파일러에게 알려주는 특별한 신호이자, 추가적인 정보를 제공 (2가지 종류가 있음)
 
 - https://docs.swift.org/swift-book/ReferenceManual/Attributes.html

 - 1) 선언에 대한 추가정보 제공
 
 - 2) 타입에 대한 추가정보 제공


 - 사용 방법
 
 - @어트리뷰트이름          ======> (예시)  @available
 
 - @어트리뷰트이름(아규먼트)  ======> (예시)  @available(iOS *)
 
==================================================================================**/


@available(iOS 10.0, macOS 10.12, *)

class SomeType {
    
}

/*: ---
 - 선택적인(구현해도 되고 안해도 되는) 멤버선언하기
 ---
 */
/**========================================================================
 
 - @objc는 스위프트로 작성한 코드를 오브젝티브C 코드에서도 사용할 수 있게 해주는 어트리뷰트
 
 - 프로토콜에서 요구사항 구현시, 반드시 강제하는 멤버가 아니라 선택적인 요구사항으로 구현할때 사용
 
 - 프로토콜 앞에는 "@objc"추가
 
 - 멤버 앞에는 "@objc optional"을 모두 추가
 
==========================================================================**/

@objc protocol Remote {
    
    @objc optional var isOn: Bool { get set }
    
    func turnOn()
    
    func turnOff()
    
    @objc optional func doNeflix()
    
}

class TVObjc: Remote {
    
    var isOn = false
    
    func turnOn() {}
    
    func turnOff() {}
    
}

/**========================================================
 
 - 선택적 멤버를 선언한 프로토콜 구현시
 
 - 오브젝티브-C에 해당하는 클래스 전용 프로토콜임 (구조체, 열거형 채용 불가) ⭐️
 
 - (오브젝티브C는 구조체와 열거형에서 프로토콜 채택을 지원하지 않음)
 
==========================================================**/

let tv3: TVObjc = TVObjc()

print(tv3.isOn)   // Bool타입



let tv4: Remote = TVObjc()

print(tv4.isOn)          // Bool? 타입 (선택적 구현 사항이기 때문에 해당 멤버가 없으면 ===> nil로 반환)

tv4.doNeflix?()          // (선택적으로 선언했기 때문에, 함수가 없을 수도 있음 ===> 옵셔널체이닝 필요)


//: ---



/*: ## 5) 프로토콜의 확장(Protocol Extension)
 - 프로토콜의 확장 - 프로토콜 지향 프로그래밍 ⭐️
 ---
 */


protocol Remocon {
    func turnOn()
    func turnOff()
}

// 채택 → 실제구현해야함(여러타입에서 채택한다면 반복적으로 구현해야하는 점이 불편)

class TV1: Remocon {
    
    func turnOn() {
        <#code#>
    }
    
    func turnOff() {
        <#code#>
    }
    
    //func turnOn() { print("리모콘 켜기") }
    //func turnOff() { print("리모콘 끄기") }
}

// 채택 ===> 실제구현해야함(여러타입에서 채택한다면 반복적으로 구현해야하는 점이 불편)

struct Aircon1: Remocon {
    
    func turnOn() {
        <#code#>
    }
    
    func turnOff() {
        <#code#>
    }
    
    //func turnOn() { print("리모콘 켜기") }
    //func turnOff() { print("리모콘 끄기") }
}


//:> 프로토콜의 확장 ➞ 기본(디폴트) 구현 제공 ⭐️

/**==============================================================================
 - (귀찮은 방식으로) 프로토콜을 채택한 모든 타입에서, 실제 구현을 계속적으로 반복해야하는 불편함을 덜기 위해
 - "프로토콜 확장"을 제공해서 메서드의 디폴트 구현을 제공함 (코드의 중복을 피할 수 있음)
===============================================================================**/


extension Remocon {
    
    // (요구사항의 메서드 우선순위 적용 - 프로토콜 메서드 테이블 만듦)
    
    // 1. (채택)구현시 해당 메서드 2. 기본 메서드
    func turnOn() { print("리모콘 켜기") }
    
    // 1. (채택)구현시 해당 메서드 2. 기본 메서드
    func turnOff() { print("리모콘 끄기") }
    
    func doAnotherAction() {               // (요구사항 메서드 X - 테이블 만들지 않음)
        print("리모콘 또 다른 동작")            // 타입에 따른 선택 (Direct Dispatch)
    }
    
    
    
}

/*: ---
 - 프로토콜의 확장을 통한 다형성 제공 - 프로토콜 지향 프로그래밍
 ---
 */

// 클래스 ⭐️ ==================================================

class Ipad1: Remocon {
    func turnOn() { print("아이패드 켜기") }

    func doAnotherAction() { print("아이패드 다른 동작") }
}


/**=================================================
 [Class Virtual 테이블]
 - func turnOn()          { print("아이패드 켜기") }
 - func turnOff()         { print("리모콘 끄기") }
 - func doAnotherAction() { print("아이패드 다른 동작") }
====================================================**/


let ipad: Ipad1 = Ipad1()
ipad.turnOn()           // 클래스 - V테이블
ipad.turnOff()          // 클래스 - V테이블
ipad.doAnotherAction()  // 클래스 - V테이블

// 아이패드 켜기
// 리모콘 끄기
// 아이패드 다른 동작



/**=====================================
 [Protocol Witness 테이블] - 요구사항
 - func turnOn()  { print("아이패드 켜기") }
 - func turnOff() { print("리모콘 끄기") }
========================================**/


let ipad2: Remocon = Ipad1()
ipad2.turnOn()           // 프로토콜 - W테이블
ipad2.turnOff()          // 프로토콜 - W테이블
ipad2.doAnotherAction()  // 프로토콜 - Direct (직접 메서드 주소 삽입)

// 아이패드 켜기
// 리모콘 끄기
// 리모콘 또 다른 동작





// 구조체 ⭐️ ==================================================

struct SmartPhone1: Remocon {
    func turnOn() { print("스마트폰 켜기") }

    func doAnotherAction() { print("스마트폰 다른 동작") }
}


/**=====================================
 [구조체] - 메서드 테이블이 없음
========================================**/


// 본래의 타입으로 인식했을때
var iphone: SmartPhone1 = SmartPhone1()
iphone.turnOn()             // 구조체 - Direct (직접 메서드 주소 삽입)
iphone.turnOff()            // 구조체 - Direct (직접 메서드 주소 삽입)
iphone.doAnotherAction()    // 구조체 - Direct (직접 메서드 주소 삽입)

// 스마트폰 켜기
// 리모콘 끄기
// 스마트폰 다른 동작



/**=====================================
 [Protocol Witness 테이블] - 요구사항
 - func turnOn()  { print("스마트폰 켜기") }
 - func turnOff() { print("리모콘 끄기") }
========================================**/


// 프로토콜의 타입으로 인식했을때
var iphone2: Remocon = SmartPhone1()
iphone2.turnOn()            // 프로토콜 - W테이블
iphone2.turnOff()           // 프로토콜 - W테이블
iphone2.doAnotherAction()   // 프로토콜 - Direct (직접 메서드 주소 삽입)

// 스마트폰 켜기
// 리모콘 끄기
// 리모콘 또 다른 동작



//: ---

/*: ## 6) 프로토콜 확장의 적용 제한
 - (전 강의에서 다룬)프로토콜의 확장
 ---
 */
protocol Remote1 {
    
    func turnOn()        // 요구사항
    
    func turnOff()       // 요구사항
}


extension Remote1 {
    
    func turnOn() { print("리모콘 켜기") }
    
    func turnOff() { print("리모콘 끄기") }
    
}


/*: ---
 - 프로토콜 확장 - 형식을 제한 가능
 ---
 */
protocol Bluetooth {
    
    func blueOn()
    
    func blueOff()
}

/**====================================================
 
 - 프로토콜 확장에서 where절을 통해, 프로토콜의 확장의 적용을 제한 가능
 
 - "특정 프로토콜"을 채택한 타입에만 프로토콜 확장이 적용되도록 제한
 
    where Self: 특정프로토콜
 
 - 특정 프로토콜을 채택하지 않으면, 프로토콜의 확장이 적용되지 않기 때문에
 
   (확장이 없는 것과 동일하게) 메서드를 직접구현 해야함
 
=======================================================**/


// 특정 프로토콜을 채택한 타입에만 프로토콜 확장이 적용되도록 제한

// (Remote 프로토콜을 채택한 타입만 확장 적용 가능)

extension Bluetooth where Self: Remote1 {   // self:타입 자기 자신 ->smartPhone
    
    // 본 확장의 적용을 제한시키는 것 가능 (구체적 구현의 적용범위를 제한)
    
    func blueOn() { print("블루투스 켜기") }
    
    func blueOff() { print("블루투스 끄기") }
}


// Remote프로토콜을 채택한 타입만 Bluetooth 확장이 적용됨

// Remote프로토콜을 채택하지 않으면 ===> 확장이 적용되지 않기 때문에 직접 구현 해야함

class SmartPhone2: Remote1, Bluetooth {
    
    
}

let sphone = SmartPhone2()

sphone.turnOn()           // 리모콘 켜기

sphone.turnOff()          // 리모콘 끄기

sphone.blueOn()           // 블루투스 켜기

sphone.blueOff()          // 블루투스 끄기

