import UIKit

// 함수의 파라미터, 아규먼트

// 파라미터

/**=============================================================
 
 - 파라미터: 함수 정의시, 함수 정의에 입력값으로 사용되는 변수(내부사용)
 
 - 아규먼트: 함수를 호출시, 함수가 필요한 파라미터의 타입과 일치하는 실제 값(외부사용)
 
================================================================**/

// 파라미터 이름만 사용할때(아규먼트 레이블 사용 안하면)

func printName(name: String) {                  // name: String  (파라미터)
    print("나의 이름은 \(name) 입니다.")
}

// 1) 아규먼트 레이블

// 아큐먼트 레이블을 사용하면

func printName1(first name: String) {
    print("나의 이름은 \(name) 입니다.")
}



printName1(first: "뉴턴")





//아규먼트 레이블 사용 안하면


func someFunction(first: Int, second: Int) {
    print(first + second)
}


someFunction(first: 1, second: 2)




//아규먼트 레이블 사용하는 것의 이점 (일반적으로 함수를 사용할때 더 명확하게 무엇을 요구하는 지 알려줄 수 있다.)

func someFunction1(writeYourFirstNumber a:Int, writeYourSecondNumber b: Int) {
    print(a + b)
}



someFunction1(writeYourFirstNumber: 3, writeYourSecondNumber: 4)




printName(name: "에디슨")          //   "에디슨" (아규먼트)



// 2) 아규먼트 레이블을 생략해서 사용하는 것도 가능(와일드카드 패턴)


func addPrintFunction(_ firstNum: Int, _ secondNum: Int) {
    print(firstNum + secondNum)
}



addPrintFunction(1, 2)


/**=============================================================
 - 1) 하나의 파라미터로 2개이상의 아규먼트를 전달할 수 있다.
 
 - 2) 아규먼트는 배열형태로 전달된다.
 
 - 3) 가변 파라미터는 개별함수마다 하나씩만 선언할 수있다.(선언 순서는 상관없음)
 
 - 4) 가변 파라미터는 기본값을 가질 수 없다.
===============================================================**/

func arithmeticAverage(_ numbers: Double...) -> Double {
    
    var total = 0.0
    
    for n in numbers {
        total += n
    }
    
    return total / Double(numbers.count)
}



//arithmeticAverage(5, 6, 7, 8, 9)



arithmeticAverage(1.5, 2.5, 3.5, 4.5)

// 4) 함수의 파라미터에 기본값(디폴트) 정하는 것도 가능


func numFunction(num1: Int, num2: Int = 5) -> Int {
    var result = num1 + num2
    return result
}




numFunction(num1: 3)
numFunction(num1: 3, num2: 7)

