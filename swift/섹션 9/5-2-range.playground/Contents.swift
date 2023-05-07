import UIKit

// 범위 연산자:스위프트에서 숫자의 범위를 간편하게 표시할때 사용

// 제한된 숫자의 범위를 표기하기 위한 연산자. 자체가 특별한 타입을 의미

// 예시 1...10 (정수 1부터 10까지의 묶음)

// 규칙:내림차순 형식으로 표기 불가능(내림차순으로 변환은 가능)

// 실수 형식의 범위도 가능(다만, 사용하는 경우는 드뭄)

// 특정한 경우에 활용

// Switch문에서 패턴 매칭에 사용

// for문과 주로 함께 사용 (정수인 경우)

// 배열의 서브스크립트 문법과 함께 사용



// 1) Closed Range Operator(닫힌 범위연산자)

// 해당 값을 포함하면서 범위를 정의. 한 방향은 열리도록 정의 가능



let range = 1 ... 10     //ClosedRange<Int>

let range1 = 1...      //PartialRangeFrom<Int>

let range2 =  ...10    //PartialRangeThrough<Int>

// One-Sided 표기시에는 숫자와 범위연산자를 붙여서 써야함



// 2) Half-Open Range Operator(반 폐쇄 범위 연산자)

// (앞의 값은 포함) 뒤의 값을 포함하지 않고 범위를 정의
// 한 방향은 열리도록 정의 가능


let rangeH = 1 ..< 10     //Range<Int>

let rangeH1 =  ..<10    //PartialRangeUpTo<Int>

// One-Sided 표기시에는 숫자와 범위연산자를 붙여서 써야함


// 범위연산자의 활용

// 1) switch문의 케이스에서 활용


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}



let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count



for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}



for name in names[...2] {
    print(name)
}

// 2) 배열의 서브스크립트 문법과 함께 사용


names[...2]

names[..<1]



// 3) Switch문의 케이스에서 사용

var num = 23

switch num {
case 10...19:
    print("10대 입니다.")
case 20...29:
    print("20대 입니다.") //20..29 ~= 23
case 30...39:
    print("30대 입니다.")
default:
    print("그 외의 범위 입니다.")
}

let point = (1, 2)

switch point {
case (0, 0):
    print("(0, 0)은 원점 위에 있다.")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1))은 원점의 주위에 있다.")
default:
    print("점은 (\(point.0), \(point.1))에 위치한다.")
}
