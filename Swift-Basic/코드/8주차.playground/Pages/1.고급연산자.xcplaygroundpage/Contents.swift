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
    print(#function)
    num += 1
    return true
}



// if문의 조건식에서 함수를 호출하는 경우

if checking() || checking() {    // &&으로 바꿔보기
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
