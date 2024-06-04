import UIKit

/*:# 접근 제어
 */

/*: ## 접근 제어(Access Control)
 - 접근 제어의 기본 개념에 대한 이해. 왜 필요할까?
 ---
 */
// 코드의 세부 구현 내용을 숨기는 것이 가능하도록 만드는 개념(객체지향 - 은닉화가 가능해짐) ⭐️

// (언어마다 약간씩의 차이가 있음)


class SomeClass {
    private var name = "이름"      // 내부적으로만 사용하겠다고 제한
    
    // internal 이라는 키워드가 기본적으로 생략되어 있음 internal var name...
    
    func nameChange(name: String) {
        if name == "길동" {
            return             // 어떤 로직을 넣을 수도 있음
        }
        self.name = name
    }
}


let object1 = SomeClass()
// 외부 접근 불가(private)
//object1.name
//object1.name = "홍길동"
//object1.name



// 이름을 바꾸려면 특정 메서드로 실행만 가능
object1.nameChange(name: "민영")







/*: ---
 - 스위프트의 5가지 접근 수준
 ---
 */
/**===================================================================
 [접근 수준(Access Levels)]
 - 1) open        - 다른 모듈에서도 접근가능 / 상속 및 재정의도 가능 (제한 낮음)
 - 2) public      - 다른 모듈에서도 접근가능(상속/재정의불가)
 - 3) internal    - 같은 모듈 내에서만 접근가능(디폴트)
 - 4) fileprivate - 같은 파일 내에서만 접근가능
 - 5) private     - 같은 scope내에서만 접근가능                (제한 높음)
 
 - 모듈(module): 프레임워크, 라이브러리, 앱 등 import해서 사용할 수 있는 외부의 코드
 ====================================================================**/

// 따로 명시하지 않으면 internal 설정임(디폴트)
// 모듈(프레임워크나 라이브러리)을 만들어서 배포하려면, public이상으로 선언해야함


// 접근 제어를 가질 수 있는 요소는
// (스위프트 문서 - 엔터티 / 독립된 개체)
// 1) 타입(클래스/구조체/열거형/스위프트 기본타입 등)
// 2) 변수/속성
// 3) 함수/메서드(생성자, 서브스크립트 포함)
// 4) 프로토콜도 특정영역으로 제한될 수 있음


/**================================================
 - 클래스의 접근수준을 가장 넓히면 - open / 구조체 - public
 - 1) 클래스 - open (상속, 재정의와 관계)
 - 2) 구조체 - public (구조체는 어짜피 상속이 없기 때문)
===================================================**/
/*: ---
 - 기본 원칙
 ---
 */
//:> 타입은 타입을 사용하는 변수(속성)나, 함수(메서드)보다 높은 수준으로 선언되어야함
// 변수
// public variable에 속한 타입은 더 낮은 접근 수준을 가지지 못함
// (public/internal/fileprivate/private)
var some: String = "접근가능"


// 함수
// 파라미터, 리턴 타입이 더 낮은 접근 수준을 가지지 못함
// (internal/fileprivate/private)
internal func someFunction(a: Int) -> Bool {
    print(a)         // Int 타입
    print("hello")   // String 타입
    return true      // Bool 타입
}

// 자신보다 내부에서 더 낮은 타입을 사용하면 접근을 못해서, 사용하지 못할 수 있음




/*: ---
 - 기본 문법
 ---
 */
// 타입
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}


// 변수 / 함수
public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}


// 아무것도 붙이지 않으면?
class SomeInternalClass1 {}         // 암시적인 internal 선언
let someInternalConstant1 = 0

/*: ---
 - 실무에서 사용하는 관습적인 패턴
 ---
 */
// 실제 프로젝트에서 많이 사용하는 관습적인 패턴

// 속성(변수)를 선언시 private으로 외부에 감추려는 속성은 _(언더바)를 사용해서 이름 지음

class SomeOtherClass {
    private var _name = "이름"         // 쓰기 - private
    
    var name: String {                // 읽기 - internal
        return _name
    }
    
    func changeName(name: String) {
        self._name = name
    }
}

let a = SomeOtherClass()
//a.name = "길동" set은 불가능하도록 설정한 것. 변수로 사용하기 때문에 변경 가능. 직접적으로 접근은 불가(Private 키워드). 메서드를 사용하여 변경
// 감추고 싶은 속성의 이름을 설정할때는 언더바를 설정


// 저장속성의 (외부에서) 쓰기를 제한하기 ⭐️
// 예전 스위프트에서 많이 사용하던 방식
class SomeAnotherClass {
    // 이름을 세팅할 때만 프라이빗이고 읽을때는 인터벌이라는 뜻
    private(set) var name = "이름"      // 읽기 - internal / 쓰기 - private: 이름을 세팅할때만 프라이빗이라는 뜻
}


// 최근 업데이트된 방식

let ab = SomeOtherClass()
// 읽기 가능:읽기는 인터벌 키워드가 내재되어 있음
ab.name
//set(프라이빗) 불가

// ab.name = "철수"


/*: ## 커스텀 타입의 접근 제어
 - 사용자 정의 타입(Custom)의 접근 제어
 ---
 */

//:> 타입의 내부 멤버는 타입 자체의 접근 수준을 넘을 수 없음
// 타입의 접근 제어 수준은 (해당 타입)멤버의 접근 제어 수준에 영향을 미침

// (예시) 타입이 internal 로 선언 되면 내부의 멤버는 internal이하(internal / fileprivate / private)로 설정됨


public class SomePublicClass1 {                         // 명시적인 public 선언
    open var someOpenProperty = "SomeOpen"             // open 이라고 설정해도 public으로 작동 ⭐️
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"          // 원래의 기본 수준
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}


let somePublic = SomePublicClass1()
somePublic.someOpenProperty
somePublic.somePublicProperty
somePublic.someInternalProperty
somePublic.someFilePrivateProperty                    // 같은 파일 안이기 때문에 접근 가능
//somePublic.somePrivateProperty                      // 중괄호 내부에서만 접근 가능



//===========================================================


class SomeInternalClass2 {                             // 암시적인 internal 선언
    open var someOpenProperty = "SomeOpen"            // open 이라고 설정해도 internal으로 작동 ⭐️
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}


let someInternal = SomeInternalClass2()
someInternal.someOpenProperty
someInternal.somePublicProperty
someInternal.someInternalProperty
someInternal.someFilePrivateProperty                 // 같은 파일 안이기 때문에 접근 가능
//someInternal.somePrivateProperty



//===========================================================


fileprivate class SomeFilePrivateClass1 {             // 명시적인 file-private 선언
    open var someOpenProperty = "SomeOpen"
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}


// 변수선언(internal) <===> 타입선언(fileprivate)은 불가능 (fileprivate / private 선언가능)
//internal let someFilePrivate = SomeFilePrivateClass()


fileprivate let someFilePrivate = SomeFilePrivateClass1()
someFilePrivate.someOpenProperty                    // fileprivate
someFilePrivate.somePublicProperty                  // fileprivate
someFilePrivate.someInternalProperty                // fileprivate
someFilePrivate.someFilePrivateProperty             // 같은 파일 안이기 때문에 접근 가능
//someFilePrivate.somePrivateProperty




private let someFilePrivate2 = SomeFilePrivateClass()   // 현재의 scope에서 private



//===========================================================

//:> 타입자체를 private으로 선언하는 것은 의미가 없어짐 ➞ fileprivate으로 동작
// 타입을 private으로 선언하면 아무곳에서도 사용할 수 없기 때문에 의미가 없음 ⭐️

private class SomePrivateClass1 {                    // 명시적인 private 선언
    open var someOpenProperty = "SomeOpen"
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    var someFilePrivateProperty = "SomeFilePrivate"     // 실제 fileprivate 처럼 동작 ⭐️ (공식문서 오류)
    private var somePrivateProperty = "SomePrivate"
}


fileprivate let somePrivate = SomePrivateClass1()
somePrivate.someOpenProperty
somePrivate.somePublicProperty
somePrivate.someInternalProperty
somePrivate.someFilePrivateProperty             // 같은 파일 안이기 때문에 접근 가능
//somePrivate.somePrivateProperty




// 튜플, 함수, 열거형(원시값, 연관값)에 대한 접근제어 관련 구체적인 법칙이 있지만, 필요할때 찾아서 사용




/*: ## 내부 멤버의 접근 제어 수준
 - 내부 멤버(Nested Type)의 접근 제어
 ---
 */

//:> 내부 멤버가 명시적선언을 하지 않는다면, 접근 수준은 internal로 유지
// 타입의 접근 수준이 높다고, 내부 멤버의 접근 수준이 무조건 따라서 높아지는 것 아님


open class SomeClass1 {
    
    var someProperty = "SomeInternal"
    
    // internal 임 ➞ 클래스와 동일한 수준을 유지하려면 명시적으로 open선언 필요
    
}

//: ---

/*: ## 상속과 확장의 접근 제어
 - 상속 관계(Subclassing)의 접근 제어
 ---
 */

/**===========================================================================
- 1)타입 관련: 상속해서 만든 서브클래스는 상위클래스보다 더 높은 접근 수준을 가질 수는 없음
- 2)멤버 관련: 동일 모듈에서 정의한 클래스의 상위 멤버에 접근가능하면, (접근 수준 올려서) 재정의(override)도 가능
 =============================================================================**/

public class A {
    fileprivate func someMethod() {}
}


// public이하의 접근 수준만 가능(public/internal/fileprivate)
internal class B: A {
    override internal func someMethod() {   // 접근 수준 올려서 재정의 가능 ⭐️
        super.someMethod()                  // (더 낮아도) 모듈에서 접근가능하기 때문에 호출가능
    }
}


/*: ---
 - 확장(Extension)의 접근 제어
 ---
 */

// 기본법칙 - 원래 본체와 동일한 접근 수준을 유지하고, 본체의 멤버에는 기본적인 접근 가능

public class SomeClass2 {
    private var somePrivateProperty = "somePrivate"
}


extension SomeClass2 {   // public으로 선언한 것과 같음
    func somePrivateControlFunction() {
        somePrivateProperty = "접근가능"
    }
}

//: ---

/*: ## 속성과 접근 제어
 - 속성의 읽기 설정(getter)과 속성의 쓰기 설정(setter)의 접근제어 (계산 속성을 말하는 것 아님)
 ---
 */

//:> 저장, 계산속성의 읽기와 쓰기의 접근 제어 수준을 구분해서 구현가능

// 일반적으로 밖에서 쓰는 것(setter)은 불가능하도록 구현하는 경우가 많음

struct TrackedString {
    //var numberOfEdits = 0                   // 외부에서도 변경가능
    //private var numberOfEdits = 0           // 이렇게 선언하면, 읽기도 불가능해짐
    private(set) var numberOfEdits = 0        // setter에 대해서만 private 선언 ⭐️
    //internal private(set) var numberOfEdits = 0
    
    // 속성 관찰자
    var value: String = "시작" {
        didSet {
            numberOfEdits += 1
        }
    }
}


var stringToEdit = TrackedString()
stringToEdit.value = "첫설정"
stringToEdit.value += " 추가하기1"
stringToEdit.value += " 추가하기2"
stringToEdit.value += " 추가하기3"
print("수정한 횟수: \(stringToEdit.numberOfEdits)")
print(stringToEdit.value)


// 외부에서 직접설정하는 것은 불가능 (읽는 것은 가능) ⭐️
//stringToEdit.numberOfEdits = 3




// 속성의 읽기설정과 속성의 쓰기설정에 대해 각각 명시적으로 선언도 가능

/**=======================================================
 - 변수 및 속성, 서브스크립트에 쓰기(setter)수준을 읽기(getter)수준
   보다 낮은 접근 수준으로 설정 가능
 
 - internal private(set) var numberOfEdits = 0 이라고 선언하면
 
 - 1) 속성의 읽기설정(getter)은 - internal
 - 2) 속성의 쓰기설정(setter)은 - private(set)
 
 - 저장속성/계산속성 모두에 설정 가능
 =========================================================**/




