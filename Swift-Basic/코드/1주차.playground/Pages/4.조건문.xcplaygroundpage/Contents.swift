import UIKit

//: # 프로그래밍의 기본원리와 조건문

//: ---
/*: 모든 프로그래밍은 아래의 세가지 논리로 이루어 진다.
 
 1. 순차: 개발자가 정한 규칙에 따라 순차적으로(차례대로) 실행한다.
 
 2. 조건(+데이터): 조건(데이터)에 따라 어떤 동작을 할지 말지의 여부
 
 3. 반복
 
 
 */

//: ---

/*: ## 1) 조건문(if문)
 - 참(true) 또는 거짓(false)의 특정 조건에 따라 특정 코드만 실행하게 할 수 있는 문장
 ---
 */
var number = 10


if number < 10 {
    
    print("10보다 작다.")
}




//:> "조건"의 자리에는 결과가 참 또는 거짓이 나와야 함

// 조건문(if - else)


number = 20

if number <= 10 {
    
    print("10보다 작거나 같다.")
    
} else { // else 문에는 조건이 오는 것이 아니다. else if와는 다름
    
    print("10보다 크다.")
}


// if - else if - else


number = 30

if number <= 10 {
    print("10보다 작거나 같다.")
} else if number <= 20 {
    print("20보다 작거나 같다.")
} else {
    print("20보다 크고 30보다 작거나 같다.")
}


// if - else if


number = 40

if number <= 30 {
    print("30보다 작거나 같다.")
} else if number >= 30 {
    print("30보다 크거나 같다.")
}



/*:---
 - 1) if문에서 논리적인 구조 및 조건의 순서가 중요
 ---
 */
// 논리적인 오류가 없도록 구성해야함 ==========

var num: Int = 8


if num >= 0 {
    print("0 또는 양의 정수 입니다.")
} else if num % 2 == 0 {
    print("양의 짝수 입니다.")
} else if num % 2 != 0 {
    print("양의 홀수 입니다.")
} else {
    print("음의 정수입니다.")
}

// 올바르게 수정해 본다면? ================

if num >= 0 {
    
    print("0 또는 양수입니다.")
    
    if num % 2 == 0 {
        
        print("짝수입니다.")
        
    } else if num % 2 == 1 {
        
        print("홀수입니다.")
    }
    
} else {
    
    print("음수입니다.")
}


// 조건의 확인 순서를 잘 고려해야함 ==========


var score = 100


if score >= 70 {
    
    print("70점이상입니다.")
    
} else if score >= 80 {
    
    print("80점이상입니다.")
    
} else if score >= 90 {
    
    print("90점이상입니다.")
    
} else {
    
    print("70점미만입니다.")
}



// 올바르게 수정해 본다면 ================


if score >= 90 {
    
    // 범위가 작은 조건이 먼저 와야함
    
    print("90점이상입니다.")
    
} else if score >= 80 {
    
    print("80점이상입니다.")
    
} else if score >= 70 {
    
    print("70점이상입니다.")
    
} else {
    
    print("70점미만입니다.")
}


/*:---
 - 2) 조건을 &&(and), 또는 ||(or)로 연결하는 것도 가능
 ---
 */
var email = "a@gmail.com"

var password = "1234"



if email == "a@gmail.com" && password == "1234" {
    
    print("메인페이지로 이동")
}



if email != "a@gmail.com" || password != "1234" {
    
    print("경고메세지 띄우기")
    
    print("이메일주소 또는 패스워드가 올바르지 않습니다.")
}



/*:---
 - 3) 중첩 사용 가능
 ---
 */
var score1 = 81;

if score1 >= 70 {
    
    if score1 == 100 {
        
        print("만점")
        
    } else {
        
        print("70점이상")
    }
    
}


//:> 프로그래밍에서는 타입만 일치하면 언제든지 중첩이 가능


/*:---
 - 참고 - 접근 연산자 (.)
 ---
 */

// 한식.볶음밥.당근

// 중식.짜장면.춘장

var id = "abc"

id.count

"abcdef".count


id.isEmpty

id.dropFirst()


/*: ## 2) 조건문(if문)의 활용
 - 언제 사용할까? 활용예시
 ---
 */
// 사용자의 아이디가 일치하고, 비밀번호도 일치 한다면

// 입력된 아이디의 글자수가 6자리 이상이라면





if id.count >= 6 {          //  .count는 내장된 기능 (지금은 몰라도 됨)
    
    print("아이디가 6글자 이상이네요. 다음 화면으로 넘어가겠습니다.")
    
}



var myRpsChoice: Int = Int.random(in: 0...2)

// 0:가위, 1:바위. 2:보

if myRpsChoice == 0 {
    print("가위입니다.")
} else if myRpsChoice == 1 {
    print("바위입니다.")
} else if myRpsChoice == 2{
    print("보입니다.")
}



/*: ## 3) Switch문
 - 표현식/변수를 (매칭시켜) 분기처리할때 사용하는 조건문
 ---
 
 */

//:> if문보다 한정적인 상황에서 사용
// 조건을 부등식이 아닌 "=="와만 비교

// 변수가 어떤값을 가지냐에 따라 실행문을 선택하고 진행


var choice: String = "바위"


switch choice { // 변수(표현식)
case "가위":
    print("가위입니다.") // "가위" == "가위"
case "바위":
    print("바위입니다.")
case "보자기":
    print("보자기입니다.")
default:
    break
}

/**=======================================================
 
 [스위치문의 특징]
 
 - 1)  스위치문에서 케이스의 ,(콤마)는 '또는'의 의미로 하나의 케이스에
      여러 매칭값을 넣을 수 있음
 
 - 2)  switch 문은 (비교하고 있는)값의 가능한 모든 경우의 수를 반드시
      다루어야 함 (exhaustive: 하나도 빠뜨리는 것 없이 철저한)
      모든 사례를 다루지 않았을 때에는 디폴트 케이스가 반드시 있어야 한다.
 
 - 3)  각 케이스에는 문장이 최소 하나 이상 있어야 하며 만약 없다면 컴파일
      에러 발생(의도하지 않은 실수를 방지 목적)
 
 - 4)  실행하지 않으려면, break를 반드시 입력해야함 (if문에서는 실행문을
      입력안해도 괜찮지만, 스위치문에서는 필요함)
 
=========================================================**/


switch choice {  // 문자열
    
case "가위":
    
    print("가위 입니다.")
    
case "바위", "보":
    
    print("바위 또는 보 입니다.")
    
default:
    
    break
}



var isTrue = true


switch isTrue {
    
case true:
    
    print("true")
    
case false:
    
    print("false")
    
}



/*:---
 - fallthrough 키워드의 사용
 ---
 */

var num1 = 10

switch num1 {
    
case ..<10:
    
    print("1")
    
    // 매칭된 값에 대한 고려없이 무조건 다음블럭을 실행함
    
    fallthrough
    
case 10:
    
    print("2")
    
    fallthrough
    
default:
    
    print("3")
    
}

/*: ## 4) Switch문의 활용
 - 스위치문과 밸류바인딩(Value Binding)
 ---
 */
// 바인딩의 일반적인 의미

var n1 = 7


let n2 = n1

// 바인딩을 한다. (다른 변수 / 상수의 새로운 식별자로 할당한다.)


//:> 바인딩: 다른 새로운 변수 / 상수 식별자로 할당

var number1 = 6


switch number1 {
case let n:     // let n = number1
    print("숫자: \(n)")
default:
    break
}

/*:---
 - 스위치문과 where절(스위치문에서 조건을 확인하는 방식)
 ---
 */
// 일단 다른 상수 값에 바인딩한(넣은)후, 조건절(참/거짓 문장)을 통해 다시 한번 더 조건 확인

// (바인딩 된 상수는 케이스블럭 내부에서만 사용 가능하고, 상수 바인딩은 주로 where절하고 같이 사용됨)

var number2 = 7

switch number2 {
case let n where n % 2 == 0:
    print("짝수 숫자: \(n)")
case let n where n % 2 == 1:
    print("홀수 숫자: \(n)")
default:
    break
}


//:> where키워드는 조건을 확인하는 키워드


/*: ## 5) 연습문제 Ⅰ: 가위 바위 보 게임 만들기
 
 - 가위 / 바위 / 보 어떻게 만들어야 할까?: 내가 선택한 것과 컴퓨터의 선택을 비교
 ---
 */


/*:---
 - if문으로만 만들어보기
 ---
 */

var myChoice: Int = Int.random(in: 0...2)

var comChoice: Int = Int.random(in: 0...2)

if myChoice == 0 {
    print("당신의 선택은 가위입니다.")
} else if myChoice == 1 {
    print("당신의 선택은 바위입니다.")
} else if myChoice == 2 {
    print("당신의 선택은 보입니다.")
}

if comChoice == 0 {
    print("컴퓨터의 선택은 가위입니다.")
} else if comChoice == 1 {
    print("컴퓨터의 선택은 바위입니다.")
} else if comChoice == 2 {
    print("컴퓨터의 선택은 보입니다.")
}


if myChoice == comChoice {
    print("비겼습니다.")
} else if myChoice == 0 && comChoice == 2 {
    print("당신이 이겼습니다.")
} else if myChoice == 1 && comChoice == 0 {
    print("당신이 이겼습니다.")
} else if myChoice == 2 && comChoice == 1 {
    print("당신이 이겼습니다.")
} else {
    print("당신은 졌습니다.")
}





/*:---
 - Switch문과 함께 작성하기
 ---
 */

var myChoice1: Int = Int.random(in: 0...2)

var comChoice1: Int = Int.random(in: 0...2)


switch myChoice1 {
case 0:
    print("당신의 선택은 가위입니다.")
case 1:
    print("당신의 선택은 바위입니다.")
case 2:
    print("당신의 선택은 보입니다.")
default:
    break
}

switch comChoice1 {
case 0:
    print("컴퓨터의 선택은 가위입니다.")
case 1:
    print("컴퓨터의 선택은 바위입니다.")
case 2:
    print("컴퓨터의 선택은 보입니다.")
    
default:
    break
}


if myChoice == comChoice {
    print("비겼습니다.")
} else if myChoice == 0 && comChoice == 2 {
    print("당신이 이겼습니다.")
} else if myChoice == 1 && comChoice == 0 {
    print("당신이 이겼습니다.")
} else if myChoice == 2 && comChoice == 1 {
    print("당신이 이겼습니다.")
} else {
    print("당신은 졌습니다.")
}


/*: ## 6) 연습문제 Ⅱ: 랜덤빙고 게임 만들기
 - 내가 선택한 것과 컴퓨터가 랜덤으로 선택한 것을 비교하고 출력
 ---
 */
var myChoice2: Int = 4

var comChoice2: Int = Int.random(in: 1...10)

if comChoice2 > myChoice2 {
    print("Up")
} else if comChoice2 < myChoice2 {
    print("Down")
} else {
    print("Bingo")
}
