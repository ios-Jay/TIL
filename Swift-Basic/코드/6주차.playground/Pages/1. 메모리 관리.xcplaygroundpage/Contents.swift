import UIKit

/*: # 메모리 관리
 */

/*:
 ## ARC(Automatic Reference Counting)를 통한 메모리 관리
 - MRC(Manual RC) vs ARC(Automatic RC)
 ---
 */
// MRC(수동 RC관리)와 ARC(자동 RC)


// 소멸자를 통해 메모리에서 해제 되는 결과를 확인해 보는 예제

class Dog {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var choco: Dog? = Dog(name: "초코", weight: 15.0) 

// retain(choco)   RC: 1

var bori: Dog? = Dog(name: "보리", weight: 10.0)

// retain(bori)    RC: 1


// nil을 할당했기 때문에 스택의 영역에 있는 변수의 메모리 주소가 없어진다. 사라졌기 때문에 메모리에서 해제된다.

choco = nil   // RC: 0

// release(choco): 실제 이 코드는 동작하지 않음. Swift는 MRC를 쓰지 않고 ARC만 쓰도록 구현이 되어있기 때문에. 이론적으로 이런 것이 있다는 것만 인지(컴파일러가 알아서 이러한 작업을 수행: ARC)

bori = nil    // RC: 0

// release(bori)

/**========================================================================
 
 - 예전 언어들은 모든 메모리를 수동 관리했음
 
 - 실제로 개발자가 모든 메모리 해제 코드까지 삽입해야함 (실수할 가능성 높음)
 

 - retain() 할당 ---> release() 해제
 
    (RC  +1)           (RC  -1)

 - 개발자는 실제 로직 구현 포함, 메모리 관리에 대한 부담이 있었음 ⭐️


 - 따라서, 현대적 언어들은 대부분 자동 메모리 관리 모델을 사용
 
 - 스위프트의 경우, 컴파일러가 실제로
 
   retain() 할당 ---> release() 해제 코드를 삽입한다고 보면됨
 
 - 컴파일러가 메모리 관리코드를 자동으로 추가해 줌으로써, 프로그램의 메모리 관리에 대한 안정성 증가


 - 단지 아래와 같은 메커니즘의 실행을 수동(Manual)으로 할 것인지,
 
   자동(Automatic)으로 할 것인지의 차이

 [ARC모델의 기반: 소유정책과 참조카운팅(Refernce Counting)]
 
   1.소유정책 - 인스턴스는 하나이상의 소유자가 있는 경우 메모리에 유지됨
             (소유자가 없으면, 메모리에서 제거)
   2.참조카운팅 - 인스턴스(나)를 가르키는 소유자수를 카운팅

 - (쉽게 말하면, 인스턴스를 가르키고 있는 RC가 1이상이면 메모리에 유지되고, 0이되면 메모리에서 제거됨)
 
 =======================================================================**/

/*: ---
 - ARC(Automatic Reference Counting)
 ---
 */
var dog1: Dog?
var dog2: Dog?
var dog3: Dog?


dog1 = Dog(name: "댕댕이", weight: 7.0)     // RC + 1   RC == 1
dog2 = dog1                               // RC + 1   RC == 2
dog3 = dog1                               // RC + 1   RC == 3


dog3?.name = "흰둥이"
dog2?.name
dog1?.name



dog3 = nil                                // RC - 1   RC == 2
dog2 = nil                                // RC - 1   RC == 1
dog1 = nil                                // RC - 1   RC == 0    // 메모리 해제


