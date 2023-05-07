import UIKit

// 튜플:순서쌍

//2개 이상의 연관된 데이터(값)을 저장하는 Compound(복합 / 혼합) 타입

// 특별하게 타입이 정해져 있지 않음

// 포함될 데이터 갯수를 마음대로 정의하기 나름

// 옵션키를 누른채로 변수 혹은 상수를 마우스로 클릭하면 타입 확인 가능

let twoNumbers: (Int, Int) = (1, 2)
//type(of: twoNumbers) ->타입을 알려주는 함수

let threeNumbers = (1, 2, 5)

var threeValues = ("홍길동", 20,  "서울")

// 멤버(데이터의 종류 및 갯수)는 튜플을 만들때 결정되므로 "추가"/"삭제" 불가

// 원하는 연관된 데이터의 조합으로 어떤 형태든 만들 수 있는 타입

// 예시) 좌표(Int, Int), 3차원공간(Int, Int, Int)

// 타입 에일리어스를 이용해서, 치환해서 사용가능

// typealias GridPoint = (Int, Int)

// 연관된 값(튜플)의 각각의 데이터의 접근

//컴퓨터에서는 숫자를 매길 때 항상 0부터 시작한다.

threeValues.0 //->"홍길동"
threeValues.1 //-> 20
threeValues.2 //->"서울"



// 튜플의 문법

// Named Tuple:이름이 매겨진 튜플, 코드의 가독석이 높아짐

// 데이터의 각 요소에 이름을 붙일 수 있음

// let iOS = ("Swift", "5.5")

 let iOS = (language:"Swift", version:"5.5")


// 튜플의 분해:튜플의 각 요소를 각각 상수 / 변수화 가능(바인딩)

// 데이터를 분해해서 활용할 수 있게 됨



let(name, age, address) = ("홍길동", "20", "서울")

print(name)
print(age)
print(address)


let (first, second, third) = threeNumbers //let first = 1, second = 2, third = 5
first
second
third


