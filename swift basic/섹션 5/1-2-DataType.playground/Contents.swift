import UIKit

 
// 1) 스위프트의 데이터 타입에 대한 이해
 
// - 변수의 선언과 저장
 

var a: Int = 3

// 변수를 선언하면서 저장 (메모리 공간을 먼저 생성하는 동시에 데이터 저장)

// 1) 데이터 타입에 대한 이해

// 타입(Type)이 왜 필요할까?

// 컴퓨터는 사람의 뇌와 다르다.

// 데이터를 얼마 만큼의 크기, 어떤 형태로 저장할 것인지에 대한 약속이 필요

var i:Int = 5

var j:Int = 10

// i = 5.5 ->이미 정수형으로 저장되었기때문에 소수점 타입 할당이 안됨.



/**============================================================
Swift에서 사용하는 데이터타입
 
- 1) Int: 정수(Integer) 🔸
 
- 2) Float: 실수(부동소수점) Floating-point Number  6자리 소수점
 
- 3) Double: 실수(부동소수점) 15자리 소수점 🔸:Swift에서 주로 사용
 
- 4) Character: 문자(글자 한개) -> Ex) "A", "B", "C", "가", " "(공백문자)...
 
- 5) String: 문자열 🔸 -> EX) "안녕하세요", "Swift", ""(빈문자열)
 
- 6) Bool: 참과 거짓 🔸 -> True 또는 False를 저장

- 7) 기타: UInt, UInt64, UInt32, UInt16, UInt8:  0, 그리고 양의 정수
 
- 스위프트에서 타입에 관한 키워드는 모두 대문자로 시작한다.
===============================================================**/


// Int : ... -5 -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 ...

// Double: ... -3.145673, ... ,-2.2315, ... , 0 , ... , 0.453255, ..., 7.45678, ...



var b: Int = 7

var c: Double = 3



let chr: Character = "1"
type(of: chr)           // 타입을 확인하는 방법



//let chr2: Character = "aa"


let chr3: Character = " "      // 빈문자는 에러발생 그러나 공백문자는 가능


let str: String = ""   // 빈문자열 저장가능


let str1: String = "안녕하세요"


// 2) 타입 주석:변수를 선언하면서 타입도 명확하게 지정하는 방식

var number:Int // 1) 변수를 선언 (타입 선언)

number = 10    // 2) 값을 저장 (초기화)

// 메모리 공간을 먼저 생성하고, 데이터를 저장

print(number)  // 3) 값을 읽기


// 자료형을 명확하게 지정


var a1:Int = 10

var b1:Int = 20

// 타입 선언과 초기화

var value: Double = 1.2345

value = 12.3 // 값바꾸기

var value2 = value

// 3) 타입추론:타입을 지정하지 않아도 컴파일러가 타입을 유추하는 방식


//값을 보고, 어떤 타입인지를 컴파일러가 추론해서 사용함

var name3 = "홍길동"

type(of: name3)


// 4) 타입 안정성:스위프트는 데이터 타입을 명확하게 구분하여 사용하는 언어

// 스위프트는 다른 타입끼리 계산할 수 없다.

let num5 = 7

//let num6 = num5 -> 호환되지 않음(메모리 공간의 크기가 다름)


let d = 12

let e = 3.14

// let result = d + e (정상적인 계산 불가능)

// 소수와 정수를 더할 수 없다.

// 다른 타입끼리 더할 수 없다. 즉, "안녕" + 5를 더할 수 없다.

// 5) 타입(형) 변환(Type Conversion)

// 타입을 변환해서 사용할 수 있는 방법은 있다!

//기존에 메모리에 저장된 값을 다른 형식으로 바꿔서, 새로운 값을 생성해서 다른 메모리 공간에 다시 저장


let str2 = "123"
let number7 = Int(str2)

print(number7)



let str3 = "123.4"

let number2 = Int(str3)           // 타입컨버전이 실패했을 때 ====> nil(값이 없음)이 리턴될 수 있다.

print(number2)




let n = 2
let n2 = Double(n)

print(n2)





let n3: Int = Int(2.4)
print(n3)






// 타입(Type):타입은 왜 필요할까?

// 결국 데이터를 메모리라는 공간에 어떤 크기 / 형태로 저장할 것인가의 문제

// 타입 변환(Conversion):타입을 변환해서 사용하는 방법

var number123 = "123" // Stirng 타입

var number1234 = Int(number123) // 타입 변환

print(number123) //Int 타입으로 변환


var saySomething = "안녕" //String 타입

var saySomething2 = Int("안녕") // 변환이 안됨

// nil: 값이 없음을 나타내는 키워드

var doubleOfNum = 3.141592 // Double 타입

var doubleOfNum2 = Int(doubleOfNum) // 타입변환(소수점 버림)

print(doubleOfNum2) // Int 타입

// 데이터가 변환이 되지 않거나, 데이터가 유실 될 수 있다는 점을 주의


