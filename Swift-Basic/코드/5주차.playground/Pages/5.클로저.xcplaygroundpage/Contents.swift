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

/*: ## 함수와 클로저의 형태 비교
 - 클로저의 형태
 ---
 */
// 함수의 형태

func add(num1: Int, num2: Int) -> Int {
    let result = num1 + num2
    
    return result
}

add(num1: 3, num2: 7)

// 클로저의 형태

let _ = { (n1: Int, n2: Int) -> Int in
    let result = n1 + n2
    return result
}


// 클로저의 형태(타입 추론이 가능한 경우)


let _: (Int,Int) -> Int = {(number1, number2) in
    let result = number1 + number2
    return result
}

/*: ## 클로저의 형태
 - 가장 많이 사용하는 형태: 리턴형에 대한 표기를 생략 가능
 ---
 */
let aClosure2 = { (str: String) in
    
    return "Hello \(str)"
    
}

// 리턴을 통해 컴파일러가 아웃풋을 추론함. 따라서 리턴형에 대한 표기를 생략 가능

let aClosure3: (String) -> (String) = { (str) in
    
    // 아규먼트 레이블을 따로 사용하지 않음

        return "Hello \(str)"
    
}

let aClosure4 = {
    
    // () -> ()
    print("This is this🤣")
}


/*: ---
 - 파라미터의 타입의 생략도 대부분 가능하다.
 ---
 */
let closureType5 = { str in
    
    // 컴파일러가 타입 추론 가능한 경우 생략 가능
    
    return str + "!"
    
    // "!"가 문자열 이기 때문에 컴파일러가 str 역시 문자열이라고 추론. 따라서 파라미터의 타입도 생략이 가능해짐
    
}

//: ---

/*: ## 클로저의 사용
 - 클로저를 왜 사용하는가? - 1
 ---
 */
// 1) (클로저를 파라미터로 받는 함수)정의

func closureParamFunction(closure: () -> ()) {
    print("프린트 시작")
    closure()
}

// 파라미터로 사용할 함수 / 클로저를 정의

func printSwiftFunction() {     // 함수를 정의
    print("프린트 종료")
}

let printSwift = { () -> () in      // 클로저를 정의
    
    print("프린트 종료")
    
}

// 함수를 파라미터로 넣으면서 실행 (그동안에 배운 형태로 실행한다면)

closureParamFunction(closure: printSwiftFunction)

closureParamFunction(closure: printSwift)

// 2) 함수를 실행할때 클로저 형태로 전달 (클로저를 사용하는 이유)

// 함수를 실행할떄 파라미터로 클로저를 정의를 하면서 바로 전달: 클로저를 사용하는 이유

// 정의를 하면서 전달을 하므로 굳이 이름이 필요 X

// 일반적으로 클로저를 사용하는 형태: 정의를 하면서 전달하는 형태로 많이 쓰인다.

// 클로저가 이름이 필요 없는 이유: 함수를 실행할때 전달하는 형태로 사용하기 때문에 이름이 필요가 없음

// 함수를 실행할 때 파라미터로 전달하는 함수 ->Callback을 받기 때문에, 콜백함수라고 부름

closureParamFunction(closure: { () -> () in
    
    print("프린트 종료")
    
    // 본래 정의된 함수를 실행시키면서, 클로저를 사후적으로 정의 가능
    
})                              // (활용도가 늘어남)



closureParamFunction(closure: { () -> () in // () -> () in 생략 가능
    
    print("프린트 종료 - 1")
    
    print("프린트 종료 - 2")
})

/*: ---
 - 클로저를 왜 사용하는가? - 2
 ---
 */

// 1) (클로저를 파라미터로 받는 함수)정의

func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void) {
    
    let c = a + b
    
    closure(c)
    
}

closureCaseFunction(a: 7, b: 7, closure: { param  -> () in       // 14 -> ...
    print("hello: \(param)")
})




// 2) 함수를 실행할 때 (클로저 형태로 전달)

closureCaseFunction(a: 5, b: 2, closure: { (n) in
    
    // 사후적 정의: 클로저를 사용하는 이유(커스터 마이징의 범위가 넓어짐)
    
    print("이제 출력할께요: \(n)")
    
})



closureCaseFunction(a: 5, b: 2) {(number) in      // 사후적 정의
    
    print("출력할까요? \(number)")
    
}


closureCaseFunction(a: 5, b: 3) { (number) in      // 사후적 정의
    
    print("출력")
    
    print("출력")
    
    print("출력")
    
    print("값: \(number)")
    
}

/*: ---
 - 여러가지 예시로 정확하게 이해하기
 ---
 */

let print1 = {
    
    print("1")
}

let print2 = {
    
    print("2")
}

let print3 = {
    
    print("3")
}


// 함수의 정의

func multiClosureFunction(closure1: () -> Void, closure2: () -> Void) {
    
    closure1()
    closure2()
}





// 함수의 실행

multiClosureFunction(closure1: print1, closure2: print2)

multiClosureFunction(closure1: print2, closure2: print3)


multiClosureFunction(closure1: {
    
    print("1")
    
}, closure2: {
    
    print("2")
})



// 함수의 정의

func performClosure(closure: () -> ()) {
    print("시작")
    closure()
    print("끝")
}



// 함수의 실행

performClosure(closure: {
    
    print("중간")
})





