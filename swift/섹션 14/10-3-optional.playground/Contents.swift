import UIKit

// 옵셔널 타입에 대한 정확한 이해

// 스위프트의 옵셔널(Optional) 타입

/**==========================
 
 - 옵셔널 타입의 내부 구현
 
   enum Optional<Wrapped> {     // 제네릭 문법
       case some(Wrapped)
       case none
   }
 
============================**/

var num: Int? = 7

// 열거형(한정된 사례)
//Optional.some(7)
//Optional.none




switch num {
case .some(let a):  // let a = 7     // 열거형 case 패턴을 활용해서, 내부 연관값을 꺼냄
    print(a)
case .none:
    print("nil")
    //print(num!)
}



//switch num {
//case Optional.some(let a):
//    print(a)
//case Optional.none:
//    print("nil")
//}


// .none과 nil은 완전히 동일

// .none은 명시적인 열거형으로 표현한 것이고, 일반적으로는 값이 없다는 의미의 nil키워드를 사용할뿐

