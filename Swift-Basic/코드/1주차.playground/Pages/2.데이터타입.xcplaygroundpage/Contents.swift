import UIKit

//: # 스위프트의 데이터 타입(Data Types)


/*: ## 1) 데이터 타입(Data Types)의 이해
 - 타입이 왜 필요할까?: 컴퓨터는 사람의 뇌와 다르다.
 ---
 */

//:> 데이터를 얼마 만큼의 크기, 그리고 어떤 형태로 저장할 것인지에 대해 약속이 필요
var i: Int = 4

var j: Int = 3


// i = 3.4       // 소수점 타입 할당이 안됨


var k = i + j

print(k)


// 타입은 메모리 공간의 크기와 연관이 있다.



/*:---
 - 스위프트(Swift)의 데이터 타입
 ---
 */
/**============================================================
 
Swift에서 사용하는 데이터타입: 스위프트는 모든 타입의 첫글자에 대문자를 사용
 
- 1) Int: 정수(Integer) 🔸
 
- 2) Float: 실수(부동소수점) Floating-point Number  6자리 소수점
 
 - 소수점 표현 가능(6자리까지의 정보를 정.확.하.게 저장)
 
- 3) Double: 실수(부동소수점) 15자리 소수점 🔸
 
 - 소수점 표현 가능(15자리까지의 정보를 정.확.하.게 저장)
 
- 4) Character: 문자(글자 한개)
 
- 5) String: 문자열 🔸
 
- 6) Bool: 참과 거짓 🔸

- 7) 기타: UInt, UInt64, UInt32, UInt16, UInt8:  0, 그리고 양의 정수
 
===============================================================**/

var intNumber1: Int = 3

var doubleNumber1: Double = 3   // 정수형 3이 아닌 실수형 3

print(intNumber1)   // 정수 3

print(doubleNumber1)    // 정수 3이 아닌 실수형으로 표현되는 3.0

let chr: Character = "🤣"

type(of: chr)           // 타입을 확인하는 방법

// let chr1: Character = "🤣🤣"

// 당연히 에러 발생. 글자 하나이므로


let chr2: Character = " "

// 빈문자는 에러발생 그러나 공백문자는 가능

let str: String = ""   // 빈문자열 저장가능

let str1: String = "안녕하세요"



/*: ## 2) 타입 주석(Type Annotation)
 - 변수를 선언하면서, 타입도 명확하게 지정하는 방식
 ---
 */
// 1. 변수를 선언(타입 선언: 메모리 공간을 먼저 생성)

var myNumber: Int

// 2. 값을 저장(초기화: 데이터를 저장)

myNumber = 10

// 3. 값을 읽기

print(myNumber)


// 자료형을 명확하게 지정

var n1: Int = 8

var n2: Int = 88

// 타입 선언과 초기화

var value: Double = 3.141592

value = 3.141592653589793 // 값 바꾸기

var pi = value


Double.pi



/*: ## 3) 타입 추론(Type Inference)
 - 타입을 지정하지 않아도, 컴파일러가 타입을 유추해서 (알아서 알맞는 타입으로 저장하는) 방식
 ----
 */

// 값을 보고, 어떤 타입인지를 컴파일러가 추론해서 사용함




var myString = "아메리카노"

type(of: myString)

print(type(of: myString))

var n3 = 4

var d1 = 5.6

var isPrime = false





/*: ## 4) 타입 안정성(Type Safety)
 - 스위프트는 데이터 타입을 명확하게 구분하여 사용하는 언어
 ---
 */

//:> 스위프트는 다른 타입끼리 계산할 수 없다.

let n4 = 3

// let d2: Double = n4

// 호환되지 않음(메모리 공간의 크기가 다름)




let d3 = 0.14



// let result = n4 + d3 // 정상적인 계산 불가능

//  소수 + 정수를 더할 수 없다.

// "안녕" + 5 를 더할 수 없다.

/*: ## 5) 타입(형) 변환(Type Conversion)
 - 타입을 변환해서 사용할 수 있는 방법은 있다!
 ---
 */

//:> 기존에 메모리에 저장된 값을 다른 형식으로 바꿔서, 새로운 값을 생성해서 다른 메모리 공간에 다시 저장
let numberOfString = "123456789"


let numberOfInt = Int(numberOfString)

print(numberOfInt)

print(numberOfInt!)

if numberOfInt != nil {
    
    print(numberOfInt!)
}

if let myNumberOfInt = numberOfInt {
    
    print(myNumberOfInt)
}



// 타입컨버전이 실패했을 때 ====> nil(값이 없음)이 리턴될 수 있다.

let piOfString = "3.141592"


let piOfInt = Int(pi)



let d4 = 2

let d5 = Double(d4)


print(d4)

print(d5)




var dataTypeNumber: Int = Int(3.14)

print(dataTypeNumber)




//:> 결국 데이터를 메모리라는 공간에 어떤 크기 / 어떤 형태로 저장할 것인지에 관한 문제



/*: ## 6) 타입 애일리어스(Type Alias)
 - 별칭 붙이기: 수학에서 치환과 유사
 ---
 */
typealias Name = String // 왼쪽에 치환된 별칭이 위치
/*:
 ---
 - 기존에 선언 되어있는 타입에 새로운 별칭을 붙여 코드 가독성을 높이는 문법
---
 */
// Name타입이 의미하는 것은 String과 완전히 동일

let positionName: Name = "후방 플레이메이커"


// 스위프트에서는 어떤 형태든 치환이 가능

typealias Something = (Int) -> String


func someFunction(completionHandler: (Int) -> String) {
 
}


func someFunction2(completionHandler: Something) {
 
}
