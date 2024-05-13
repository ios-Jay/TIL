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
