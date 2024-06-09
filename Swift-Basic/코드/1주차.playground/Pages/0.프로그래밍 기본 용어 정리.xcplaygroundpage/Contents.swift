import UIKit


/*:# Programming Basic
*/

//: ---

/*:## 1) 프로그래밍에서 사용하는 = (등호)의 의미
 * 프로그래밍에서 사용하는 = (equal)은 할당의 의미이다. (할당연산자)
 ---
*/


//: >  = (등호)는 같다는 뜻이 아니다:  = (등호)를 기준으로 오른쪽에 있는 무언가를 왼쪽에 담는다는 의미(할당)


var a = 10

a = a + 10

print(a)

var b = 5

b = b + 5

var c = a + b

print(c)

// 프로그래밍에서 같다는 것은 == 를 사용

// ==  (같다)

// !=  (같지 않다)

//: ---


/*:## 2) 대문자와 소문자의 엄격한 구분
 
 - 대부분의 첫글자는 소문자로 시작한다.(예외적으로 대문자 시작)
 
 ---
 
 */


/*:
 
 1. 중간에는 대문자 / 숫자가 쓰일 수 있다. 다만, 시작은 소문자
 2. 캐멀케이스(camel: 낙타의 등처럼 대문자가 쓰이기 때문에 붙은 이름)
 
 */

var myName = "고양이"

var fcBarcelonaPlayer = "라민 야말"

var randomOfIntNumber: Int = Int.random(in: 1...10)

var isTrue = true

func doSomething() {
    
    print("Do something")
    
}


func plusFunction(num1: Int, num2: Int) -> Int {
    
    
    return num1 + num2
    
}

//: ---

/*:## 3) 키워드(Keyword)
 
 * 약속어(스위프트에서 특별한 의미로 사용하겠다고 미리 정해 놓은 단어
 
 ---
 */


// 약 70여개의 키워드가 존재

// var, if, func, return, nil, class, struct, final....

//: ---

/*: ## 4) 주석(Comment)
 * 컴퓨터가 코드를 읽지 않아도 된다고(무시해도 된다고) 알려주는 부분
 ---
 
 */

//: >   //  : 한 줄 주석,  /* */ : 여러줄 주석



var nameOfCat = "고양이"


print("꽁꽁 얼어 붙은 한강 위로 \(nameOfCat)가 걸어다닙니다.")


// print("꽁꽁 얼어 붙은 한강 위로 \(nameOfCat)가 걸어다닙니다.")


/*
 
 func sayHello() {
     
     
     print("안녕")
     print("Hello")
     
     
 }

 
 */

//: ---

/*: ## 5) 세미콜론(;)규칙(Semicolon)
 
 * 스위프트(Swift)에서 각 라인의 마지막에 붙는 세미콜론(;)은 선택사항
 
 ---
 */
//  (대부분의 프로그래밍 언어는 세미콜론 필수)

//  하나의 라인에 여러가지 명령문을 사용하고 싶을 경우에는 필수


var name = "스위프트"

print("Hello, world")



print("안녕"); print("드디어"); print("스위프트 공부를 시작한다.");

//: ---

/*: ## 6) 줄맞추기!
 
 * 일반적으로 중괄호 안에서 들여쓰기(Indentation)를 통해, 코드의 가독성을 높임
 
 ---
 
 */


//: > 들여쓰기는 코드의 가독성을 높이기 위한 프로그래머들간의 약속
// 4칸 들여쓰기는 기본 설정


var randomNumber = Int.random(in: 1...3)


if randomNumber == 1 {
    print("1")
} else if randomNumber == 2 {
    print("2")
} else if randomNumber == 3 {
    print("3")
}

//: ---

/*: ## 7) 리터럴(Literals)
 
 * 코드에서 고정된 값으로 표현되는 문자(데이터) 그 자체(Int/Double/String/Character/Bool 리터럴 등
 
 ---
 
 */
var num1 = 10   // 정수형 리터럴 10 == Int 10 == 정수 10

var num2: Int = 100     // 정수형 리터럴 100

let nameOfForward: String = "레반도프스키" // 문자열 리터럴 "레반도프스키"

let nameOfGk = "테어 슈테겐" // 문자열 "테어 슈테겐"

let pi = 3.14   // 더블 리터럴 3.14, // 더블형 3.14

var isFalse: Bool = false   // Bool 리터럴 false(거짓)

//: ---

/*: ## 8) 식별자(Identifier)
 
 * 변수, 상수, 함수, 사용자 정의 타입의 이름
 
 ---
 
 
 */
var player1 = "발데"    // 식별자: player1

var player2 = "쿤데"    // 식별자: player2


//: ---

/*: ## 9) 토큰(Token)
 
 * 코드의 가장 작은 단위: 코드에서 더이상 쪼갤 수 없는 최소의 단위 (식별자, 키워드, 구두점, 연산자, 리터럴)
 
 ---
 */
// var, !=, 123, ...

// 토큰은 사이에 빈칸을 추가해선 안됨. (다만, 빈칸을 없애는 것은 때때로 괜찮음)

// 프로그래밍에서는 줄바꿈/탭도 빈칸(공백)으로 인식함.

// 즉, 빈칸이 여러개 띄어있어도 컴퓨터가 인식하기에는 1개의 빈칸으로 봄

// var aaa = 5

//: ---
/*: ## 10) 표현식(Expression)
 
 * 값, 변수, 연산자의 조합으로 하나의 결과값으로서 평가되는 코드 단위
 
 ---
 
 */
// 하나의 값이 나오는 코드

var n = 5   //       ====> 문 장 (할당하는 작업)

17          // 17    ====> 표현식

n           // 5     ====> 표현식

n + 7       // 12    ====> 표현식

n < 5      // false  ====> 표현식

//: ---


/*: ## 11) 문장(Statement)
 
 * 문장 또는 구문: 특정작업을 실행하는 코드 단위
 
 ---
 
 */


print("꽁꽁 얼어붙은 얼음 위로 \(nameOfCat)가 걸어다닙니다.")

print("Hello World")

var n2 = 3    // ====> 문장

print(n)      // ====> 문장

print("안녕")  // ====> 문장



//: > 토큰(키워드) + 표현식(값): 문장(작업을 명령)
