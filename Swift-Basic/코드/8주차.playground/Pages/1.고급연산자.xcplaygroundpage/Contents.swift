import UIKit

/*: # 고급연산자(Advanced Operators)
 ---
 */

/*: ## 숫자 리터럴
 - 스위프트의 숫자 리터럴 표기방법
 ---
 */
//스위프트의 숫자 리터럴을 표기하는 방법

var num: Int = 25


// 2진법/8진법/16진법의 수도 직접 써 넣을 수 있음

num = 0b00011001        // binary
num = 0o31
num = 0x19


// 큰숫자는 읽기 쉽게하기위해 언더바를 붙이는 것도 가능
// (단순히 언더바를 읽지않음)
num = 1_000_000
num = 10_000_000
num = 10000_0000




/*: ---
 - 스위프트 정수 타입과 범위
 ---
 */
/**========================================
[스위프트의 정수 타입]
 - 플랫폼 사양에 따르는 타입 : Int, UInt(양의 정수) (최근 대부분 64비트):8바이트의 메모리 공간을 사용
 -  8-bit : Int8, UInt8
 - 16-bit : Int16, UInt16
 - 32-bit : Int32, UInt32
 - 64-bit : Int64, UInt64
===========================================**/


MemoryLayout<Int8>.size   // 1바이트
Int8.max      //  127    ( 2^7승 -1)
Int8.min      // -128    (-2^7승)


MemoryLayout<UInt8>.size     // 1바이트
UInt8.max     //  255     ( 2^8승 -1)
UInt8.min     //    0


MemoryLayout<Int>.size     // 8바이트
Int.max       //  9223372036854775807   ( 2^63승 -1)
Int.min       // -9223372036854775808   (-2^63승 )

//: ---

/*: ## 오버플로우
 - 오버플로우의 개념
 ***
 */

/**==============================================================
 [오버플로우(overflow)]
 - C언어나 Objective-C언어의 산술연산자에서는 값이 넘침(overflow)을 허락했지만
   (예를 들어, 8비트 값을 담을 수 있는 숫자에서 255를 넘어가면 다시 0으로 순환)
   스위프트에서는 오버플로우를 기본적으로 허락하지 않음 ===> 에러발생(크래시)
 - 오버플로우의 방향은 양(positive)의 방향, 음(nagative)의 방향을 모두 의미
 
 - 특정한 경우에, 특정패턴을 구현하기 위해 오버플로우를 허용하는 경우가 필요한데,
   이런 경우 활용을 위해 "오버플로우 연산자"를 마련해 놓았음
================================================================**/


UInt8.max   // UInt8(8비트의 값을 담을 수 있음)의 최대값 255

UInt8.min   // UInt8(8비트의 값을 담을 수 있음)의 최소값 0

//let num: UInt8 = 300  // 오버플로우 에러 발생

/*: ## 오버플로우 연산자
 - 스위프트의 3가지 오퍼플로우 연산자
 ***
 */

//:> 스위프트에서는 오버플로우 연산자 따로 존재

/**===========================
 [오버플로우 연산자]
 - &+ : 오버플로우 더하기 연산자
 - &- : 오버플로우 빼기 연산자
 - &* : 오버플로우 곱하기 연산자
 
 - 앰퍼샌드(&)기호가 붙어있음
=============================**/
 
/*: ---
 - 부호가 없는 경우(Unsigned)의 오버플로우
 ---
 */

/**=========================
 - UInt8타입의 범위: 0 ~ 255
 ===========================**/


// &+ : 오버플로우 더하기 연산자

var a = UInt8.max  // 현재 변수 a에 UInt8타입의 최대값이 들어있음(255)
a = a &+ 1         // 오버플로우 더하기 연산자로 1을 더하기 ==========> 최소값(0)으로 이동

//a = 0b11111111 &+ 0b00000001




// &- : 오버플로우 빼기 연산자

var b = UInt8.min  // 현재 변수 b에 UInt8타입의 최소값이 들어있음(0)
b = b &- 1         // 오버플로우 빼기 연산자로 1을 빼기 ==========> 최대값(255)으로 이동

//b = 0b00000000 &- 0b00000001

/*: ---
 - 부호가 있는 경우(Signed)의 오버플로우
 ---
 */

/**=========================
 - Int8타입의 범위: -128 ~ 127
 ===========================**/


// &+ : 오버플로우 더하기 연산자

var a1 = Int8.max   // 현재 변수 a1에 Int8타입의 최대값이 들어있음(127)
a1 = a1 &+ 1        // 오버플로우 더하기 연산자로 1을 더하기 ==========> 최소값(-128)으로 이동

//a1 = 0b01111111 &+ 0b00000001


// &- : 오버플로우 빼기 연산자

var b1 = Int8.min   // 현재 변수 b1에 Int8타입의 최소값이 들어있음(-128)
b1 = b1 &- 1        // 오버플로우 빼기 연산자로 1을 빼기 ==========> 최대값(127)으로 이동


//b1 = -0b10000000 &- 0b00000001



// &* : 오버플로우 곱하기 연산자

var c1 = Int8.max   // 현재 변수 c에 Int8타입의 최대값이 들어있음(127)
c1 = c1 &* 2        // 오버플로우 곱하기 연산자로 2 곱하기 ==========> 비트 한칸씩 이동


//c = 0b01111111 &* 2

//: ---


/*: ## 논리연산자와 단락 평가
 - 논리 연산자(Logical Operators)
 ---
 */
// 1) Logical NOT Operator

!true
!false


// 2) Logical AND Operator(앤드, 그리고)

true && true
true && false
false && true
false && false


// 3) Logical OR Operator(또는)

true || true
true || false
false || true
false || false


/**======================================================================================
 - false && true 에서 false만 확인 (항상 false) ====> 왜냐하면, 2번째 결과에 상관없이 false로 평가되기 때문
 - true || false 에서 true만 확인 (항상 true) ====> 왜냐하면, 2번째 결과에 상관없이 true로 평가되기 때문
=========================================================================================**/


/*: ---
 - 단락 평가(Short-circuit Evaluation)
 ---
 */


/**===========================================================
 - 스위프트의 논리 평가식은 "단락 평가" 방식을 사용
 - 단락평가: 논리 평가식에서 결과도출에 필요한 최소한의 논리식만 평가
          (예: 참을 찾을때 까지만 실행하고, 참을 찾으면 나머지 표현식은 평가하지 않음)
          (최소한의 코드만 실행 - Short-circuit evaluation)
 - 참고: 논리연산자 우선순위 1) && 2) ||
 =============================================================**/


var number = 0


func checking() -> Bool {
    print(#function)    // 지금 실행되고 있는 함수의 이름을 출력
    number += 1
    return true
}

checking()


// if문의 조건식에서 함수를 호출하는 경우

if checking() || checking() {    // &&으로 바꿔보기   // true true
             // &&
    
}


number


/*: ---
 - 단락 평가에서 발생할 수 있는 문제 경우의 예시
 ---
 */

var doorCheck = 0
var passwordCheck = 0

func doorCodeChecking() -> Bool {
    doorCheck += 1
    print(#function)
    return true
}

func passwordCodeChecking() -> Bool {
    passwordCheck += 1
    print(#function)
    return true
}



// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?

print("\n[ 첫번째 케이스 ] =============")
if doorCodeChecking() && passwordCodeChecking() && false || true && doorCodeChecking() && passwordCodeChecking() {
    
}
print("Door: \(doorCheck), Password: \(passwordCheck)")




print("\n[ 두번째 케이스 ] =============")
doorCheck = 0
passwordCheck = 0

if doorCodeChecking() && false && passwordCodeChecking() || doorCodeChecking() || passwordCodeChecking() {
    
}
print("Door: \(doorCheck), Password: \(passwordCheck)")




print("\n[ 세번째 케이스 ] =============")
doorCheck = 0
passwordCheck = 0

if doorCodeChecking() || passwordCodeChecking() && doorCodeChecking() || false && passwordCodeChecking() {
    
}
print("Door: \(doorCheck), Password: \(passwordCheck)")





/**===========================================================
 - 단락 평가로 인한 주의 ⭐️
 - 사이드 이팩트 발생시는 반드시 주의
   일부 변수가 표현식의 평가 결과로 값이 변경되는 것 (여기서는 doorCheck += 1)
   논리평가식에서 사이드 이펙트가 발생하는 경우, 단락평가로 인해 함수 등의
   실행횟수의 차이로 인해 의도치 않은 결과가 도출될 수 있음
 
   ===> 논리적인 오류가 없도록 표현식을 미리 실행하도록 코드 수정
 =============================================================**/




print("\n[ 세번째 케이스를 수정한다면 ] =============")
doorCheck = 0
passwordCheck = 0


let doorResult1 = doorCodeChecking()
let passwordResult1 = passwordCodeChecking()
let doorResult2 = doorCodeChecking()
let passwordResult2 = passwordCodeChecking()


if doorResult1 || passwordResult1 && doorResult1 || false && passwordResult2 {
    
}
print("Door: \(doorCheck), Password: \(passwordCheck)")



//: ---

/*: ## 비트 연산자
 - 비트 연산자(Bitwise Operators)
 ---
 */

//:> 비트 연산자 ➞ 실제 앱개발에서 사용되는 경우는 거의 없음

/**============================================================
 [비트 연산]
  - 메모리 비트 단위로 직접적인 논리연산을 하거나, 비트 단위 이동시에 사용하는 연산
 
  - 주로, 어떤 하드웨어적인 처리(예, 장치 드라이버 생성)나 그래픽 프로그래밍과
    임베디드 프로그래밍, 암호화처리, 게임 등 아주 한정적으로 쓰이는 이론적인 내용
    (프로그래밍을 배우고 있다는 목적아래, 이론적으로 듣고 지나치면 됨)
 
  - 장점: 1) 연산속도가 빠름 - 직접적으로 메모리의 실제 비트를 컨트롤
         2) 짧은 코드로 복잡한 로직을 구현 가능한 경우가 있음
 =============================================================**/

/**==========================================================
 [스위프트 비트연산자 종류 6가지]
 (비트 논리 연산자)
 1)  ~  : Bitwise NOT Operator(비트와이즈 낫 연산자)
 2)  &  : Bitwise AND Operator(비트와이즈 앤드 연산자)
 3)  |  : Bitwise OR Operator(비트와이즈 오어 연산자)
 4)  ^  : Bitwise XOR Operator(비트와이즈 엑스오어 연산자)
 
 (비트 이동 연산자)
 5)  << : Bitwise Left Shift Operator(비트와이즈 레프트 시프트 연산자)
 6)  >> : Bitwise Right Shift Operator(비트와이즈 라이트 시프트 연산자)
 ===========================================================**/


/*: ## 비트 논리 연산자
 - 1)Bitwise NOT Operator(비트와이즈 낫 연산자)
 ---
 */

// ~a
// 비트 논리 부정 연산자라고도 함, 단항연산자의 형태로 사용
// 기존의 메모리의 비트를 반전 시킴
// (0은 1로, 1은 0으로 반전)

/*:
 ![not](bitwiseNOT_2x.png)
 */

let a0: UInt8 = 0b0000_1111    // 15
let b0 = ~a0  // 0b1111_0000   // 240

/*:
 ---
 * 2) Bitwise AND Operator(비트와이즈 앤드 연산자)
 ---
 */
// a & b  (앰퍼샌드 기호를 사용)
// 비트 논리 곱 연산자라고도 함, 이항연산자의 형태로 사용
// 두개의 메모리의 비트 중 모두가 1이면 1을 반환
// 두개의 메모리의 비트가 둘 다 1일때만 1로 설정 (true && true)
/*:
 ![and](bitwiseAND_2x.png)
 */

let a2: UInt8 = 0b1111_1100   // 252
let b2: UInt8 = 0b0011_1111   // 63
let c2 = a2 & b2  // 0b0011_1100      // 60


/*:
 ---
 * 3) Bitwise OR Operator(비트와이즈 오어 연산자)
 ---
 */
// a | b  (버티컬 바 기호를 사용)
// 비트 논리 합 연산자라고도 함, 이항연산자의 형태로 사용
// 두개의 메모리의 비트 중 하나라도 1이면 1을 반환
// (true || true)
/*:
 ![or](bitwiseOR_2x.png)
 */

let a3: UInt8 = 0b1011_0010   // 178
let b3: UInt8 = 0b0101_1110   // 94
let c3 = a3 | b3  // 0b1111_1110      // 254


/*:
 ---
 * 4) Bitwise XOR Operator(비트와이즈 엑스오어 연산자)
 ---
 */
// a ^ b  (캐럿 기호를 사용)
// 비트 논리 배타 연산자(또는 익스클루시브 OR 연산자)라고도 함, 이항연산자의 형태로 사용
// 두개의 메모리의 비트 중 둘을 비교해서 서로 다르면 1을 반환
// (서로 다르면 ===> 1을 반환, 서로 같으면 ===> 0을 반환)
/*:
 ![xor](bitwiseXOR_2x.png)
 */

let a4: UInt8 = 0b0001_0100    // 20
let b4: UInt8 = 0b0000_0101    // 5
let c4 = a4 ^ b4  // 0b0001_0001    // 17






/*:
 ## 비트 이동 연산자
 * 비트 이동 연산자
 ---
 */
/**==========================================================
 (비트 이동 연산자의 기본 원리)
 - 모든 비트를 정해진 값만큼 왼쪽이나 오른쪽으로 이동
 - 비트를 이동하는 것은 2를 곱하거나, 나누는 효과를 가짐
 
 (예) 정수 비트를 왼쪽으로 1칸 이동하면 값이 2배가 됨
 ===========================================================**/
//:>부호가 있을때만 주의

/*:
 ## 1) 부호가 없는(Unsigned) 비트 이동 연산자
 * 부호가 없는 경우의 비트 이동 연산자
 ---
 */
/**==========================================================
 (부호가 없는 비트 이동 연산자의 경우) - Unsigned
 - 1) 기존 비트를 요청된 값만큼 왼쪽이나 오른쪽으로 이동
 - 2) 정수(integer)의 수용 범위를 넘어서는 비트는 어떤 것이든 버림
 - 3) 비트를 왼쪽이나 오른쪽으로 이동하면서 남는 공간에는 0을 삽입
 ===========================================================**/
/*:
 ![shift](bitshiftUnsigned_2x.png)
 */

/*:
---
 * 5) Bitwise Left Shift Operator(비트와이즈 레프트 시프트 연산자)
 ---
 */
let leftShiftBits: UInt8 = 4   // 0b0000_0100   //   4
leftShiftBits << 1             // 0b0000_1000   //   8 (곱하기 2)
leftShiftBits << 2             // 0b0001_0000   //  16 (곱하기 2^2승 => 곱하기 4)
leftShiftBits << 5             // 0b1000_0000   // 128 (곱하기 2^5승 => 곱하기 32)

/*:
 ---
 * 6) Bitwise Right Shift Operator(비트와이즈 라이트 시프트 연산자)
 ---
 */
let rightShiftBits: UInt8 = 32  // 0b0010_0000   //  32
rightShiftBits >> 1             // 0b0001_0000   //  16 (나누기 2)
rightShiftBits >> 2             // 0b0000_1000   //   8 (나누기 4)
rightShiftBits >> 5             // 0b0000_0001   //   1 (나누기 2^5승)


/*:
 ## 2) 부호가 있는(Signed) 비트 이동 연산자
 * 부호가 있는 경우의 비트 이동 연산자
 ---
 */

/**==========================================================
 (부호가 있는 비트 이동 연산자의 경우) - Signed
 - 1) 기존 비트를 요청된 값만큼 왼쪽이나 오른쪽으로 이동
 - 2) 정수(integer)의 수용 범위를 넘어서는 비트는 어떤 것이든 버림
 - 3) 비트를 왼쪽으로 이동하면서 남는 공간에는 0을 삽입
 - 4) 비트가 오른쪽으로 이동하면서 남는 공간에는 부호가 없을땐 0 삽입
      부호가 있을때만 1 삽입 ⭐️ (원래의 부호 유지를 위한 삽입) (오른쪽 이동시만 주의하면됨)
 ===========================================================**/
/*:
 ![shift](bitshiftSigned_2x.png)
 */

/*:
---
 * 5) Bitwise Left Shift Operator(비트와이즈 레프트 시프트 연산자)
 ---
 */
let shiftBits: Int8 = 4    // 0b0000_0100   //   4
shiftBits << 1             // 0b0000_1000   //   8 (곱하기 2)
shiftBits << 2             // 0b0001_0000   //  16 (곱하기 4)

shiftBits << 5             // 0b1000_0000   //-128 (곱하기 2^5승, 다만 여기선 범위초과로 오버플로우)


/*:
 ---
 * 6) Bitwise Right Shift Operator(비트와이즈 라이트 시프트 연산자)
 ---
 */
//:> 부호 유지를 위한 삽입! 이라고 기억 (용어 - Arithmetic 산술 시프트)
let shiftSignedBits: Int8 = -2   // 0b1111_1110   //  -2
shiftSignedBits >> 1             // 0b1111_1111   //  -1 (나누기 2) 몫
shiftSignedBits >> 2             // 0b1111_1111   //  -1 (나누기 4) 몫

shiftSignedBits >> 5             // 0b1111_1111   //  -1 (나누기 2^5승) 몫


//: ---

/*:
 ## 연산자 메서드
 * 연산자 메서드? 커스텀 타입에도 메서드의 형태로 연산자(+, -, == 등)를 구현 가능
 ---
 */
// 조금 더 깊게 연산자에대해 이해해보기
// (연산자도 사실은 내부적으로 다 구현이 되어있는 타입 메서드임)

"Hello" + ", Swift!"     // "Hello, Swift!"


var aa = ""
aa += "!"


/**==================================================
 - String 구조체 내부에 타입 메서드로 정의되어 있음
 
 [문자열 더하기]
 static func + (lhs: String, rhs: String) -> String
 
 [문자열 복합할당 연산자]
 static func += (lhs: inout String, rhs: String)
 ==================================================**/


//:> 연산자: 타입.함수이름(파라미터: 타입) 형태로 실행하지 않는.. 특별한 형태의 타입 메서드



//String.+(lhs: "Hello", rhs: ", Swift!")


/*:
 ---
 * 1) 연산자 메서드의 구현
 ---
 */
// 스위프트 공식 문서의 예제

struct Vector2D {
    var x = 0.0
    var y = 0.0
}


// 1) 산술 더하기 연산자의 구현 (infix 연산자)

//infix operator + : AdditionPrecedence       // 연산자 선언

extension Vector2D {
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}


let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)

let combinedVector = vector + anotherVector
//print(combinedVector)



// 2) 단항 prefix 연산자의 구현 (전치연산자)

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}


let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
//print(negative)
let alsoPositive = -negative
//print(alsoPositive)




// 3) 복합할당 연산자의 구현

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}



/*:
 ---
 * 2) 비교연산자 - 연산자 메서드(==, !=)의 직접적인 구현
 ---
 */

"swift" == "Swift"   // false
"swift" == "swift"   // true
"swift" != "swift"   // false

"swift" < "Swift"    // false
"swift" >= "Swift"   // true




/**==================================================
 - String 구조체 내부에 타입 메서드로 정의되어 있음
 
 [Equatable 동일성비교에 관한 프로토콜]
 static func == (lhs: String, rhs: String) -> Bool
 static func != (lhs: String, rhs: String) -> Bool
 
 [Comparable 크기, 순서비교에 관한 프로토콜]
 static func < (lhs: String, rhs: String) -> Bool
 static func > (lhs: String, rhs: String) -> Bool
 static func <= (lhs: String, rhs: String) -> Bool
 static func >= (lhs: String, rhs: String) -> Bool
 ==================================================**/

// Comparable 프로토콜을 채택한 타입에서는 모두 위와 같은 메서드가 구현되어 있음
// (Comparable프로토콜은 Equatable프로토콜을 상속 - 동일성 비교가 가능해야, 크기도 비교 가능)



let vector1 = Vector2D(x: 1.0, y: 2.0)
let vector2 = Vector2D(x: 2.0, y: 3.0)

vector1 == vector2


// "비교 연산자 메서드"를 구현하는 것이 왜 필요할까?
// 같은지 비교를 할 수 없음(비교할 수 있는 연산자 메서드가 구현되어 있지 않기 때문)
// ===> 컴파일러는 어떤 규칙으로 두 인스턴스를 비교해야할지 모름


//:> Equatable 프로토콜을 채택해야함
/**========================================================================
 - Equatable 프로토콜을 채택하기만 하면
   (이 경우) 컴파일러가 연산자 메서드 구현 내용 자동 추가해줌
   1) 열거형 - 연관값이 있으면서, 모든 연관값이 Equatable 프로토콜을 준수하는 경우
   2) 구조체 - '저장속성'만 가지며, 저장속성의 타입이 Equatable 프로토콜을 준수하는 경우
 
 - == (Equal to operator)를 구현하면 != (Not equal to operator) 자동구현
   (두 연산자를 모두 구현할 필요 없음)
 ==========================================================================**/


// 연산자 메서드를 구현하면 비교가 가능해짐
// Equatable 프로토콜을 채택 후, 구현

extension Vector2D: Equatable {
    
    // 직접구현
    static func ==(lhs: Vector2D, rhs: Vector2D) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
//    static func !=(lhs: Vector2D, rhs: Vector2D) -> Bool {
//        return (lhs.x != rhs.x) || (lhs.y != rhs.y)
//    }
}


vector1 == vector2
vector1 != vector2


let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)

if twoThree == anotherTwoThree {
    print("두 개의 벡터값은 동일함.")
}



//:>(참고) 열거형의 경우, 연관값이 없다면 원칙적으로 동일성 비교 가능
/**===========================================================
 *(연관값이 전혀 없는) 열거형의 경우 굳이 Equatable프로토콜을 채택하지 않아도,
  연산자(==) 메서드 자동 채택/구현
 =============================================================**/


/*:
 ## 연산의 우선순위 그룹
 * 우선순위 그룹 - 우선순위와 결합성(Precedence and Associativity)
 ---
 */
// 우선 순위 그룹의 선언

precedencegroup MyPrecedence {            // higherThan 또는 lowerThan 둘중에 하나는 반드시 지정해야함
    higherThan: AdditionPrecedence        // ~보다 높은(higherThan): 지정하려는 그룹보다 순위가 낮은 그룹
    lowerThan: MultiplicationPrecedence   // ~보다 낮은(lowerThan): 지정하려는 그룹보다 순위가 높은 그룹
    associativity: left          // 결합성 ===> left / right / none
}




// 우선순위와 결합성의 선언
// https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations


//: ---

/*:
 ## 사용자 정의 연산자
 * 스위프트가 제공하는 연산자 이외의 연산자 구현
 ---
 */
// 조금 더 깊게 연산자에 대해 이해해보기
// (연산자도 사실은 내부적으로 다 구현이 되어있는 타입 메서드임)


// 앞 강의 (연산자 메서드) 예시 =========================================

struct Vector2DD {
    var x = 0.0, y = 0.0
}


extension Vector2DD {
    static func + (left: Vector2DD, right: Vector2DD) -> Vector2DD {
        return Vector2DD(x: left.x + right.x, y: left.y + right.y)
    }
}


extension Vector2DD {
    static func += (left: inout Vector2DD, right: Vector2DD) {
        left = left + right
    }
}

// ================================================================

//:> infix(중위) 연산자의 경우, 연산자의 "우선 순위 그룹"을 지정해야함 (우선 순위, 결합성)
// 중위연산자가 아닌 경우는 지정할 필요없음


/**======================================================
 - 1) 우선순위 그룹의 선언 (우선순위, 결합성 설정)
========================================================**/

precedencegroup MyPrecedence1 {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    associativity: left                   // 결합성 ===> left / right / none
}



/**======================================================
 - 2) (전역의 범위에서) 정의하려는 연산자를 선언하고, 우선순위 그룹을 지정
 - 단항 ==> 전치(prefix), 후치(postfix) / 이항 ==> infix
   키워드를 앞에 붙여야 함
 ========================================================**/


infix operator +-: MyPrecedence1



// "우선 순위와 결합성"을 지정은 새로운 우선순위 그룹을 선언하거나, 이미 존재하는 우선 순위 그룹을 사용하는 것도 가능
// 우선순위 그룹을 지정하지 않으면 "DefaultPrecedence"라는 기본 그룹에 속하게 됨
// (삼항연산자보다 한단계 높은 우선순위가 되며, 결합성은 none설정되어 다른 연산자와 결합 사용은 불가능)



/**======================================================
 - 3) 연산자의 실제 정의
 - 해당 연산자를 구현하려는 타입에서 타입메서드로 연산자 내용을 직접 구현
 ========================================================**/

extension Vector2DD {
    static func +- (left: Vector2DD, right: Vector2DD) -> Vector2DD {
        return Vector2DD(x: left.x + right.x, y: left.y - right.y)
    }
}



// 커스텀 연산자의 사용

let firstVector = Vector2DD(x: 1.0, y: 2.0)
let secondVector = Vector2DD(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector

print(plusMinusVector)                             // Vector2D(x: 4.0, y: -2.0)




// 우선순위와 결합성의 선언
// https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations


/*:
 ---
 * 중위연산자가 아닌 경우의 예시
 ---
 */
// 1) 연산자의 선언

prefix operator +++


// 2) 연산자의 실제 정의

extension Vector2DD {
    static prefix func +++ (vector: inout Vector2DD) -> Vector2DD {
        vector += vector   // 복합할당 연산자는 이미 구현되어있기 때문에 사용 가능
        return vector
    }
}



// 커스텀 연산자의 사용

var toBeDoubled = Vector2DD(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

// toBeDoubled 의 값은 이제 (2.0, 8.0) 입니다.
// afterDoubling 도 값이 (2.0, 8.0) 입니다.





// 조금 더 쉬운 예시 =======================================

// 1) 연산자 (위치) 선언

prefix operator ++


// 2) 연산자의 실제 정의

extension Int {
    static prefix func ++(number: inout Int) {
        number += 1
    }
}


var a00 = 0
++a00   // +1
++a00   // +1
++a00   // +1
print(a00)





