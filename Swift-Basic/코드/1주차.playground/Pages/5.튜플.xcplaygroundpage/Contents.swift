import UIKit

//: # 튜플


/*: ## 1) 튜플(Tuples)
 - 2개 이상의 연관된 데이터(값)를 저장하는 Compound(복합 / 혼합) 타입
 ---
 */
// 특별하게 타입이 정해져 있지 않음

// 포함될 데이터의 갯수를 마음대로 정의하기 나름

let twoNumbers: (Int, Int) = (1, 3)

type(of: twoNumbers)

let threeNumbers = (1, 3, 5)

type(of: threeNumbers)

var profile = ("이름", 30, "거주지")

type(of: profile)

// 멤버(데이터의 종류 및 갯수)는 튜플을 만들때 결정되므로 "추가"/"삭제" 불가


/*:----
 - 연관된 값(튜플)의 각각의 데이터에 대한 접근
 ---
 */
profile.0

profile.1

profile.2

/*:---
 - Named Tuple(이름이 매겨진 튜플): 일반적으로 위처럼 사용하면, 혼동할 가능성이 큼
 ---
 */
let player = (natioanlTeam: "대한민국", club: "토트넘 핫스퍼", uniformNumber: 7)

// 코드의 가독성이 높아짐

player.natioanlTeam

player.club

player.uniformNumber


/*: ## 2) 튜플과 Switch문
 
 - 튜플의 매칭(Matching)
 ---
 */
let fcBarcelonaPlayer = (name: "쥘 쿤데", uniformNumber: 23)


if fcBarcelonaPlayer.0 == "쥘 쿤데" && fcBarcelonaPlayer.1 == 23 {
    
    print("Fc 바르셀로나 소속 \(fcBarcelonaPlayer.name) 입니다.")
    
}


if fcBarcelonaPlayer == ("쥘 쿤데" , 23) {
    
    print("Fc 바르셀로나 소속의 등번호 \(fcBarcelonaPlayer.1)번 \(fcBarcelonaPlayer.name) 선수 입니다.")
}



/*:---
 - 스위프트의 switch문은 튜플 매칭을 지원: 코드를 단순한 형태로 표현 가능
 
 ---
 */
let iOS = (language: "Swift", version: "5")

switch iOS {
    
case ("Swift", "5"):
    
    print("스위프트 버전 5입니다.")
    
case ("Swift", "4"):
    
    print("스위프트 버전 4입니다.")
    
default:
    
    break
}


/*: ---
 - 튜플의 활용: 튜플의 where절 활용
 ---
 */
var coordinate: (Int, Int) = (Int.random(in: -10...10), Int.random(in: -10...10))



switch coordinate {
    
case (let x, let y) where x == y:
    print("(\(x), \(y))의 좌표는 y = x 함수의 그래프 위에 있다.")
case (let x, let y) where x == -y:
    print("(\(x), \(y))의 좌표는 y = -x 함수의 그래프 위에 있다.")
case (let x, let y):
    print("(\(x), \(y))의 좌표는 y = x 또는 y = -x 함수의 그래프가 아닌 임의의 점에 있다.")
}
