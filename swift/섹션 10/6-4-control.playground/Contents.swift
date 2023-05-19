import UIKit

// 제어전송문

// 반복문에서 쓰이는 제어전송문

// 1) Continue

// continue의 사용

for num in 1...20 {
    if num % 2 == 0 {   // num 2의 배수
        continue
    }
    print(num)
}


// 2) break

// break의 사용

for num in 1...20 {
    if num % 2 == 0 {
        break
    }
    print(num)
}


// 주의할점 - 중첩 사용시의 적용 범위

for i in 0...3 {
    print("OUTER \(i)")
    for j in 0...3 {
        if i > 1 {
            print("  j :", j)
            continue
            //break
        }
        print("  INNER \(j)")
    }
}


// 3) Labled Statements

// 레이블이 매겨진 문장과 continue, break의 사용


// 반복문을 중첩적으로 사용할때, 각 반복문에 이름을 붙여서, 가장 인접한 범위 이외의 반복문도 제어가능


OUTER: for i in 0...3 {
    print("OUTER \(i)")
    INNER: for j in 0...3 {
        if i > 1 {
            print("  j :", j)
            continue OUTER
            //break OUTER
        }
        print("  INNER \(j)")
    }
    
}
