import UIKit

// 타입 에일리어스(Type Alias):별칭 붙이기

// 타입 에일리어스:프로그래밍에서 (수학의) 치환과 동일한 문법

// 타입만 치환시켜서 사용 가능

// typealias Name = String


// 코드 어디에서나 한줄로 타입 별칭을 붙이는 위와 같은 문법을 선언하면됨

// (왼쪽에 치환된 별칭이 위치)

// 기존에 선언되어 있는 타입에 새로운 별칭을 붙여 코드의 가독성을 높이는 문법

// 왼쪽에 치환된 별칭이 위치
typealias Name = String



// Name타입이 의미하는 것은 String과 완전히 동일
let name: Name = "홍길동"


// 스위프트에서는 어떤 형태든 치환이 가능

typealias Something = (Int) -> String


func someFunction(completionHandler: (Int) -> String) {
 
}


func someFunction2(completionHandler: Something) {
 
}
