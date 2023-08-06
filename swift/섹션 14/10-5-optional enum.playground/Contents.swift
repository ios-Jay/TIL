import UIKit

// 열거형에 (연관값이 없고), 옵셔널 열거형의 경우

// switch문의 편의성 (열거형 case 패턴) - Enumeration Case Pattern

// 열거형의 선언

enum SomeEnum {
    case left
    case right
}


// 타입을 다시 옵셔널 열거형으로 선언 ⭐️

let x: SomeEnum? = .left


/**==================================================
 [SomeEnum?의 의미] 옵셔널 열거형
 
 - 값이 있는 경우 .some ===> 내부에 다시 열거형 .left /.right
 - 값이 없는 경우 .none ===> nil
=====================================================**/


// 원칙

switch x {
case .some(let value):      // Optional.some(let value) = Optional.some(SomeEnum.left)  ⭐️
    switch value {
    case .left:
        print("왼쪽으로 돌기")
    case .right:
        print("오른쪽으로 돌기")
    }
case .none:
    print("계속 전진")
}



// 편의적 기능 제공 ⭐️

switch x {
case .some(.left):
    print("왼쪽으로 돌기")
case .some(.right):
    print("오른쪽으로 돌기")
case .none:
    print("계속 전진")
}



// 전체적으로 full name으로 풀어서 쓴다면..

//switch x {
//case Optional.some(SomeEnum.left):
//    print("왼쪽으로 돌기")
//case Optional.some(SomeEnum.right):
//    print("오른쪽으로 돌기")
//case Optional.none:
//    print("계속 전진")
//}

// 스위치문의 편의성

// switch문에서 옵셔널 열거형 타입을 사용할때, 벗기지 않아도 내부값 접근가능

// 스위치문은 옵셔널 열거형 타입의 사용시, 편의성을 제공


switch x {     // 예전에는 x! 라고 써줘야 했음 (스위치문에서 옵셔널 타입도 ok)
case .left:
    print("왼쪽으로 돌기")
case .right:
    print("오른쪽으로 돌기")
case nil:
    print("계속 전진")
}
