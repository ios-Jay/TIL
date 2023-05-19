import UIKit

// 반복문

// 1) For 반복문


// for문의 기본 형태

// 스위프트 스타일의 문법은 직관적이고 쉽게 작성이 가능하도록 되어있음


for index in 1...5 {
    print("for문 출력해보기: \(index)")
}


for index in 1...4 {
    print("\(index)에 5를 곱하면 \(index * 5)")
}

var number = 10

for i in 1...number {
    print(i)
}


// 와일드 카드 패턴 _(언더바)은 스위프트에서 생략을 의미!

for _ in 0...10 {
    print("hello")
}
// _(under bar):생략의 의미


let _ = "문자열"


(1...10).reversed()



let a = (1...10).reversed()

print(a)


// 배열 등 컬렉션 타입에서도 사용 가능

// 컬렉션에서 각 아이템을 차례 차례 한번씩 뽑아서 중괄호 안에서 사용

let list = ["Swift", "Programming", "Language"]


for str in list {
    print(str)
}


// 뒤에서 배열 먼저 공부하고 와서 다시 보기

// 문자열에서도 사용 가능

// 문자열에서 각 문자를 차례 차례 한개씩 뽑아서 중괄호 안에서 사용

for chr in "Hello" {
    print(chr)
    //print(chr, terminator: " ")     //다음줄로 넘어가지 말고, 한칸을 띄워라
}

// 특정한 함수 활용 가능

// 역순으로 바꾸기

for number in (1...5).reversed() {
    print(number)
}




// 홀수 또는 홀수만 뽑아내기

for number in stride(from: 1, to: 15, by:2) {     //마지막 숫자는 포함하지 않음
    print(number)
}


// Stride:성큼성큼 걷다.

let range = stride(from: 1, to: 15, by: 2)     //  StrideTo<Int>
print(range)
// 1, 3, 5, 7, 9, 11, 13

for i in range {
    print(i)
}


let range1 = stride(from: 1, through: 15, by: 2)     // StrideThrough<Int>
print(range1)
// 1, 3, 5, 7, 9, 11, 13, 15

for i in range1 {
    print(i)
}



let range2 = stride(from: 10, through: 2, by: -2)      //   StrideThrough<Int>
print(range2)
// 10, 8, 6, 4, 2


for i in range2 {
    print(i)
}

