import UIKit

/*: # 클로저(Closure)
 */
/*: ## 클로저 - 이름이 없는(익명)함수
 - 함수의 타입에 대한 표기 (복습)
 ---
 */
// 함수의 타입 표기법

let functionA: (String) -> String

// 1)파라미터 문자열, 2)리턴형 문자열

let functionB: (Int) -> ()

// 1)파라미터 정수, 2)리턴형 없음

let functionC: (String) -> Void

// 1)파라미터 문자열, 2)리턴형 없음


/*: ---
 - 기존의 함수의 형태와 클로저의 형태 비교
 ---
 */
// 함수의 정의

func aFunction(str: String) -> String {
    return "Hello \(str)"
}

// 클로저의 형태: 이름이 없는 익명의 함수

let _ = {(str: String) -> String in
    
    return "Hello \(str)"
    
}

//:> 생각의 전환 ➞ 중괄호는 클로저(함수)이다!
let aClosureType = { () -> () in
    
    // 변수에 담아서 호출하는 것도 가능

    print("Hello")
}


var helloClosureType = {print("안녕하세요.")} // () -> ()


aClosureType()


/*: ---
 - 함수를 1급객체(First-class Object)로 취급
 ---
 */
/**================================================
 
 - 함수를 1급 객체로 취급
 
 - 1) 함수를 변수에 할당할 수 있다.
 
 - 2) 함수를 파라미터로 전달이 가능하다.
 
 - 3) (함수에서) 함수를 반환할 수 있다. (리턴 가능)
 
 ==================================================**/


func aFunction1(_ param: String) -> String {
    return param + "!"
}


func aFunction2(name: String) -> String {
    return name + "?!??"
}

// 함수를 변수에 할당가능(변수가 함수를 가르키게 됨)

// 소괄호는 함수의 실행

// 변수에 함수를 할당하면 파라미터가 필요없다.

var a: (String) -> String = aFunction1

a("안녕")
a("잡스")
a("조던")

a = aFunction2

a("hello")

// 함수(클로저)를 변수에 할당해서

let closureType = { (param: String) -> String in
    
    // 클로저 리터럴
    
    return param + "!"
    
}

// 사용(실행)

closureType("스티브")

//: ---
