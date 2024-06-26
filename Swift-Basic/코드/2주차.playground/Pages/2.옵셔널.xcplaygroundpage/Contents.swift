import UIKit

/*:# Optionals(옵셔널)
 */

/*: ---
 - 타입의 기본 개념에 대한 이해
 ---
 */
// 스위프트는 왜 옵셔널이라는 개념을 도입했을까?

// 모든 프로그래밍에서 아래와 같은 상황은 항상 골칫거리임

var yourName: String // 타입 선언

// yourName = "홍길동" // 초기화: 값을 저장하지 않는다면...?

// print(yourName)      // 출력: 에러 발생. 그리고 실제로 앱이 꺼진다.

//:>(만약 저장과정이 없다면) 메모리에 저장된 값이 없는데 접근: 🔸"에러"
/*
 
 메모리 공간을 선언하고 그곳에 값이 없으면, 타입을 선언했는데 값이 없으면 에러가 발생하고 실제로는 앱이 꺼진다.
 
 그런데 메모리 공간에 임시 타임(옵셔널)을 정의해 가지고 물음표를 붙인 새로운 타입을 정의해서 임시 타입으로 선언한다.
 
 그러면 CPU가 이 메모리 공간에 접근했을때 임시 타입이 일단은 무언가가 무조건 들어있다고 판단하게 된다.
 
 그래서 에러가 발생하지 않는다. 비유를 하면 포장지로 둘러쌓여 있는 개념이라고 생각하면 된다.
 
 그리고 실제로 이 내부에 있는 값을 사용하려면 포장지를 한번 벗겨야 한다.
 
 예를 들어, 옵셔널 정수형 타입 10, Optional(10)의 의미는 정수형 10이 아니라 Optional 정수형 타입 10,
 
 그러니까 옵셔널이라는 포장지로 둘러쌓여 있는 개념이라고 생각하면 된다.
 
 nil 이라는 것은 실제로 값이 없음을 나타내는 것이 아니고, 포장지로 둘러 쌓여서 값이 없음을 '의미' 하고 있는 것이다.
 
 옵셔널 타입을 실제로 사용하려면 값을 벗겨내는 과정이 필요하고, 강제로 벗기게 되면 에러가 발생한다.
 */

/*: ---
 - 타입(Type)
 ---
 */
// 지금까지의 타입 선언

let name: String = "Jobs"        // 명시적

let newName = "Musk"             // 암시적

var myAge = 20                   // 암시적

let myGrade: Double = 3.54       // 명시적


/*: ---
 
 옵셔널 타입(Optional Type)
 
 ---
 */
// 모든 타입의 뒤에 ? 물음표를 붙이면 옵셔널 타입이 된다.

var num: Int? = 3

var yourAge: Int? = nil

// 옵셔널 타입으로 선언할 때는 반드시 타입을 명시적으로 선언해야함.

// var yourAge = nil → 성립안됨

var yourGrade: Double? = nil

var name1: String? = "Jobs"

num = nil

name1 = nil


// 값이 없어도 되는 타입으로 선언 했기 때문에, 값이 없어도 괜찮음


//:> nil - 값이 없음을 나타내는 키워드 (실제 값이 없음이 아님)

/*: ---
 - 옵셔널, 옵셔널 타입의 기본 개념에 대한 이해
 ---
 */
// 메모리 공간에 '임시적인 타입'을 넣어놓으면 어떨까?


var optionalName: String?

optionalName = "홍길동"


// nil 이라는 것은 실제 값이 없다는 것이 아니라 값이 없을수도 있다는 것을 알려주는 키워드이다.


print(optionalName)

// 에러가 나지 않음 (옵셔널은 값이 없다는 것을 나타내는 키워드)



/**=========================================
 
 - 옵셔널 타입 선언의 기본 규칙
 
 - 1) nil 대입 가능
 
 - 2) 자동 초기화 (값을 넣지 않을 시에 nil로 초기화) ⭐️
 
 ============================================**/


/*: ---
 - 정식문법 표기
 ---
 */
let num1: Int? = 2             // 간편표기

let num2: Optional<Int> = 0    // 정식문법

/*: ---
 - 옵셔널 타입 연습
 ---
 */
var optionalNum: Int? = nil

// var optionalNum = nil         // 불가능한 형태

// (추론할 형식이 없기 때문에 반드시 타입 어노테이션으로 초기화해야됨)

optionalNum = 10

// 값이 없을 수도 있는 (임시적인)타입이야


print(optionalNum)      // Optional(10)





let str: String = "Swift"

var optionalStr: String? = nil

// 옵셔널 스트링 타입 ====> (값이 없을 수도 있는 타입이다)

// 옵셔널 타입의 경우 반드시 변수로 선언해야 한다.

// 왜냐하면 값이 없다는 것을 의미하고, 값이 들어갈 수 있어야 하고,

// 변할 수 있어야 하기 때문. 그래서 옵셔널 타입은 항상 변수로 선언한다.




var a: Int? = 7  // 옵셔널 인트

var b = a        // 값을 복사해서 담는 다면 타입은?

// 옵셔널 정수형의 범위가 정수형의 범위보다 더 넓으므로 옵셔널 타입으로 전환

print(b)




var c: Int = 5

b = c

// Int를 Int?타입에 담을 수는 있다. (어쨌든 타입이 Int? 타입으로 바뀌어서 담김)

print(b)


/*: ---
 - 옵셔널 타입끼리의 연산은 불가능
 ---
 */

//:> 옵셔널 타입끼리의 계산은 당연히 불가능
// 옵셔널 타입은 임시적인 타입이기 때문에 연산이 불가능하다고 이해하면 된다.

var numA: Int? = 3

var numB: Int? = 7

// print(numA + numB)




/*: ## 옵셔널 타입 사용하기
 - 옵셔널 타입: 값이 없을 수도 있는 경우를 포함하는(감싸고) 있는 임시적 타입
 ---
 */

var optionalNumber: Int?

// 간편 표기. 정식 표기 -> var num3: Optional<Int>

var optionalString: String? = "안녕하세요."

print(optionalNumber)

print(optionalString)


/*: ## 옵셔널 값을 추출하는 4가지 방법
 ---
 
 */


/*:---
 1) 강제로 값을 추출(Forced UnWrapping): 값이 있다는 것이 확실할 때 사용
 ---
 */
// 강제 추출연산자 !를 옵셔널표현식 뒤에 붙여서 강제로 옵셔널값을 추출

print(optionalString!)

// print(num3!)       // 에러: 값이 없는데 강제 추출하니 당연히 에러가 발생한다.

/*: ---
 - 2) if문으로 nil이 아니라는 것을 확인한 후, 강제로 벗기기
 ---
 */


if optionalString != nil {
    
    print(optionalString!)
    
}

if optionalNumber != nil {
    
    print(optionalNumber!)     // optionalNumber == nil
    
}





/*: ---
 3) 옵셔널 바인딩 (if  let 바인딩) ⭐️⭐️⭐️
 ---
 */

//:> 옵셔널 바인딩 - 바인딩이 된다면, 특정 작업을 하겠다는 의미


if let s = optionalString {
    
    // s라는 상수에 담긴다면    // nil
    
    
    print(s)
}

/*
 
 str이라는 메모리 공간에 있는 어떤 옵셔널 값이 s라는 상수에 담긴다면 이라는 뜻
 
 str이라는 옵셔널 타입의 변수를 새로운 공간인 s라는 상수에 바꿔서 담는다는 뜻
 
 바꿔서 담긴다면, 즉 안에 값이 있다면,
 
 나는 이 값을 사용하겠다(우아하게 벗겨서 사용) 라는 뜻
 
 만약 "옵셔널 str이라는 값에 nil이 들어있다면, 값이 없다면
 
 s라는 문자열 타입의 상수는 실행시키지 않는다." 라는 뜻이다.
 
 if let 바인딩 문법은 if문에서 예외적으로 조건을 따지지 않는 문법이다.
 
 */


var optionalpi: Double? = 3.14



if let pi = optionalpi {
    
    print(pi)
}

// print(pi): if문 안에서 사용된 pi라는 상수는 당연히 밖에서 사용 불가

// 실제 앱을 만들때 guard let 바인딩 많이 사용



func doSomething(action: String?) {
    
    guard let a = action else { return }
    
    print(a)
    
}

// 그러나 가드문의 경우에는 사용된 변수를 아래에서 사용 가능

doSomething(action: "work")

//  Optional("work")가 a라는 상수에 벗겨져서 담긴다면,

// 가드문이 참이므로 함수를 실행시킨다 라는 뜻

// if var 바인딩도 사용 가능하나, 사용하는 일이 거의 없음

// 일반적으로 값을 즉시 사용하기 때문에, 즉 변하는 일이 없기에 대부분 사용 X


/*: ---
 4) 닐 코얼레싱(Nil-Coalescing)연산자를 사용하는 방법
 ---
 */

//:> 코얼레싱(coalesce): 영어로 (더 큰 덩어리로) 합치다는 뜻
// 옵셔널 타입에 대하여, 디폴트(기본)값을 제시할 수 있을 때 사용

// (직접 값을 벗겨서 사용하는 것은 아니고, 디폴트값 제시를 통해 옵셔널 가능성을 없애는 방법)


var serverName: String? = "홍길동" //optional("홍길동")


var userName = serverName ?? "미인증사용자"   // 디폴트 값(미인증사용자) 제시

print(userName)

/*
 기본값을 제시해준다. 디폴트 값을 제시한다는 뜻
 
 옵셔널 타입이 있는데(serverName) 값이 "홍길동" 이라면
 
 즉, Optional("홍길동")이라면 나는 "홍길동"을 출력할 것이고
 
 nil이라면 ?? 뒤에 "미인증사용자" 라는 "디 폴 트" 값을 사용하겠다는 뜻.
 
 따라서 이 경우는 nil이 나올 수가 없다. 값이 있으면 "홍길동"을 사용
 
 값이 없으면 디폴트 값인 "미인증사용자"를 사용하기 때문에.
 
 */

var helloString: String? = "안녕하세요."

var hello = "인사하겠습니다." + (helloString ?? "say hi")

print(hello)

print(helloString)

helloString = nil

print(helloString ?? "say hi")

print(hello)

