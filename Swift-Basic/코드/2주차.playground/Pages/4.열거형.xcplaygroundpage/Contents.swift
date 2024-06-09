import UIKit

/*:# 열거형

 */

/*: ## 열거형(Enumerations)
 - 연관된 상수(케이스)들을 하나의 이름으로 묶은 자료형
 ---
 */
/**==============================
 
 - 케이스가 선택 가능한(한정된) 가짓 수로 정해져 있을때 정의

 - 타입 자체를 한정된 사례(Case) 안에서 정의할 수 있는 타입

 - 커스텀 타입이므로 대문자로 시작

 - 사례(Case)의 경우는 소문자로 시작.

 - Swift 3 이전에는 대문자였으나 4부터 소문자로 시작
 ==============================**/



enum Weekday {
    
    case monday
    
    case tuesday
    
    case wednesday
    
    case thursday
    
    case friday
    
    case saturday
    
    case sunday
}

enum CompassPoint {
    
    case north, south, east, west
}

// 이러한 형식으로 코드를 작성한다.


/*: ---
 - 언제 열거형을 사용하는가?
 ---
 */
/**=====================================
 
 [한정된 사례(정해진 갯수) 안에서 정의할 수 있을때]
 
 - 월 / 화 / 수 / 목 / 금 / 토 / 일
 
 - 동 / 서 / 남 / 북
 
 - 좌로 정렬 / 가운데 정렬 / 우측 정렬
 
 - 초등학교 / 중학교 / 고등학교 / 대학교
 
 - 남 / 여
 
 - 가위 / 바위 / 보
 
 ======================================**/

// 열거형을 사용하면 코드의 가독성과 안정성이 높아짐

// ===> 명확한 분기 처리 가능: Switch문과 함께 쓰임


/*: ---
 - 열거형 타입
 - ---
 */

//:> 열거형은 타입이다!
var today: Weekday = Weekday.sunday

// 타입을 명시하였기 때문에 var today = .sunday 로도 표현 가능하다.

// 물론 today = Weekday.tuesday 라는 표현식도 당연히 가능하다.

// 월요일인 경우만 특정한 처리를 하고 싶을때

if today == .monday {
    
}

// 모든 각각의 경우를 처리하고 싶을때

if today == .monday {
    print("오늘은 월요일입니다.")
} else if today == .tuesday {
    print("오늘은 화요일입니다.")
} else if today == .wednesday{
    print("오늘은 수요일입니다.")
} else if today == .thursday{
    print("오늘은 목요일입니다.")
} else if today == .friday{
    print("오늘은 금요일입니다.")
} else if today == .saturday{
    print("오늘은 토요일입니다.")
} else {
    print("오늘은 일요일입니다.")
}

//:> 열거형은 항상 Switch문으로 분기처리 가능
switch today {
    
case .monday:
    print("오늘은 월요일입니다.")
case .tuesday:
    print("오늘은 화요일입니다.")
case .wednesday:
    print("오늘은 수요일입니다.")
case .thursday:
    print("오늘은 목요일입니다.")
case .friday:
    print("오늘은 금요일입니다.")
case .saturday:
    print("오늘은 토요일입니다.")
case .sunday:
    print("오늘은 일요일입니다.")
}


//: ---

/*: ## 열거형의 원시값과 연관값
 - 열거형의 원시값(Raw Values)
 ---
 */

//:> 열거형의 원시값은 매칭되는 기본값(정수/문자열)을 정해, 열거형을 좀 더 쉽게 활용 가능
/**======================
 
 - 열거형을 정의를 할때 Hashable한 타입을 써주는 것을 원시값이라고 한다.

 - 여러가지 형태로 원시값을 정의 가능 (Hashable한 - Int / String / Character / Double 등 가능)

 - 숫자를 순차적으로 매칭 시키는 것이 일반적. 0, 3, 4 같은 경우는 거의 X

 - 간단하게 말해서 원시값은 "숫자를 매칭시키는 것이다." 라고 생각하면 된다.
 
 
 ============================**/

enum Alignment: Int {
    
    case left
    
    case right
    
    case up
    
    case down
    
}


// 원시값 입력안하면 0, 1, 2  이렇게 자동으로 저장됨 (정수의 경우 숫자가 하나씩 증가)

// 1(설정시), 2, 3

// 0, 2(설정시), 3

var num: Alignment = Alignment(rawValue: Int.random(in: 0...3))!

let align = Alignment(rawValue: 2)

// print(align)

// 접근연산자를 통해 원시값 자체에도 접근 가능

let leftValue = Alignment.left.rawValue


/*:---
 - 원시값의 활용
 ---
 */

//:> 숫자 또는 문자열과 매칭시켜 자유롭게 활용 가능 (숫자 ←→ 열거형 타입)
// 가위 바위 보 열거형 만들기

enum RPS: Int {
    
    case rock
    
    case paper
    
    case scissors
}

/*
 
 RpsGame.rock와 RpsGame(rawValue: 0)는 사실 다르다.
 
 RpsGame(rawValue: 0)은 옵셔널 타입이다.
 
 예를 들어, RpsGame(rawValue: 0)의 경우,
 
 원시값이 0이지만 다른 숫자가 들어갈 수 있다.
 
 그러면 생성이 되지 않으므로 nil을 출력하게 된다.
 
 다른 값이 출력될 수 있기 때문에 nil을 리턴하게 되는 것이다.
 
 var game = RpsGame(rawValue: 5) --> 타입을 확인해보면 옵셔널 확인 가능
 
 */



// 출력은 하지만, 문자열은 아님에 주의

// 타입을 명시했을 경우 옵셔널 열거형 타입이므로 언래핑해서 사용해야 한다.

var myChoice: RPS = RPS(rawValue: Int.random(in: 0...2))!

var comChoice: RPS = RPS(rawValue: Int.random(in: 0...2))!

// 실제 앱을 만들때는


RPS(rawValue: 0)

RPS(rawValue: 1)

RPS(rawValue: 2)



// 논리적으로 nil이 될 수 없다면

let number = Int.random(in: 1...100) % 3

// 3을 조금 더 멋지게 처리할 수 있는 것은 고급내용에서 다룸

print(RPS(rawValue: number)!)   // 자체가 열거형 타입





switch myChoice {
    
case .rock:
    print("당신의 선택은 바위입니다.")
    
case .paper:
    print("당신의 선택은 보 입니다.")
    
case .scissors:
    print("당신의 선택은 가위입니다.")
    
}


switch comChoice {
    
case .rock:
    print("컴퓨터의 선택은 바위입니다.")
case .paper:
    print("컴퓨터의 선택은 보 입니다.")
case .scissors:
    print("컴퓨터의 선택은 가위입니다.")
}

if myChoice == comChoice {
    print("비겼습니다.")
    
} else if myChoice == .rock && comChoice == .scissors {
    print("당신이 이겼습니다.")
} else if myChoice == .paper && comChoice == .rock {
    print("당신이 이겼습니다.")
} else if myChoice == .scissors && comChoice == .paper {
    print("당신이 이겼습니다.")
} else {
    print("당신은 졌습니다.")
}
/*: ---
 - 열거형의 연관값(Associated Values)
 ---
 */


//:> 열거형의 연관값은 구체적인 추가정보를 저장하기 위해 사용
enum FCBarcelona {
    
    case player(name: String, uniformNumber: Int)
    
    case profile1(nation: String, age: Int)
    
    case profile2(position: String, isRightFoot: Bool)
    
}

/*
 
 추가적인 정보를 저장할 수 있음
 
 각 케이스별로 상이한 특징이 있고, 그것을 저장 / 활용할 필요가 있을 때

 개별케이스마다 저장할 형식을 따로 정의(자료형에 제한이 없음 / 튜플의 형태)
 
 하나의 케이스에 서로 다른 연관값을 저장할 수 있음
 
 ===> 선언 시점이 아니라, 새로운 열거형 값을 생성할때 저장
 

 연관값을 만들어 내는 것은 사실상 무한대로 찍어 낼 수 있다.
 
 그래서 연관값을 사용하는 이 개념은,
 
 이 케이스들은 어떤 카테고리의 역할밖에 하지 못한다.
 
 구체적인 내용은 따로 저장.
 
 연관값은 카테고리라고 비유하면 된다.
 
 연관값은 카테고리이고 그 카테고리에 해당하는
 
 구체적인 값을 저장할 떄는 연관값을 사용.
 
 */


let myPlayer1 = FCBarcelona.player(name: "레반도프슼", uniformNumber: 9)

let myPlayer2 = FCBarcelona.player(name: "페드리", uniformNumber: 8)

let myPlayer3 = FCBarcelona.profile2(position: "포워드", isRightFoot: true)

// 원시값을 활용한다면 ====> 불가능

// 정보가 바뀔때마다 무한대로 케이스를 만들고 싶을 때

// 원시값은 사용 X 따라서 연관값 사용




/*: ---
 - 원시값(Raw Values)과 연관값(Associated Values)의 차이
 ---
 */
/**=============================================================================
 
 - 1) 자료형 선언 방식: 선언하는 위치가 다름
 
 - 2) 선언 형식: (1) 원시값 ===> 2가지중 1가지 선택 / (2)연관값 ===> 튜플의 형태로 형식 제한 없음
 
 - 3) 값의 저장 시점: (원시값: 선언시점 / 연관값: 새로운 열거형 값을 생성할때 )
 
 - 4) 서로 배타적: 하나의 열거형에서 원시값과 연관값을 함께 사용하는 것은 불가능 함.
 
=================================================================================**/



/*: ---
 - 연관값(Associated Values)의 활용
 ---
 */
var mySquard: FCBarcelona = FCBarcelona.profile1(nation: "스페인", age: 2007)



switch mySquard {
case .player(name: "라민 야말", uniformNumber: 33):
    print("바르셀로나의 라민 야말입니다.")
case .profile1(nation: "스페인", age: 2007):
    print("국적은 스페인이며 나이는 2007년생입니다.")
case .profile2(position: "인사이드 포워드", isRightFoot: false):
    print("포지션은 인사이드 포워드이며, 주로 쓰는 발은 왼발입니다.")
default:
    break
}

switch mySquard {
    
case .player(name: let n, uniformNumber: let u):
    print("이 선수의 이름은 \(n)이며, 등번호는 \(u)입니다.")
case .profile1(nation: let n, age: let a):
    print("국적은 \(n)이며 나이는 \(2007)년생 입니다.")
case .profile2(position: let p, isRightFoot: let i):
    print("포지션은 인사이드 포워드이고, 주로 쓰는 발은 \(i)이 아닙니다.")
default:
    break
}

/*: ## 옵셔널 타입에 대한 정확한 이해
 - 스위프트의 옵셔널(Optional) 타입
 ---
 */
/**==========================
 
 옵셔널 타입 이라는 것은 내부적으로는 case가 구현이 되어 있는데
 
 .some case의 연관값이 지정된 케이스와
 
 .none case가 이렇게 두 가지 케이스가 구현되어 있는 것이 바로 옵셔널 타입이라는 것이다.
 
 
 - 옵셔널 타입의 내부 구현
 
   enum Optional<Wrapped> {     // 제네릭 문법
       case some(Wrapped)
       case none
   }
 
 결론: 옵셔널 타입이라는 것은 내부적으로 열거형으로 구현이 되어 있는 것이다.
 
============================**/

//:> 예시: 옵셔널 타입이라는 것은 이러한 열거형으로 구현 되어 있음

enum Optional {
    
    case some(Int)
    
    case none
}

var num1: Int? = 7

// 열거형(한정된 사례)

// Optional.some(7): 실제 내부 구현

var n1: Optional = Optional.some(7)

// Optional.none: 실제 내부 구현

var n2 = Optional.none

// 연관값: 구체적인 정보를 저장, 카테고리와 같은 개념

// if let 바인딩의 내부 구현 모습:연관값을 꺼내서 쓰는 것

switch num1 {
    
case .some(let a):  // let a = 7
    
    // 열거형 case 패턴을 활용해서, 내부 연관값을 꺼냄
    
    print(a)
    
case .none:
    
    print("nil")
     
     // print(num1!)
}


//:> 결론: 옵셔널 타입이라는 것은 내부적으로 열거형으로 구현이 되어 있는 것이다.
// nil이라는 것은 값이 없음을 나타내는 키워드. 진짜 값이 없는게 아니고 나타내는 것

// 그래서 사실은 none이었던 것이고 none인 경우에 강제로 값을 벗기면 실제 값이 메모리에 없기 때문에 에러 발생

// 결국 none이라는 것은 열거형의 어떤 케이스일 뿐이다.


/*
 
 if let 바인딩 실제 내부 구현 모습: 결국 연관값을 꺼내서 쓰는 것이라고 이해하면 됨
 
 switch num1 {

 case Optional.some(let a):
     
    print(a)
     
 case Optional.none:
     
    print("nil")
     
 }
 
 */
 

// .none은 명시적인 열거형으로 표현한 것이고, 일반적으로는 값이 없다는 의미의 nil키워드를 사용할뿐

//:> .none과 nil은 완전히 동일

/*: ## 열거형과 Switch문
 - 열거형의 정의와 Switch문을 통한 활용
 ---
 */

//:> 열거형에 대한 구체적인 처리는 스위치(switch)문과 함께 쓸때, 사용성이 높아짐
// 로그인 타입을 정의

enum LoginProvider: String {
    
    case email
    case facebook
    case google
}

let userLogin = LoginProvider.facebook


// 열거형은 항상 스위치문과 쓰인다고 생각해도 무방하다.

// 열거형은 한정된 사례로 만든 타입이고,

// 스위치문은 표현식에 대한 분기처리에 최적화

switch userLogin {                   // 3가지로 분기처리
    
case .email:
    
    print("이메일 로그인")
    
case .facebook:
    
    print("페이스북 로그인")
    
case .google:
    print("구글 로그인")
    
}




// 물론 특정한 경우도 처리 가능

if LoginProvider.email == userLogin {
    
    print("이메일 로그인")
    
}

/*: ## 열거형에 (연관값이 없고), 옵셔널 열거형의 경우
 - switch문의 편의성 (열거형 case 패턴):Enumeration Case Pattern
 ---
 */
// 열거형은 if문이 아닌 switch문으로 처리한다고 생각하면 된다.

// 열거형의 선언

/*
 
 옵셔널 열거형이라는 것은 열거형 타입 그 자체에 ?를 붙였다는 의미이다.
 
 열거형 내부에 열거형이 나열되어 있는 코드
 
 */

enum SomeEnum {
    
    case left
    
    case right
    
}


// 타입을 다시 옵셔널 열거형으로 선언 ⭐️

let x: SomeEnum? = .left


/**==================================================
 
 [SomeEnum?의 의미] 옵셔널 열거형
 
 - 값이 있는 경우 .some ===> 내부에 다시 열거형 .left /.right
 
 - 값이 없는 경우 .none ===> nil
 
=====================================================**/


// 원칙

switch x {
    
case .some(let value):
    
    // Optional.some(let value) = Optional.some(SomeEnum.left)  ⭐️
    switch value {
    case .left:
        print("왼쪽으로 돌기")
    case .right:
        print("오른쪽으로 돌기")
    }
case .none:
    
    print("계속 전진")
}



// 편의적 기능 제공 ⭐️

switch x {
case .some(.left):
    print("왼쪽으로 돌기")
case .some(.right):
    print("오른쪽으로 돌기")
case .none:
    print("계속 전진")
}



// 전체적으로 full name으로 풀어서 쓴다면..

/*
 
 switch x {
 case Optional.some(SomeEnum.left):
     print("왼쪽으로 돌기")
 case Optional.some(SomeEnum.right):
     print("오른쪽으로 돌기")
 case Optional.none:
     print("계속 전진")
 }
 
 */

/*: ---
 - 스위치문의 편의성
 ---
 */

//:> switch문에서 옵셔널 열거형 타입을 사용할때, 벗기지 않아도 내부값 접근가능

// 스위치문은 옵셔널 열거형 타입의 사용시, 편의성을 제공


switch x {     // 예전에는 x! 라고 써줘야 했음 (스위치문에서 옵셔널 타입도 ok)
case .left:
    print("왼쪽으로 돌기")
case .right:
    print("오른쪽으로 돌기")
case nil:
    print("계속 전진")
}

/*: ## 열거형에 연관값이 있는 경우
 - 1. 연관값(Associated Values)이 있는 경우와 switch문 (열거형 case 패턴) - Enumeration Case Pattern
 ---
 */

/**==========================================
 
 - 연관값이 있는 열거형의 활용 (열거형 case 패턴) ⭐️
 
 - 구체적 정보(연관값)를 변수에 바인딩(let/var가능)하는 패턴
 
 [열거형 case 패턴]
 
 - case Enum.case(let 변수이름):
 
 - case let Enum.case(변수이름):
 
 [스위치문 뿐만 아니라, 조건문/반복문에서도 활용가능]
 
 - 1) switch문 (대부분)
 
 - 2) if / guard / for-in / while (필요한 경우)
 
 ===========================================**/

// 연관값이 있는 열거형 - 구체적인 정보가 연관값에 들어 있음

// 구체적인 정보를 꺼내서 사용해야하는, 로직 구현의 문제와 연관


// 이름, 국적, 나이, 키, ,몸무게, 포지션, 득점, 어시스트



enum MyFCBarcelona {
    
    case profile1(name: String, nation: String)
    
    case profile2(age: Int, height: Double, weight: Double)
    
    case profile3(position: String, goals: Int, assist: Int)
    
}

var myProfile1 = MyFCBarcelona.profile1(name: "라민 야말", nation: "스페인")

var myProfile2 = MyFCBarcelona.profile2(age: 2007, height: 181.7, weight: 61.0)

var myProfile3 = MyFCBarcelona.profile3(position: "인사이드 포워드", goals: 6, assist: 9)

switch myProfile1 {
case .profile1(let name, let nation):
    print("\(name) 선수의 국적은 \(nation) 입니다!!!")
case .profile2(let age, let height, let weight):
    print("이 선수의 키는\(height)cm이며 몸무게는 \(weight)Kg입니다. 그리고 나이는 \(age)년생 입니다.")
case .profile3(let position, let goals, let assist):
    print("이 선수의 포지션은 \(position)이며 득점과 어시스트는 \(goals), \(assist) 입니다.")
default:    // 대부분 default문이 필요하기도 함
    break
}


// 연관값을 가지고 있는 열거형의 경우, 원하는 로직으로 잘 정의해서 처리해야하는 것에 주의

/*: ---
 - 2.연관값(Associated Values)이 있는 경우, if / guard / for-in / while 문 (열거형 case 패턴)
 ---
 */


// 값 하나를 사용하기 위해서, 스위치문을 전체를 다 써야하는 불편함이 있었음

switch myProfile2 {

case .profile2(let age, let height, let weight):
    print("이 선수의 키는\(height)cm이며 몸무게는 \(weight)Kg입니다. 그리고 나이는 \(age)년생 입니다.")
default:
    break
}


//:> 특정 케이스만 다루기 위해서 if문이나 반복문(for문) 사용 가능
enum Computer {                         // 3가지로 정의
    
    case cpu(core: Int, ghz: Double)
    
    case ram(Int, String)
    
    case hardDisk(gb: Int)
    
}


var chip = Computer.cpu(core: 8, ghz: 3.1)

chip = Computer.hardDisk(gb: 128)    // 256



// if문에서도 스위치문에서 사용하는 case문과 같이 사용 가능 ⭐️

if case Computer.hardDisk(gb: let gB) = chip {
    
    print("\(gB)기가 바이트 하드디스크임")
}



if case Computer.hardDisk(gb: let gB) = chip, gB == 256 {    // 처리를 다양하게 활용 가능
    
    print("256기가 바이트 하드디스크임")
}






let chiplists: [Computer] = [
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .ram(16, "SRAM"),
    .ram(32, "DRAM"),
    .cpu(core: 8, ghz: 3.5),
    .hardDisk(gb: 500),
    .hardDisk(gb: 256)
]



for case let .cpu(core: c, ghz: h) in chiplists {    // 배열중에서 특정 케이스만 뽑아서 활용 가능 ⭐️
    print("CPU칩: \(c)코어, \(h)헤르츠")
}


// 일반 for문과 비교 =====> 모든 경우

for chip in chiplists {
    print("\(chip)")
}


/*: ---
 - 열거형 케이스 패턴(for문) - 옵셔널타입 요소 배열
 ---
 */
// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우

let arrays: [Int?] = [nil, 2, 3, nil, 5]

for case .some(let number) in arrays {
    
    print("Found a \(number)")
    
}


/*: ## 옵셔널 패턴(Optional Pattern)
 - 옵셔널 타입에서 열거형 케이스 패턴을 더 간소화한 옵셔널 패턴(Optional Pattern)
 ---
 */

//:> 열거형 내부에 "연관값"을 사용시 ➞ 1) 열거형 케이스 패턴 / 2) 옵셔널 패턴

let a: Int? = 1


// 1) 열거형 케이스 패턴 (앞에서 배운)

switch a {
case .some(let z):
    print(z)
case .none:  // nil이라고 써도됨
    print("nil")
}


// 2) 옵셔널 패턴 (현재 배울)

switch a {
case let z?:      // .some을 조금 더 간소화하는 문법   // let z? = Optional.some(a)
    print(z)
case nil:         // .none 이라고 써도됨
    print("nil")
}

/*:---
 - 옵셔널 패턴의 사례(열거형 케이스 패턴과 비교)
 ---
 */
// 옵셔널타입으로 선언

let num2: Int? = 7

print(num)



// 1) 열거형 케이스 패턴

switch num2 {
case .some(let x):      // let x = num
    print(x)
case .none:
    break
}


// 2) 옵셔널 패턴 (.some을 ? 물음표로 대체 가능한 패턴)

switch num2 {
case let x?:           // let x? = Optional.some(num)
    print(x)
case .none:
    break
}



// 특정 사례만 다루는 (if문) ================================

// 1) 열거형 케이스 패턴

if case .some(let x) = num2 {
    print(x)
}



// 2) 옵셔널 패턴 (.some을 ? 물음표로 대체 가능한 패턴)

if case let x? = num2 {        // "옵셔널(?) 물음표를 띄어내고, x 상수로 보자"의 의미라고 생각하면 됨
    print(x)
}


/*: ---
 - 옵셔널 패턴(for문) - 옵셔널타입 요소 배열
  ---
 */

// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우, 옵셔널 패턴을 사용하면 편리함

let arrays1: [Int?] = [nil, 2, 3, nil, 5]



// 1) 열거형 케이스 패턴

for case .some(let number) in arrays1 {
    print("Found a \(number)")
}



// 2) 옵셔널 패턴

for case let number? in arrays1 {
    print("Found a \(number)")
}

/*:## Unknown 키워드
 - 만약, 열거형의 케이스가 늘어난다면 항상 올바른 처리를 하고 있다고 말할 수 있을까?
 ---
 */

// 만약에 로그인의 경우의 수가 늘어난다면 (Non-frozen 열거형 / 얼지않은)

// (프로젝트에서 실제 늘어날 수 있는 경우가 많음)

enum LoginProvider1: String {      // 3가지 케이스 ===> 4가지 케이스
    case email
    case facebook
    case google
    case kakaotalk
}


let userLogin1 = LoginProvider1.email



// 스위치문은 (특히, 열거형)표현식에 대한 분기처리에 최적화

// (다만, 열거형의 케이스가 늘어나는 경우에 대한 안정성 보장은 별개)

switch userLogin1 {                // 처리하는 방식을 조금 변형
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
// case .google:
//    print("구글 로그인")
default:
    
    // default블럭만 추가해두는 것이 안전할까? ⭐️
    
    print("구글 로그인")
}

// 여기서는 간단히 눈에 보일 수 있지만, 실제 프로젝트에서는 찾기 힘듦



/*: > 처리하는 로직이 항상 옳다는 보장을 하지 못함
 - 에러는 나지 않을 수 있지만, 로직이 옳다고 할 수 없음
 
 */



/*: ---
 - @unknown 어트리뷰트를 활용하는 방법 - Swift 5.0 ~
 ---
 */

/**===================================================
 - @unknown 키워드를 default블럭에 추가해둠
 
 - switch문에서 열거형의 모든 케이스를 다루지 않는 경우,
   스위치문에서 모든 열거형의 케이스를 다루지 않았다고
   경고를 통해 알려줌 ===> 개발자의 실수 가능성을 컴파일 시점에 알려줌
 
 - "Switch must be exhaustive"로 알려줌
 =====================================================**/

// unknown: 알려지지 않은


switch userLogin1 {
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
case .google:
    print("구글 로그인")
@unknown default:
    print("그 외의 모든 경우")
}



