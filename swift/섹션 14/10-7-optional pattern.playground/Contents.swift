import UIKit

// 옵셔널 패턴(Optional Pattern)

// 옵셔널 타입에서 열거형 케이스 패턴을 더 간소화한 옵셔널 패턴(Optioanl Pattern)

// 열거형 내부에 "연관값"을 사용시 ➞ 1) 열거형 케이스 패턴 / 2) 옵셔널 패턴

let a: Int? = 1


// 1) 열거형 케이스 패턴 (앞에서 배운)

switch a {
case .some(let z):
    print(z)
case .none:  // nil이라고 써도됨
    print("nil")
}


// 2) 옵셔널 패턴 (현재 배울)

switch a {
case let z?:      // .some을 조금 더 간소화하는 문법
    print(z)
case nil:         // .none 이라고 써도됨
    print("nil")
}


// 옵셔널 패턴의 사례 (열거형 케이스 패턴과 비교)

// 옵셔널타입으로 선언

let num: Int? = 7
print(num)



// 1) 열거형 케이스 패턴

switch num {
case .some(let x):      // let x = num
    print(x)
case .none:
    break
}


// 2) 옵셔널 패턴 (.some을 ? 물음표로 대체 가능한 패턴)

switch num {
case let x?:           // let x? = Optional.some(num)
    print(x)
case .none:
    break
}



// 특정 사례만 다루는 (if문) ================================

// 1) 열거형 케이스 패턴

if case .some(let x) = num {
    print(x)
}



// 2) 옵셔널 패턴 (.some을 ? 물음표로 대체 가능한 패턴)

if case let x? = num {        // "옵셔널(?) 물음표를 띄어내고, x 상수로 보자"의 의미라고 생각하면 됨
    print(x)
}

// 옵셔널 패턴(for문) - 옵셔널타입 요소 배열

// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우, 옵셔널 패턴을 사용하면 편리함

let arrays: [Int?] = [nil, 2, 3, nil, 5]



// 1) 열거형 케이스 패턴

for case .some(let number) in arrays {
    print("Found a \(number)")
}



// 2) 옵셔널 패턴

for case let number? in arrays {
    print("Found a \(number)")
}

