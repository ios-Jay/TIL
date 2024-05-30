import UIKit

/*: # 제네릭(Generics)
 */
/*: ## 제네릭 문법
 - 제네릭(Generics) 문법이 왜 필요한가?
 ---
 */
// inout 키워드 복습하고 오기


// 제네릭이라는 문법의 필요성 알아보기

// 정수 2개

var num1 = 10
var num2 = 20



// 두 숫자를 스왑(서로 교환)하는 함수의 정의
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}



// 위에서 정의한 함수의 실행

swapTwoInts(&num1, &num2)

print(num1)

print(num2)



// 만약, Double을 교환하고 싶다면?, String을 교환하고 싶다면?


// Double을 스왑하는 함수의 정의

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let tempA = a
    a = b
    b = tempA
}



// (정수가 아닌) 문자열을 스왑하는 함수의 정의

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}

/**======================================================================
 
 - 제네릭이 없다면, 함수(클래스, 구조체, 열거형 등)타입마다 모든 경우를 다 정의해야 하기 때문에
 
 - 개발자의 할일이 늘어난다. (유지보수/재사용성 관점에서 어려움)
 
=========================================================================**/

// 제네릭(통합): 함수를 하나만 구현하면 내부에 있는 타입은 언제든지 바꿔서 사용할 수 있는 문법

//:> 또다른 예시
// 배열을 가지고
let numbers = [2, 3, 4, 5]
let scores = [3.0, 3.3, 2.4, 4.0, 3.5]
let people = ["Jobs", "Cook", "Musk"]



// 출력하는 함수 만들기 ===> 각 케이스(타입)마다 필요한 함수를 만들어야함
func printIntArray(array: [Int]) {
    for number in array {
        print(number)
    }
}


func printDoubleArray(array: [Double]) {
    for number in array {
        print(number)
    }
}


func printStringArray(array: [String]) {
    for number in array {
        print(number)
    }
}


printIntArray(array: numbers)
printDoubleArray(array: scores)
printStringArray(array: people)



// 따지고 보면 기능은 똑같은데..

// 타입이 다르다는 이유로 여러개의 함수를 만드는 것이 비효율적이라는 것


/*: ---
 - 제네릭(Generics)의 개념이 없다면, 함수를 모든 경우마다 다시 정의해야 한다.
 ---
 */

/**===================================================================================
 - 제네릭 문법
 - 형식에 관계없이, 한번의 구현으로 모든 타입을 처리하여, 타입에 유연한 함수 작성가능 (유지보수/재사용성 증가)
 - (함수 뿐만아니라) 구조체 / 클래스 / 열거형도 제네릭으로 일반화 가능


 - 타입 파라미터는 함수 내부에서 파라미터 형식이나 리턴형으로 사용됨 (함수 바디에서 사용하는 것도 가능)
 - 보통은 T를 사용하지만 다른 이름을 사용하는 것도 문제가 없음, 형식이름이기 때문에 UpperCamelcase로 선언
 - 2개이상을 선언하는 것도 가능


 - 제네릭은 타입에 관계없이, 하나의 정의(구현)로 모든 타입(자료형)을 처리할 수 있는 문법
 - 제네릭 함수, 제네릭 구조체/클래스
 - 일반 함수와 비교해보면, 작성해야하는 코드의 양이 비약적으로 감소


 - 타입 파라미터는 실제 자료형으로 대체되는 플레이스 홀더(어떤 기호같은것) ===> 새로운 형식이 생성되는 것이 아님
 - 코드가 실행될때 문맥에 따라서 실제 형식으로 대체되는 "플레이스 홀더"일뿐
======================================================================================**/


//: ---

/*: ## 제네릭 함수의 정의
 - 제네릭(Generics) 함수를 정의하는 방법
 ---
 */

/**================================================================================
 - 타입 파라미터<T>는 함수 내부에서 파라미터의 타입이나 리턴형으로 사용됨 (함수 바디에서 사용하는 것도 가능)
 - (1) 관습적으로 Type(타입)의 의미인 대문자 T를 사용하지만,
       다른 문자를 사용해도 됨 <U> <A> <B> <Anything> (Upper camel case사용해야함)
 - (2) <T, U> <A, B> 이렇게 타입파라미터를 2개이상도 선언 가능
 ==================================================================================**/

// 한번의 구현으로 모든 타입을 커버가능한 문법: 제네릭

// 파라미터의 타입에 구애받지 않는 일반적인(제네릭) 타입을 정의

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {      // 플레이스홀더의 역할(표시 역할일뿐) (같은 타입이어야함)
    let tempA = a
    a = b
    b = tempA
}



var string1 = "hello"
var string2 = "world"



// 제네릭으로 정의한 함수 사용해보기

swapTwoValues(&string1, &string2)     // 같은 타입이라면, 어떠한 값도 전달 가능 해짐
print(string1)
print(string2)
swapTwoValues(&num1, &num2)


// 배열을 출력하는 예제

func printArray<T>(array: [T]) {
    for element in array {
        print(element)
    }
}


printArray(array: numbers)     // 플레이스홀더 ====> [Int]
printArray(array: scores)      // 플레이스홀더 ====> [Double]
printArray(array: people)      // 플레이스홀더 ====> [String]

/*: ---
 - 제네릭의 사용예시 - 스위프트 문법
 ---
 */

// 스위프트에서 컬렉션은 모두 구조체의 제네릭 타입으로 구현되어 있음


// 배열 타입
let array1: [String] = ["Steve", "Allen"]
let array2: Array<String> = ["Cook", "Musk"]      // 실제 컴파일시 내부에서 일어나는 일



// 딕셔너리 타입
let dictType1: [String: Int] = ["Steve": 20, "Paul": 24]
let dictType2: Dictionary<String, Int> = ["Alex": 25, "Michel": 18]


// 옵셔널 타입
var optionalType1: String?
var optionalType2: Optional<String>



// 실제로 스위프트 내부 구현에는 제네릭을 많이 사용

// (이제 볼 줄 알게됨)

//swap(<#T##a: &T##T#>, <#T##b: &T##T#>)

// [1,2,3].map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)

// T: 어떤 것으로도 바꿀 수 있다는 뜻 -> 제네릭

// 플레이스홀더(PlaceHolder): 위치에서 무엇을 의미하는지를 표시해주는 예시(어떤 타입이 입력되어야 한다는 것을 제시)

//: ---

/*: ## 제네릭 타입의 정의
 - 제네릭(Generics) 구조체 / 클래스 / (열거형)
 ---
 */
/**====================================================================
 - 클래스, 구조체, 열거형의 타입이름 뒤에 타입 파라미터<T>를 추가하면, 제네릭 타입으로 선언됨
 
 - 타입 파라미터는 타입(형식) 이름뒤에 선언, 타입 제약 문법도 동일함  GridPoint<T: Equatable>

 - 속성의 자료형, 메서드의 파라미터형식, 리턴형을 타입 파라미터로 대체 가능
 ======================================================================**/


// 구조체로 제네릭의 정의하기

// 클래스, 구조체를 정의하는 데, 안의 멤버 변수들은 여러가지 타입을 가질 수 있는 가능성이 있을 것 같다면?


struct Member {
    var members: [String] = []
}



struct GenericMember<T> {
    var members: [T] = []
}






var member1 = GenericMember(members: ["Jobs", "Cook", "Musk"])  // 타입이 고정됨:메모리 구조가 결정됨
var member2 = GenericMember(members: [1, 2, 3])




// 클래스로 제네릭의 정의하기

class GridPoint<A> {
    var x: A
    var y: A
    
    init(x: A, y: A){
        self.x = x
        self.y = y
    }
}


let aPoint = GridPoint(x: 10, y: 20)
let bPoint = GridPoint(x: 10.4, y: 20.5)




// 열거형에서 연관값을 가질때 제네릭으로 정의가능

// (어짜피 케이스는 자체가 선택항목 중에 하나일뿐(특별타입)이고, 그것을 타입으로 정의할 일은 없음)

enum Pet<T> {
    case dog
    case cat
    case etc(T)
}



let animal = Pet.etc("고슴도치")








/*: ---
 - 제네릭(Generics) 구조체의 확장
 ---
 */
// 정의

struct Coordinates<T> {
    var x: T
    var y: T
}



// 제네릭을 Extension(확장)에도 적용할 수 있다. (확장 대상을 제한하는 것도 가능은 함)

extension Coordinates {     // Coordinates<T> (X)   본체(구조체)에서만 <T> 사용, 확장에서는 사용 X
    
    // 튜플로 리턴하는 메서드
    func getPlace() -> (T, T) {
        return (x, y)
    }
}


let place = Coordinates(x: 5, y: 5)
print(place.getPlace())




// where절 추가도 가능
// Int타입에만 적용되는 확장과 getIntArray() 메서드

extension Coordinates where T == Int {     // Coordinates<T> (X)    // 정수형일때만 메서드 구현
    
    // 튜플로 리턴하는 메서드
    func getIntArray() -> [T] {
        return [x, y]
    }
}


let place2 = Coordinates(x: 3, y: 5)
place2.getIntArray()




//let place3 = Coordinates(x: 3.5, y: 2.5)
//place3.getIntArray()



/*: ---
 - 타입 제약(Type Constraint)
 ---
 */
/**==================================================================
 - 제네릭에서 타입을 제약할수 있음
 
 - 타입 매개 변수 이름 뒤에 콜론으로 "프로토콜" 제약 조건 또는 "단일 클래스"를 배치 가능
 
 - (1) 프로토콜 제약 <T: Equatable>
 
 - (2) 클래스 제약 <T: SomeClass>
 
====================================================================**/



// Equatable 프로토콜을 채택한 타입만 해당 함수에서 사용 가능 하다는 제약

// 모든 타입을 사용할 수 있는 것이 아니고, 제네릭 문법이라고 하더라도 모든 타입을 사용할 수 있는 것이 아니고 Equatable 프로토콜을 채택한 타입만 이 함수를 사용할 수 있다는 뜻

func findIndex<T: Equatable>(item: T, array:[T]) -> Int? {     // <T: Equatable>
    for (index, value) in array.enumerated() {
        if item == value {
            return index
        }
    }
    return nil
}

// findIndex(item: <#T##Equatable#>, array: <#T##[Equatable]#>)


let aNumber = 5
let someArray = [3, 4, 5, 6, 7]

if let index = findIndex(item: aNumber, array: someArray) {
    print("밸류값과 같은 배열의 인덱스: \(index)")
}


// 클래스 제약의 예시


class Person {}
class Student: Person {}

let person = Person()
let student = Student()



// 특정 클래스와 상속관계에 내에 있는 클래스만 타입으로 사용할 수 있다는 제약  (구조체, 열거형은 사용 못함)

// (해당 타입을 상속한 클래스는 가능)

// 이 함수를 실행하려면 반드시 Person 타입과 관계가 있는 즉, Person의 상속 구조에 속해 있는 타입만 이 함수로서 사용이 가능하다는 뜻

func personClassOnly<T: Person>(array: [T]) {
    
    // 함수의 내용 정의
}


personClassOnly(array: [person, person])
personClassOnly(array: [student, student])

//personClassOnly(array: [Person(), Student()])


/*: ---
 - 반대로 구체/특정화(specialization) 함수구현도 가능
 ---
 */
/**=================================================================================
 - 항상 제네릭을 적용시킨 함수를 실행하게만 하면, 또다른 불편함이 생기지 않을까?
 - (제네릭 함수가 존재하더라도) 동일한 함수이름에 구체적인 타입을 명시하면, 해당 구체적인 타입의 함수가 실행됨
 ===================================================================================**/


// 문자열의 경우, 대소문자를 무시하고 비교하고 싶어서 아래와 같이 구현 가능 ⭐️
// 위의 findIndex<T: Equatable>(item: T, array:[T]) -> Int? 와 완전 동일

func findIndex(item: String, array:[String]) -> Int? {
    for (index, value) in array.enumerated() {
        if item.caseInsensitiveCompare(value) == .orderedSame {
            return index
        }
    }
    return nil
}



let aString = "jobs"
let someStringArray = ["Jobs", "Musk"]


if let index2 = findIndex(item: aString, array: someStringArray) {
    print("문자열의 비교:", index2)
}

//: ---

/*: ## 프로토콜에서의 제네릭 문법의 사용
 - 프로토콜에서 제네릭의 사용 - Associated Types(연관 타입)
 ---
 */
/**================================================
 - 프로토콜을 제네릭 방식으로 선언하려면 어떻게 해야할까?
 - 연관타입(Assiciated Types)으로 선언해야함 ⭐️

 - 프로토콜은 타입들이 채택할 수 있는 한차원 높은 단계에서
   요구사항만을 선언(자격증)하는 개념이기 때문에
   제네릭 타입과 조금 다른 개념(연관타입)을 추가적으로 도입한 것 뿐
 
 [프로토콜 방식]
 - <T> ===> associatedtype T
 =================================================**/


protocol RemoteControl {           // <T>의 방식이 아님
    associatedtype T               // 연관형식은 대문자로 시작해야함(UpperCamelcase)
    func changeChannel(to: T)      // 관습적으로 Element를 많이 사용
    func alert() -> T?
}



// 연관형식이 선언된 프로토콜을 채용한 타입은, typealias로 실제 형식을 표시해야함

struct TV: RemoteControl {
    
    typealias T = Int       // 생략 가능
    
    func changeChannel(to: Int) {
        print("TV 채널바꿈: \(to)")
    }
    
    func alert() -> Int? {
        return 1
    }

}



class Aircon: RemoteControl {

    // 연관형식이 추론됨
    
    func changeChannel(to: String) {
        print("Aircon 온도바꿈: \(to)")
    }

    func alert() -> String? {
        return "1"
    }

}


/*: ---
 - 연관 형식에 제약을 추가한다면
 ---
 */
protocol RemoteControl2 {
    associatedtype Element: Equatable     // <T: Equatable> 제약조건 추가
    func changeChannel(to: Element)
    func alert() -> Element?
}
