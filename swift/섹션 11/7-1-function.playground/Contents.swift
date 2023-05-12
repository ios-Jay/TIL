import UIKit

// 섹션 11 함수

/*
 
 함수:"특정한 작업(기능)을 수행하는 코드의 묶음에 (식별할 수 있는 특정한)
 이름을 부여하여 사용하는 것
 
 프로그래밍에서의 함수:어떤 기능을 하는 코드이며,
 입력과 출력이 있을 수 있음.
 
 함수의 기본 개념:함수는 항상 2단계로 실행됨
 
 (1) 정의
 (2) 호출(또는 실행)
 
 */

// 함수(function)를 작성하는 방법(약속)
//:> 함수는 항상 2단계로 실행
// 1) 함수 정의문

func sayHello() {
    print("Hello world!")
    print("Hello Swift")
    print("Hello What's up bro!")
}

sayHello()

/*
 
 함수의 사용 이유
 
 1) 반복되는 동작을 단순화해서 재사용 가능
 2) 코드를 논리적 단위로 구분 가능(기능을 모듈화)
 3) 코드의 길이가 긴 것을 단순화해서 사용 가능
 4) 미리 함수를 잘 만들어 놓으면, 개발자는 사용만 하면 됨
    (애플이 미리 만들어 놓은 것이 많음)
 
 함수의 형태
 
 (1) 함수에 인풋이 있는 경우
 
 
 */


// 함수 정의문

func saySomething(name: String) {
    print("안녕하세요 \(name) 님")
}

saySomething(name: "스티브")

var name = "Jobs"

saySomething(name: name)


// (2)함수가 아웃풋이 있는 경우

func sayHelloString() -> String {
    return "안녕하세요."
}


sayHelloString()


// 함수 정의문
func plusFuntion(a: Int, b: Int) -> Int {
    let c = a + b
    return c       // 아웃풋이 있는 경우, 리턴키워드를 사용해야함
}



// 함수 실행문(call)
plusFuntion(a: 3, b: 4)



print(plusFuntion(a: 5, b: 6))







// 함수 정의문
func someFuntions(x: Int) -> Int {

    var y = 2 * x + 3

    return y
}



// 함수 실행문(call)
someFuntions(x: 2)





// 함수 정의문

func sayHello1(a: String) -> String {
    var say = "안녕 반가워. \(a)야. 나는 스위프트라고 해."
    return say
}




// 함수 실행문(call)

sayHello1(a: "아이유")

sayHello1(a: "GD")
print(sayHello1(a: "스티브잡스"))





// 함수 정의문
func number5() -> Int {
    return 5
}



// 함수 실행문(call)

number5()

print(number5())

// Void 타입의 이해(아웃풋이 없는 경우)

//void:빈, 비어있는

func sayhello1() {
    print("Hello, Swift!")
}


func sayhello2() -> Void {
    print("Hello, Swift!")
}



func sayhello3() -> () {
    print("Hello, Swift!")
}
