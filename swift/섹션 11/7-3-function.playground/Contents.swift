import UIKit

// 함수 사용시 주의점 ⭐️

// 1) 함수의 파라미터에 대한 정확한 이해

// 함수의 파라미터

func someAdd(a: Int) -> Int {   // let a: Int (값의 변경이 불가능)
    // a = a + 1 상수이기 때문에 이러한 할당은 불가능. 변수로 재선언해야함
    return a
}

someAdd(a: 5)

// 2) 함수 내의 변수의 Scope(스코프)

// 함수 내에서 선언한 변수의 Scope(범위) -> 함수의 바디로 제한됨

func sumOfNum(a: Int) -> Int {
    var sum = 0
    sum += a
    return sum
}

// sum

sumOfNum(a: 3)

// 3) return 키워드의 정확한 이해

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
    }
    
    print("숫자가 5미만입니다.")
}


numberPrint(n: 7)

numberPrint(n: 4)

numberPrint(n: 5)

// 4) 리턴타입이 있는 경우, 함수의 실행문의 의미

//리턴 타입이 있는 함수를 호출하는 경우, 함수를 호출하는 것은 표현식 (표현식의 결과는 함수가 리턴하는 값)


func nameString() -> String {
    return "스티브"
}


var yourName: String = nameString()           // "스티브"




if nameString() == "스티브" {
    print("이름이 일치합니다.")
}




//var yourName: () -> String = nameString


// 5) 함수의 중첩 사용 - 중첩된 함수(Nested Functions)

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
    
    
    if backward {
        return stepBackward(input: value)
    } else {
        return stepForward(input: value)
    }
    
}






var value = 7

//case1
chooseStepFunction(backward: true, value: value)


//case2
chooseStepFunction(backward: false, value: value)

