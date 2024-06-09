import UIKit

/*: ## 함수의 파라미터, 아규먼트
 - 파라미터(Parameter)
 ---
 */
/**=============================================================
 
 - 파라미터: 함수를 정의시, 함수 정의에 입력값으로 사용되는 변수(내부사용)
 
 - 아규먼트: 함수를 호출시, 함수가 필요한 파라미터의 타입과 일치하는 실제 값(외부사용)
 
 ================================================================**/


// 파라미터 이름만 사용할때(아규먼트 레이블을 사용 안하면)

func printName(name: String) {
    
    // name: String -> 파라미터
    
    print("나의 이름은 \(name) 입니다.")
}


printName(name: "아인슈타인")    // 아인슈타인:아규먼트

/*:---
 - 1) 아규먼트 레이블(Argument Label)
 ---
 */
// 아규먼트 레이블을 사용하면

func printName1(first name: String) {
    
    print("나의 이름은 \(name) 입니다.")
}

// 외부에서 보여지는 것은 first(아규먼트 레이블),

// 실제 내부에서 작동하는 것은 name(파라미터)

printName1(first: "뉴턴")

// 아규먼트 레이블을 사용 안하면

func someFunction(first: Int, second: Int) {
    
    print(first + second)
    
}


someFunction(first: 1, second: 2)


// 아규먼트 레이블을 사용하는 것의 이점:일반적으로 함수를 사용할때 더 명확하게 무엇을 요구하는 지를 알려줄 수 있다.

func someFunction1(writeYourFirstNumber a:Int,
                   
                   writeYourSecondNumber b: Int) {
    
    print(a + b)
    
}


/*: ---
 - 2) 아규먼트 레이블을 생략해서 사용하는 것도 가능 (와일드카드 패턴)
 ---
 */
func addPrintFunction(_ firstNum: Int, _ secondNum: Int) {
    
    print(firstNum + secondNum)
}

// 와일드카드 패턴을 쓰는 이유:전달하고자 하는 바가 명확한 경우에 사용

addPrintFunction(1, 2)

/*:---
 - 3) 가변 파라미터 -  함수의 파라미터에 정해지지 않은, 여러개의 값을 넣는 것도 가능(Variadic Parameters)
 ---
 */
/**=============================================================
 
 - 1) 하나의 파라미터로 2개 이상의 아규먼트를 전달할 수 있다.
 
 - 2) 아규먼트는 배열형태로 전달된다.
 
 - 3) 가변 파라미터는 개별함수마다 하나씩만 선언할 수있다.(선언 순서는 상관없음)
 
 - 4) 가변 파라미터는 기본값을 가질 수 없다.
 
 ===============================================================**/

func arithMeticAverage(_ numbers: Double...) -> Double {
    
    var sum = 0.0
    
    for n in numbers {
        
        sum += n
    }
    
    return sum / Double(numbers.count)
}

arithMeticAverage(3,3.6,7,6,8,9)


/*: ---
 - 4) 함수의 파라미터에 기본값(디폴트)을 정하는 것도 가능
 ---
 */
func numFunction(num1: Int, num2: Int = 3) -> Int {
    
    var result = num1 + num2
    
    return result
}

// 함수를 실행할때 num2에 아규먼트를 주지 않는다면 기본값으로 3을 준다는 뜻


numFunction(num1: 3)

numFunction(num1: 3, num2: 7)



//:> 아규먼트값이 항상 필요한 것이 아닐 수도 있다!

// 실제 애플이 미리 만들어 놓은 함수에는 기본값이 들어 있는 경우가 꽤 있다.



print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)



// terminator: "\n" -> 엔터의 의미

// separator: "" -> 글자를 연결 시킴. 띄어쓰기나 부호를 붙일 수 있음


/*: # 함수 사용시 주의점 ⭐️
 
 - 1. 함수의 파라미터에 대한 정확한 이해
 ----
 
 */

// 함수의 파라미터

func someAdd(num: Int) -> Int {
    
    // let num: Int(값의 변경이 불가능)
    
    // num = num + 1
    
    // 변수로 사용하고 싶다면 바인딩 하여 사용
    
    // var n = num
    
    return num
    
}


someAdd(num: 10)


/*: ----
 - 2. 함수 내부 변수의 Scope(스코프)
 ---
 */

//:> 함수 내에서 선언한 변수의 Scope(범위) ➞ 함수의 바디로 제한됨
func sumOfNum(n: Int) -> Int {
    
    var sum = 0
    
    
    sum += n
    
    return sum
    
}


// sum


sumOfNum(n: 9)


/*: ---
 - 3. return 키워드에 대한 정확한 이해
 ---
 */

/**==============================================================
 
 - return 키워드의 역할
 
 - 1) 리턴타입이 있는 함수의 경우(아웃풋이 있는 경우):
 
 리턴 키워드 다음의 표현식을 평가한 다음에 그 결과를 리턴하면서 함수를 벗어남
 
 - 2) 리턴타입이 없는 함수의 경우(아웃풋이 없는 경우):
 
 함수의 실행을 중지하고 함수를 벗어남 ⭐️
 
 =================================================================**/

// 리턴 타입이 있는 경우

func addFunction(num1: Int, num2: Int) -> Int {
    
    var result = num1 + num2
    
    return result
}




addFunction(num1: 3, num2: 4)




// 리턴 타입이 있는 경우

func valuationFunction(num: Int) -> Int {
    
    if num >= 5 {
        
        return num
    }
    
    return 0
}

valuationFunction(num: 3)

valuationFunction(num: 5)

// 리턴 타입이 없는 경우

func numberPrint(n num: Int) {
    
    if num >= 5 {
        
        print("숫자가 5이상입니다.")
        
        return
        
        /*
         
         return 타입이 없는데도 불구하고 return을 사용하는 것은
         
         이 함수를 벗어난다는 의미이다. 즉 함수를 종료한다는 의미이다.
         
         따라서 리턴 키워드를 사용하면 중괄호 내부의 코드만을 실행하게 된다.
         
         */
        
        
    }
    
    print("숫자가 5미만입니다.")
}


numberPrint(n: 7)

numberPrint(n: 4)

numberPrint(n: 5)


/*: ---
 - 4.리턴타입이 있는 경우, 함수의 실행문의 의미
 ---
 */
// 리턴 타입이 있는 함수를 호출하는 경우, 함수를 호출하는 것은 표현식(표현식의 결과는 함수가 리턴하는 값)

func nameString() -> String {
    
    return "스티브"
}

var yourName: String = nameString()           // "스티브"




if nameString() == "스티브" {
    
    print("이름이 일치합니다.")
    
}




// var yourName: () -> String = nameString


/*:---
 - 5. 함수의 중첩 사용 - 중첩된 함수(Nested Functions)
 ---
 */
// 함수 안에 함수를 작성할 수도 있다.

// (함수 안에 있는 함수는 밖에서 사용이 불가능)

// 함수를 제한적으로 사용하고 싶을 때, 사용

func chooseStepFunction(backward: Bool, value: Int) -> Int {
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    // 위의 두 함수는 선언문이기 때문에 실행되지 않는다.
    
    // 실행은 if문으로부터 시작이 되면서부터 위의 두 함수를 실행시키게 된다.
    
    if backward {
        
        return stepBackward(input: value)
        
    } else {
        
        return stepForward(input: value)
    }
    
}






var value = 7

// case 1

chooseStepFunction(backward: true, value: value)


// case 2

chooseStepFunction(backward: false, value: value)

//: ---

/*: ## 함수 표기법(지칭), 함수의 타입 표기
 - 참고) 함수 표기법
 ---
 */
// 정의문

func doSomething1() {
    
    print("출력")
}


func addPrintFunction1(_ firstNum: Int, _ secondNum: Int) {
    
    print(firstNum + secondNum)
}


// 실행문

addPrintFunction1(8, 8)

/**=============================================
 
 - 함수를 지칭하려는 경우, 함수를 어떻게 표기할까?
 
 - 1) 개발자 문서를 읽을 때 필요
 
 - 2) 함수를 지칭할때 필요(함수를 변수에 담거나)
 
 ================================================**/

// 함수의 표기법(함수를 지칭시)

// 1) 파라미터가 없는 경우, ()를 삭제

// 소괄호가 빠져있다면, 함수를 지칭하는 것이다.



doSomething1

var some = doSomething1

// some이라는 변수에 doSomething이라는 함수를 담았다.

// 즉 some이라는 변수가 doSomething이라는 함수를 '지칭'한다.

// doSomething이라는 함수를 some이라는 변수로도 실행 가능하다는 것이다.

// some이라는 변수로 실행 시키는 것이 아닌 소괄호를 사용하여 실행 가능하다.

some()


// 2) 아규먼트 레이블이 있는 경우, 아규먼트 레이블까지를 함수의 이름으로 봄

// 파라미터가 있는 경우에는 타입을 지우고 아규먼트 레이블로 함수를 지칭

numberPrint(n:)        //  "numberPrint n 함수이다."



// 3) 파라미터가 여러개인 경우, 콤마없이 아규먼트 이름과 콜론을 표기

chooseStepFunction(backward:value:)

// 함수를 지칭함으로서 변수에다가 함수를 담을 수 있다.



// 4) 아규먼트 레이블이 생략된 경우, 아래와 같이 표기 (콤마(,)가 없어야 한다.)

addPrintFunction(_:_:)

/*:---
 - 함수 타입의 표기
 ---
 */
// 변수에 정수를 저장하는 경우에 타입 표기

var num: Int = 5




// 함수의 타입 표기 방법

var function1: (Int) -> () = numberPrint(n:)

// 함수의 타입:(Int) -> ()

var function2: (Int, Int) -> () = addPrintFunction(_:_:)

// 함수의 타입: (Int, Int) -> () or Void (Void는 ()로 표현 가능)

// () -> () == () -> Void

// 일반적으로 인풋에는 Void를 쓰지 않는다. 아웃풋에 Void 사용

// 변수가 함수를 가르키도록 할 수 있음

function2(3, 5)


//: ---


/*: ## 함수의 오버로딩(Overloading)
 - 함수의 오버로딩에 대한 이해
 ---
 */

//:> 오버로드(overload): 영어로 과적하다라는 뜻

/*
 같은 이름의 함수에 매개변수(파라미터)를 다르게 선언하여, 하나의 함수 이름에 실제 여러개의 함수를 대응 시키는 것
 
 ===> 쉽게 말하면: 함수의 이름의 재사용
 
 
 스위프트는 오버로딩을 지원하는 언어
 
 ⭐️ 함수이름, 파라미터 수/자료형, 아규먼트 레이블, 리턴형을 모두 포함해서 함수를 식별
 
 */

func doSomething(value: Int) {
    print(value)
}


func doSomething(value: Double) {
    print(value)
}


func doSomething(value: String) {
    print(value)
}


func doSomething(_ value: String) {
    print(value)
}


func doSomethging(value1: String, value2: Int) {
    print(value1, value2)
}




doSomething(value: 5)

doSomething(value: 3.4)

doSomething(value: 3)



/*
 
 오버로딩을 지원하지 않는 언어의 단점
 
 같은 기능을 제공하는 함수를 파라미터 형식마다
 
 이름을 다르게 구현해야하기 때문에
 
 함수의 이름이 많아지고,구별해서 사용하는 것이 어렵다.
 
 오버로딩을 지원함으로서 함수 이름 하나에
 
 여러개가 대응되도록 만들어 놓으면 일일이 함수의 이름을 외울 필요가 없어진다.
 
 */


//: ---

/*: ## 범위(Scope)
 - scope: 함수, if, for문 등에 모두 해당
 ---
 */

/**====================================================================================
 
 - 1. 변수는 코드에서 선언이 되어야, 그 이하의 코드에서 접근 가능(선언하기 이전에는 접근 불가함) (전역변수는 예외)
 
 - 2. 상위스코프(범위)에 선언된 변수와 상수에 접근가능하며, 하위스코프(범위)에는 접근할 수 없다.
 
 - 3. (동일한 스코프에서 이름이 중복될 수 없지만, 다른 스코프에서는 이름 중복이 가능)
 
 - 4.가장 인접한 스코프에 있는 변수와 상수에 먼저 접근 한다.
 
 =====================================================================================**/

/*:---
 - 첫번째 예제
 ---
 */
func greeting1() {
    
    print("Hello")
    
    var myName = "홍길동"
    print(myName)
    
    print(name)
    
    if true {
        print(myName)
        print(name)
    }
}

// print(myName)

// print(name)


greeting1()

// 원칙은 함수 실행 전에(함수 선언 전이 아닌) name이라는 변수를 선언하는 것이다.

// 실제 앱을 만들때는 name이라는 전역변수를 함수 실행 전에 먼저 선언해 줘야 한다.

var name = "잡스" // 전역변수 (메모리의 데이터 영역에 저장)

// 변수를 선언하기 전에는 당연히 함수 내에서 에러가 발생한다. 범위 내에 없으므로...

// 플레이그라운드 파일이기 때문에 에러가 발생 X. 실제 앱개발에서는 에러 발생

greeting1()

/*: ---
 - 두번째 예제
 ---
 */
var realName = "iOS-Jay"

// 전역 변수로서 미리 선언되어 있었다면 당연히 실행됨

func doSomething() {

var realName = "앨런"
   
   print(realName)
   
   // 코드는 순서대로 작동하기 때문에, 선언이 되어있어야 사용 가능: 조건문에서 배운 프로그래밍의 기본 원칙 첫번쨰 -> 순차

//    var realName = "앨런"
   
   print(realName)
}


doSomething()

/*:---
 - 세번째 예제
 ---
 */
func sayGreeting1() {
    
    print("Hello")
    
    
    func sayGreeting2() {
        
        print("Hey")
        
        if true {
            
            print("")
        }
    }
    
    sayGreeting2()  // 내부이니 접근 가능
    
}


// sayGreeting1()

// sayGreeting2() -> sayGreeting1() 내부에 있는 함수이기 때문에 밖에서 접근이 불가능하다.

//: ---

/*: # 제어전송문 정리
 */

/*: ## 1) break
 
 - (1) switch문   (2) 반복문(for/while 등) 에서 사용
 ---
 */
var a = 3

switch a {
case 1:
    break      // 실행하는 문장이 없을때, 반드시 입력 (약속)
case 2:
    print(a)
case 3:
    print("3입니다.")
case 4:
    print("안녕하세요")
default:
    break
}

// 가장 인접한 반복문을 아예 중지 ⭐️

for index in 1...10 {
    
    if index == 3 {
        break
    }
    
    print(index)
    
}

/*: ## 2) fallthrough
 - Switch문에서 사용
 ---
 */

switch a {
case 1:
    break      // 실행하는 문장이 없을때, 반드시 입력 (약속)
case 2:
    print(a)
case 3:
    print("3입니다.")
    fallthrough     // 다음 문장도 반드시 실행됨
case 4:
    print("안녕하세요.")
default:
    break
}


// 3입니다.

// 안녕하세요.

/*: ## 3) Continue
 - 반복문에서 사용(for/ while 등)
 ---
 */

for index in 1...10 {

    if index % 2 != 0 {
        continue
    }

    print(index)
}



/* 간단하게 말해 건너뛰라는 뜻.
 
  continue는 반복문을 다음 싸이클로 보냄

  다음 싸이클에서 계속 지속(continue)하라는 의미

  1) 반복문의 첫번째 index는 1

  2) 1은 2로 나눴을 때 나머지가 1이므로 참

  3) 조건이 참이므로 continue를 만남
 
  4) continue를 만나므로 print(index)를 실행 시킬 수 없음

  5) 첫 문장을 실행시키지 않고 다음 사이클(index = 2)로 넘어감

  6) 2는 나머지가 0이므로 거짓, 따라서 continue를 실행시키지 않음

  7) 즉 if문을 실행시키지 않고 if문 다음의 print(index)를 실행

  8) 홀수 숫자는 continue를 만나고 짝수는 print 함수를 만남. 짝수가 출력됨
 */

/*: ## 4) Return
 - 함수에서 사용
 ---
 */

func doAnything() {
    
    print("1")
    
    print("2")
    
    if true {
        
        return
    }
    
    
    
    print("3")
    
    print("4")
}

doAnything()


//: ---



/*: ## inout파라미터
 - 함수를 통해, 변수를 직접 수정하고 싶은 경우는 어떻게 해야할까?
 ---
 */

//:> 함수내의 파라미터는 기본적으로 값타입이고(복사되서 전달) 임시상수이기 때문에 변경 불가 원칙
var num1 = 123      // 전역변수

var num2 = 456      // 전역변수

func swap(n1: Int, n2: Int) {
    
    // 파라미터는 상수로 선언     let a = ..., let b = ...
        
    //    var c = a     // 123
            
    //    a = b         // a = 456
        
    // a는 상수로 선언이 되있기 때문에 실행이 불가하다.
        
    //    b = c         // b = 123
    
}

swap(n1: num1, n2: num2)

/*
 
 swap 함수라는 스택프레임을 만들었고,
 
 밖에 있는 전역변수로 선언되어 있는 값들을
 
 복사를 해서 내부에서 사용하게 된다.
 
 그래서 원래의 값을 변경시킬 수 없다.
 
 원래의 데이터를 복사했기 때문에.
 
 파라미터는 기본적으로 값타입(복사되어 전달)
 
 */

/*: ---
 - 함수 내에서 변수를 직접 수정하도록 돕는 inout키워드 (참조로 전달)
 ---
 */

//:> inout 키워드(선언시),   & 사용(실행시)

num1 = 123

num2 = 456



func swapNumbers(n1: inout Int, n2: inout Int) {
    
    var temp = n1
    
    n1 = n2     // 실질적으로 n1이 전달됨. n1 = num2
    
    n2 = temp
    
    
    
}

// inout 키워드를 쓰면 그냥 변수를 전달하는구나, 상수로 선언하는 것이 아닌 밖에 있는 변수 그 자체를 전달한다고 알면 된다.

// 함수 실행시에는 앰퍼센트를 꼭 붙여야함(원본이 전달된다는 의미)


swapNumbers(n1: &num1, n2: &num2)

print(num1)

print(num2)

// 입출력 파라미터는 내부적으로 copy-in, copy-out 메모리 모델을 사용하지만, 실제 원본이 전달된다고 쉽게 생각하면 됨

// copy-in, copy-out값을 복사해서 함수 바디 내부로 전달하고,

// 함수가 종료될때, 아규먼트로 전달한 변수에 복사됨(함수 바디 내부에서 외부로 복사되어 전달)

/**==========================================
 
 - inout파라미터 사용시 주의점
 
 - 1) 상수(let)나, 리터럴 전달하는 것 불가능
 
 (변하지 않는 값(let)이므로 불가, 직접적으로 123.... 이러한 데이터를 전달해서는 안됨( &123...불가능). 메모리 주소를 전달하는 것이기 때문에 값 자체를 전달하는 것은 안된다.)
 
 - 2) 파라미터의 기본값 선언을 허용하지 않음
 
 (값을 바꿀 수 없는 것이니 당연히 선언 불가하다.       a: Int = 5... 이런 행위로는 inout키워드 사용이 가능하지 않다.)
 
 - 3) 가변파라미터(여러개의 파라미터)로 선언하는 것 불가능
 
=============================================**/


//: ---


/*: # Guard문
 
 */

/*: ## 가드문(guard statement)
 - 불만족하는 조건을 사전에 걸러내는 조건문
 ---
 */

//:> if문의 단점 - 여러개의 조건이 있을때 코드의 가독성이 문제됨 ➞ guard문으로 단점 극복

// Swift에서 만든 조건문. 다른 언어에서는 없는 개념

// if문을 만족하는 경우, 지속적인 들여쓰기로 인해 코드의 가속성이 안 좋아질 수 있음

// (실제 프로젝트에서는 코드를 알아보기 힘듬)


/**=======================================================
 
 - guard문
 
 - 1) else문을 먼저 배치 - 먼저 조건을 판별하여 조기 종료(early exit)
 
 - 2) 조건을 만족하는 경우 코드가 다음 줄로 넘어가서 계속 실행
 
 - 3) 가드문에서 선언된 변수를 아래문장에서 사용 가능 (동일한 스코프로 취급): guard let 바인딩 관련
 
=======================================================**/

/*: ---
 - 가드문의 이해
 ---
 */
func checkNumbersOf1(password: String) -> Bool {
    
    if password.count >= 6 {
        
        // 로그인을 처리하는 코드 작성
        
        // 1
        
        // 2
        
        // 3
        
        // 4
        
        // 5
        
        return true
        
    } else {
        
        return false
        
    }

}

func checkNumbersOf2(password: String) -> Bool {
    
    // 감시하다
    
    guard password.count >= 6 else {
        
    // early exit:일찍 종료 시킴
        
        return false
        
    // 종료 조건 - 함수 내에서는 return / throw
    }
    
    // 로그인을 처리하는 코드 작성
    
    // 1
    
    // 2
    
    // 3
    
    // 4
    
    // 5
    
    return true
}


// 조건문과 다르게 else문이 먼저 나오는 조건문이라고 생각하면 된다.


/*: ---
 - 가드문의 사용 예시
 ---
 */
// 반드시 코드를 종료해야 하는 조기 종료의 조건이 필요하므로, 로컬스코프(함수/반복문) 내에서만 사용 가능


func check(word: String) -> Bool {
    
    
    guard word.count >= 5 else {
        
        print("5글자 미만입니다.")
        
        return false
        
    }
    
    print("\(word.count) 글자 입니다.")
    
    return true
}

check(word: "안녕하세요")


//: ---

/*: ## 함수의 리턴값 유무
 - 함수의 정의
 ---
 */

// 리턴값(타입)이 없는 함수

func sayHello() {
    
    print("안녕하세요.")
    
}


// sayHello()



// 리턴값(타입)이 있는 함수

// @discardableResult

// 버릴 수 있는 이라는 뜻. 버릴 수 있는 결과라는 뜻


func sayHelloString() -> String {
    
    print("하이")
    
    return "안녕하세요"
    
}


sayHelloString()     // 실제 프로젝트에서 경고창 표시

// _ = sayHelloString():"안녕하세요" 가 반환이 되는데, 이 값을 생략할 것이라고 말해주는 개념

// 과거 스위프트 버전 4 이하에서 사용하던 개념

// 스위프트 5.2부터 @discardableResult 사용


/*: ---
 - 리턴 타입이 없는 함수(Void 타입) vs 리턴타입이 있는 함수의 차이 ⭐️
 ---
 */

//:> 리턴 타입이 없는 함수 ➞ 결과는 Void 타입

// 이렇게 사용하는 경우는 없음(결과값 없음)

// var hello: Void = sayhello1()

sayHello()         // 제어권


//:> 리턴 타입이 있는 함수 ➞ 결국 결과로 "값"이 있는 것 ➞ (일반적으로)사용

// 함수 자체를 값으로 볼 수 있음

var hello = sayHelloString()       // 제어권 + 결과값

/*: ---
 - 리턴값이 있는 함수에서 리턴값을 사용하지 않는다면
 ---
 */

// 기존의 방식

_ = sayHelloString()

// (결과값을 사용하지 않을때) 지금까지 많이 사용해오던 패턴



// 스위프트 5.2 부터

// @discardableResult   // 어트리뷰트를 사용하도록함
