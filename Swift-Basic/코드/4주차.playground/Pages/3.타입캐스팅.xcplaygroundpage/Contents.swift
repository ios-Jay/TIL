import UIKit

/*: # 타입캐스팅(Type Casting)
 */

/*: ## 타입 캐스팅
 - 인스턴스 타입을 검사 - is 연산자 / 클래스 계층 상의 타입 변환 - as 연산자
 ---
 */

//:> 상속: 기본적으로 데이터(저장 속성)를 추가하는 관점에서 생각
class Person {
    
    var id = 0
    
    var name = "이름"
    
    var email = "abc@gmail.com"
    
}


class Student: Person {
    
    // id
    
    // name
    
    // email
    
    var studentId = 1
}



class Undergraduate: Student {
    
    // id
    
    // name
    
    // email
    
    // studentId
    
    var major = "전공"
}



let person1 = Person()

person1.id

person1.name

person1.email



let student1 = Student()

student1.id

student1.name

student1.email

student1.studentId // 추가적으로



let undergraduate1 = Undergraduate()

undergraduate1.id

undergraduate1.name

undergraduate1.email

undergraduate1.studentId

undergraduate1.major    //  추가적으로


/*: ---
 - 인스턴스 타입을 검사하는 - is 연산자 (Type Check Operator)
 ---
 */

//:> is 연산자 - 타입에 대한 검사를 수행하는 연산자
/**==================================
 
 - 인스턴스 is 타입   (이항연산자)
 
   ▶︎ 참이면 true 리턴
 
   ▶︎ 거짓이면 false 리턴
 
 - 상속관계의 계층에서 포함관계를 생각해보면 쉬움
 
=====================================**/


// 사람 인스턴스는 학생/대학생 타입은 아니다. (사람 타입이다.)

person1 is Person                // true

person1 is Student               // false

person1 is Undergraduate         // false


// 학생 인스턴스는 대학생 타입은 아니다.  (사람/학생 타입이다.)

student1 is Person               // true

student1 is Student              // true

student1 is Undergraduate        // false


// 대학생 인스턴스는 사람이거나, 학생이거나, 대학생 타입 모두에 해당한다.

undergraduate1 is Person         // true

undergraduate1 is Student        // true

undergraduate1 is Undergraduate  // true




// 예제를 통한 활용

let person2 = Person()

let student2 = Student()

let undergraduate2 = Undergraduate()


let people = [person1, person2, student1, student2, undergraduate1, undergraduate2]


// 학생 인스턴스의 갯수를 세고 싶다.

var studentNumber = 0

for someOne in people {
    
    if someOne is Student {
        
        studentNumber += 1
    }
}


print(studentNumber)



/*: ---
 - 인스턴스 타입의 (메모리구조에 대한) 힌트를 변경하는 - as 연산자 (type cast operator)
 ---
 */
//:> as 연산자

/**===================================================================
 
 - 타입캐스팅 / 타입캐스팅 연산자 (이항 연산자)
 
 (1) Upcasting (업캐스팅)
 
 - 인스턴스 as 타입
 
 - 하위클래스의 메모리구조로 저장된 인스턴스를 상위클래스 타입으로 인식

 (2) Downcasting (다운캐스팅) (실패가능성이 있음)
 
 - 인스턴스 as? 타입  / 인스턴스 as! 타입
 
   ▶︎ as? 연산자
 
    - 참이면 반환타입은 Optional타입
 
    - 실패시 nil 반환
 
   ▶︎ as! 연산자
 
    - 참이면 반환타입은 Optional타입의 값을 강제 언래핑한 타입
 
    - 실패시 런타임 오류
 
 [타입캐스팅의 의미]
 
 - 인스턴스 사용시에 어떤 타입으로 사용할지(속성/메서드) 메모리구조에 대한 힌트를 변경하는 것
 
 - 메모리의 값을 수정하는 것이 아님
 
 - (단순히 해당 타입의 인스턴스인 것처럼 취급하려는 목적)
 
======================================================================**/

let person: Person = Undergraduate()

person.id

person.name

person.email

// person.studentId    // Value of type 'Person' has no member 'studentId'

// person.major          // Value of type 'Person' has no member 'major'



/**=========================
 
 [Undergraduate인스턴스]
 
 - id: 0
 
 - name: "이름"
 
 - email: "abc@gmail.com"
 
 - studentId: 0
 
 - major: "전공"
 
 ==========================**/

// 그런데, 왜 studentId 와 major 속성에는 접근이 되지 않을까? ⭐️

// person2변수에는 Person타입이 들어있다고 인식되는 것임

// ===> 그래서 접근불가 ===> 접근하고 싶다면 메모리구조에 대한 힌트(타입)를 변경 필요


//:> as? / as! (다운캐스팅)

let ppp: Undergraduate? = person as? Undergraduate  // Undergraduate? 타입

if let ppp = person as? Undergraduate {
    
    ppp.id
    ppp.major
    ppp.email
    ppp.name
    ppp.studentId
}

if let newPerson = person as? Undergraduate {
    
    // if let 바인딩과 함께 사용 (옵셔널 언래핑)
    
    newPerson.major
    
    print(newPerson.major)
    
}

// 실제로 인스턴스의 접근 범위를 늘려주는 것 뿐임

let person3: Undergraduate = person as! Undergraduate

person3.major


//:> as (업캐스팅)
let undergraduate3: Undergraduate = Undergraduate()

undergraduate3.id

undergraduate3.name

undergraduate3.studentId

undergraduate3.major

// undergraduate2.name = "길동"




let person4 = undergraduate3 as Person

// 항상 성공 (컴파일러가 항상 성공할 수 밖에 없다는 것을 알고 있음)

person4.id

person4.name

// person4.studentId

// person4.major


/*: ---
 - 참고) as 연산자의 활용
 ---
 */

//:> Bridging (브릿징) ➞ 서로 호환되는 형식을 캐스팅해서 쉽게 사용하는 것

// 스위프트에서는 내부적으로 여전히 Objective-C의 프레임워크를 사용하는 것이 많기 때문에

// 서로 완전히 상호 호환이 가능하도록 설계해놓았음(completely interchangeable)

// 타입 캐스팅을 강제(as!)할 필요 없음


let str: String = "Hello"   // 스위프트의 String

let otherStr = str as NSString

//: ---

/*: ## 타입과 다형성(Polymorphism)
 - 상속관계에서 인스턴스의 다형성에 대한 이해
 ---
 */
class Player {
    var name: String
    var height: Double
    var weight: Double
    var age: Int
    
    init(name: String, height: Double, weight: Double, age: Int) {
        self.name = name
        self.height = height
        self.weight = weight
        self.age = age
    }
    
    
    func run() {
        print("달린다.")
    }
}


class FootballPlayer: Player {
    
    // name
    // height
    // weight
    // age
    var position = "미드필더"
    
    override func run() {       // 재정의 메서드. run() - 1
        print("축구 선수가 달린다.")
    }
    
    func shooting() {
        print("축구 선수가 슛을 때린다.")
    }
}

class KoreanNationalFootballPlayer1: FootballPlayer {
    
    let nation = "대한민국"
    
    override func run() {       // 재정의 메서드. run() - 2
        
        print("대한민국의 축구선수가 달린다.")
    }
    
    override func shooting() {  // 재정의 메서드. shooting() - 1
        
        print("대한민국의 축구선수가 슛을 떄린다.")
    }
    
    func koreanPlayer() {
        print("이 선수의 국적은 대한민국 입니다.")
    }
}


let player1 = Player(name: "손흥민", height: 183.0, weight: 78.0, age: 1992)

player1.run()

let footballPlayer1: Player = FootballPlayer(name: "김민재", height: 190.0, weight: 81.0, age: 1996)

footballPlayer1.run()
// footballPlayer1.shooting()

let koreanFootballPlayer1 = KoreanNationalFootballPlayer1(name: "이강인", height: 174.0, weight: 72, age: 2001)

// let koreanFootballPlayer1: Player = KoreanNationalFootballTeam(name: <#T##String#>, height: <#T##Double#>, weight: <#T##Double#>, age: <#T##Int#>)

koreanFootballPlayer1.run()
koreanFootballPlayer1.shooting()
koreanFootballPlayer1.koreanPlayer()

/*: ---
 - 다형성(Polymorphism) ⭐️ (여러가지 모양)
 ---
 */
/**================================================================
 
 [다형성(Polymorphism)]
 
 - 하나의 객체(인스턴스)가 여러가지의 타입의 형태로 표현될 수 있음을 의미.
 
   (또는 하나의 타입으로 여러 종류의 객체를 여러가지 형태(모습)로 해석될 수 있는 성격)
 
 - 다형성이 구현되는 것은 "클래스의 상속"과 깊은 연관이 있음(향후 배울 프로토콜과도 연관)
 
===================================================================**/

// 객체 지향의 4대 특징 다형성에 대한 개념 참고





let athleticPlayer: [Player] = [Player(name: "손흥민", height: 183.0, weight: 78.0, age: 1992), FootballPlayer(name: "김민재", height: 190.0, weight: 81.0, age: 1996), KoreanNationalFootballPlayer1(name: "이강인", height: 174.0, weight: 72, age: 2001)]


for person in athleticPlayer {
    
    person.run()
}

// 하나씩


athleticPlayer[0].run()     // Player 타입으로 인식(Player 타입)
athleticPlayer[1].run()     // Player 타입으로 인식(FootballPlayer 타입)
athleticPlayer[2].run()     // Player 타입으로 인식(KoreanNationalFootballPlayer 타입)


/**============================================================
 
 - 업캐스팅된 타입(Person) 형태의 메서드를 호출하더라도 실제 메모리에서 구현된
 
   "재정의된" 메서드(Undergraduate의 메서드 테이블)가 호출되어 실행 ⭐️
 
 - 타입의 저장 형태는 속성/메서드에 대한 접근가능 범위를 나타내는 것이고,
 
   다형성은 인스턴스에서 메모리의 실제 구현 내용에 대한 것임
 
   (메서드는 재정의 가능하고, 메서드 테이블을 통해 동작)
 
 =============================================================**/



//:> 상속관계에서 다형성은 메서드를 통해 발현

//: ---


/*: ## Any와 AnyObject를 위한 타입 캐스팅
 - Any와 AnyObject 타입
 ---
 */
/**===================================================================
 
 - 스위프트에서 제공하는 불특정한 타입을 다룰 수 있는 타입을 제공
 
 1) Any 타입
 
 - 기본 타입(Int, String, Bool, ...) 등 포함, 커스텀 클래스, 구조체, 열거형, 함수타입
   까지도 포함해서 어떤 타입의 인스턴스도 표현할 수 있는 타입 (옵셔널타입도 포함)
 
 2) AnyObject 타입
 
 - 어떤 클래스 타입의 인스턴스도 표현할 수 있는 타입
 
======================================================================**/

// 1) Any타입 ============================================

// some.count -> Any타입에는 .count 메서드가 존재 X, 그러므로 실행 불가능


var some: Any = "Swift"

(some as! String).count

var some1 = some as! String

some = 10

some = 3.2

print(some)

// 단점 ===> 저장된 타입의 메모리 구조를 알 수 없기 때문에, 항상 타입캐스팅해서 사용해야함 ⭐️


class Being {
    
    var name = "이름"
    var age = 10
}


class SuperBeing {
    var name = "이름"
    var weight = 100
}

// Any타입의 장점: 모든 타입을 담을 수 있는 배열을 생성 가능

// (String) -> String

let array: [Any] = [10, "안녕", 3.14, Being(), SuperBeing(), {(name: String) in return name}]


// array[1].count // Any 타입이므로 에러 발생. 다운캐스팅 하여 사용

(array[1] as! String).count

let objArray: [AnyObject] = [Being(), SuperBeing(), NSString()]


// objArray[0].name

(objArray[0] as! Being).name

// 타입캐스팅 + 분기처리

for (index, item) in array.enumerated() {
    
    // (0,  5)
    
    // (1, "안녕")
    
    // (2, 3.5)
    
    // ...
    
    switch item {
    case is Int:
        // item is Int
        print("Index - \(index): 정수입니다.")
    case let num as Double:
        // let num = item as Double
        print("Index - \(index): 소수 \(num)입니다.")
    case is String:
        // item is String
        print("Index - \(index): 문자열입니다.")
    case let being as Being:
        // let person = item as Person
        print("Index - \(index): 사람입니다.")
        print("이름은 \(being.name)입니다.")
        print("나이는 \(being.age)입니다.")
    case is (String) -> String:                   // item is (String) -> String
        print("Index - \(index): 클로저 타입입니다.")
    default:
        print("Index - \(index): 그 이외의 타입입니다.")
    }
}



// let num as Double:의미

// let num = item as? Double: if let 바인딩처럼 성공하는 경우에만 담기기 때문에 ? 생략

/*: ---
 - 옵셔널 값의 Any 변환
 ---
 */

/**==================================================================
 
- 의도적인 옵셔널값의 사용
 
- Any는 모든 타입을 포함하므로, 의도적인 옵셔널값을 사용하려면 Any타입으로 변환하면
 
  컴파일러가 알려주는 경고를 없앨 수 있음
 
- 왜?
 
- 옵셔널값은 임시적인 값일 뿐이므로, 일반적으로 개발자들은 옵셔널 바인딩을 해서
 
  언래핑해서 안의 값을 사용해야함 ===> 그래서 경고를 통해 알려줌
 
  (Any로 변환하겠다는 것은 그 자체를 사용하겠다는 의미임 ===> 경고 없음)
 
==================================================================**/



let optionalNumber: Int? = 3

print(optionalNumber)          // 경고

print(optionalNumber as Any)   // 경고 없음
