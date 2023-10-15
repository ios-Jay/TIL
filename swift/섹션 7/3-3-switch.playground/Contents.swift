import UIKit

// Switch문의 활용

// 스위치문과 밸류바인딩(Value Binding)

// 바인딩의 일반적인 의미

var a = 10

let b = a   // 바인딩을 한다. (다른 변수 / 상수의 새로운 식별자로 할당한다.)

// 바인딩:다른 새로운 변수 / 상수 식별자로 할당

// 바인딩은 앞으로도 자주 나오는 개념이다. 할당연산자의 개념을 늘 명심할것.

// 스위치문에서의 바인딩

var num = Int.random(in: 1...10)


switch num {
case let a:      // let a = num
    print("숫자: \(a)")
default:
    break
}

// 스위치문과 Where절 (스위치문에서 조건을 확인하는 방식)

// 일단 다른 상수 값에 바인딩한(넣은) 후, 조건절(참/거짓 문장)을 통해 다시 한번 더 조건 확인
// (바인딩 된 상수는 케이스블럭 내부에서만 사용가능하고, 상수 바인딩은 주로 where절하고 같이 사용됨)

num = Int.random(in: 1...100)

switch num {
case let x where x % 2 == 0:      // let x = num
    print("짝수 숫자: \(x)")
case let x where x % 2 != 0:
    print("홀수 숫자: \(x)")
default:
    break
}


switch num {
case let n where n <= 50:         // let n = num
   print("50이하의 숫자: \(n)")
default:
   print("그 이외의 숫자")
}



switch num {
case var x where x > 50:       // 변수로 바인딩도 가능 var x = num
    x = 7
    print(x)
default:
    print(num)
}

// where절은 대부분 밸류바인딩 패턴과 함께 사용 (여러 강의에서 또 다룰 예정)


// where키워드는 조건을 확인하는 키워드
