import UIKit


/*: # 기본연산자(Basic Operators)
 
 ## 1) 연산자 기초
 - 연산자 기초: 연산자란? 연산자의 종류
 ---
 */

/**=======================================================================
 
 연산자(operator)
 
 - 값을 검사, 바꾸거나, 또는 조합하기 위해 사용하는 특수한 ‘기호(symbol)’나 ‘구절(phrase)’임
 
 [피연산자의 갯수에 따른 연산자의 구분]
 
 - 1.단항연산자: 단일 대상의 바로 앞 또는 바로 뒤에 위치하는 연산자
 
     (예시) -a ; +b ; !a ; a... 등이 존재
 
 - 2.이항연산자: 두개의 대상의 가운데 위치하여 검사 및 계산. (대부분 이항연산자 형태로 사용)
 
     (예시) a + b ; a - b ; a >= b
 
 - 3.삼항연산자: 세개의 대상을 조합하여 특수한 계산을 함. (단 한가지의 삼항연산자가 존재)
 
     (예시) a ? b : c
 
==========================================================================**/


/*: ## 2) 기본연산자
 - 할당 연산자(Assignment Operator)
 ---
 */
// 할당연산자: 오른쪽의 값을 왼쪽에 대입

// (왼쪽의 값을 오른쪽의 값으로 초기화 하거나 업데이트 함)

var num1 = 100

var num2 = 1000


num1 = num2


/*:
 ---
 - 산술 연산자(Arithmetic Operator): 사칙 연산 등 기본적으로 스위프트에 내장되어 있는 기능
---
 */
/**====================================
 
 [산술 (이항) 연산자]
 
 - + : 더하기 연산자      (단항 사용도 가능: +a)
 
 - - : 빼기 연산자       (단항 사용도 가능: -a)
 
 - * : 곱하기 연산자(별표)
 
 - / : 나누기 연산자(슬래시)
 
 - % : 모듈로(나머지) 연산자 ⭐️
 
=======================================**/

var a = 456

var b = 123



a + b

a - b

a * b

// ================================

b / a   // 몫 구하기(정수끼리)
    
b % a   // 나머지 구하기(정수끼리)




//:> 모듈로(%)연산자:  비전공자에게 익숙하지 않지만, 정말 많이 사용하는 개념 ⭐️


/*:---
 - 모듈로(%)의 사용 (🔸 Int 일때만 사용) ➞ 주로 사용하는 패턴의 예시
 ---
 */
var yourWatchingTime: Int = 130

var hour = yourWatchingTime / 60

var minute = yourWatchingTime % 60

print("당신은 \(yourWatchingTime)분. 즉, 총 \(hour) 시간 \(minute) 분을 시청 하셨습니다.")

for i in 1...100 {
    
    if i % 7 != 0 {
        
        continue
    }
    
    print("7의 배수: \(i)")
    
}


enum RpsGame: Int {
    
    case rock
    
    case paper
    
    case scissors
}

let number = Int.random(in: 1...100) % 3

var myRpsGame: RpsGame = RpsGame(rawValue: number)!


var num = 100

var array = ["1", "2", "3"]

array[0]

array[num % 3]

/*: ---
 - 나누기 사용은 항상 주의
 ---
 */

//:> 프로그래밍에서 나누기 사용은 항상 주의
a = 4

b = 5

var newResult: Double

// newResult = a / b

newResult = Double(a / b)

newResult = Double(a) / Double(b)


/*:---
 * 복합 할당 연산자(Compound Assignment Operators)
 ---
 */
var value = 0


// value = value + 10

value += 10


// value = value - 5

value -= 5


// value = value * 2

value *= 2


// value = value / 2

value /= 2


// value = value % 2

value %= 2

/*:---
 * 비교연산자(Comparison Operators): 결과적으로 문장의 평가값은 참/거짓으로 도출
 ---
 */

a = 456

b = 123

// 같다(Equal to operator)

a == b

// 같지 않다(Not equal to operator)

a != b

// 크다(Greater than operator)

a > b

// 크거나 같다(Greater than or equal to operator)

a >= b

// 작다(Less than operator)

a < b

// 작거나 같다(Less than or equal to operator)

a <= b




var c = (b == 123)



// if문 하고 결합되어서 주로 사용



/*:---
 * 논리 연산자(Logical Operators)
 ---
 */
// ⭐️ Logical NOT Operator

!true

!false


// Logical AND Operator(앤드, 그리고)

true && true

true && false

false && true

false && false


// Logical OR Operator(또는)

true || true

true || false

false || true

false || false




// 아이디도 6자리 이상이고, 비밀번호도 6자리 이상이다.


// 하다보면 자연스럽게 이해하게 됨 ===> 스트레스 받지 마세요.



// ! 상당히 많이 사용함 (앱을 만들때 직접 많이 써보면서 익숙해 질 것임)

c = !true




/*: ## 3) 접근연산자
 - 접근연산자 - (.)점
 ---
 */
// 접근 연산자라고 불리는, .(점)은 어떤 의미일까?

Int.random(in: 1...3)

var number1 = Int.random(in: 1...5)

var name = "스티브"

print(name.count)



/*: ## 4) 삼항 연산자(Ternary Conditional Operator)
 - 기본 형태 / if문보다 조금은 한정적인 형태로 사용 가능
 ---
 */
// if / else문


var score = 70


if score >= 70 {
    
    print("Pass")
    
} else {
    
    print("Fail")
}

// 3항 연산자 (위의 if/else문과 완벽하게 동일)

score >= 70 ? print("Pass") : print("Fail")

// 한줄인 경우

// 주로 값을 대입하는 경우 (주로 값에서 2가지에서 한가지를 선택하는 경우)

//:> 조건에 따라 선택이 두가지인 경우 -> 삼항연산자를 떠올리자
let profileName: String = "차비시몬스"


profileName.count >= 5 ? print("1") : print("2")




/*: ## 5) 범위 연산자(Range Operators)
 - 범위연산자: 스위프트에서 숫자의 범위를 간편하게 표시할때 사용
 ---
 */
/**===================================================
 
- 아래의 숫자와 위의 숫자까지의 범위를 포함

- 자체가 특별한 타입으로 정의되어있고, 의미하긴 하지만
 
- 일반적으로 위와 같이 타입을 정의해서 사용하는 경우는 드물고,
 
- 1) 반복문(for문)    2) 배열    3) switch문
 
- 에서만 주로 활용하므로 위의 경우에 활용 방식을 이해하는 것이 더 중요

<주의점>
 
- 내림차순 형식으로 표기 불가능  12...0
 
- 실수형식의 범위 표기도 가능하지만 사용하는 경우는 드뭄
 
=====================================================**/


let numbers = 1...10


/*:
 ---
 - 1) Closed Range Operator(닫힌 범위연산자), One-Sided Ranges의 표기
 ---
 */
let range = 1 ... 10     // ClosedRange<Int>

let range1 = 1...      // PartialRangeFrom<Int>

let range2 =  ...10    // PartialRangeThrough<Int>


// One-Sided 표기시에는 숫자와 범위연산자를 붙여서 써야함

/*:
 ---
 - 2) Half-Open Range Operator(반 개방 범위연산자), One-Sided Ranges의 표기
 ---
 */
let rangeH = 1 ..< 10     // Range<Int>

let rangeH1 =  ..<10    // PartialRangeUpTo<Int>


// One-Sided 표기시에는 숫자와 범위연산자를 붙여서 써야함



/*: ## 6) 범위 연산자의 활용
 - 1) for문과 함께 사용
 ---
 */
for index in 1...5 {
    
    print("\(index) * 5: (index * 5)")
    
}

let namesArray = ["라민 야말", "다니 올모", "차비 시몬스", "가비"]


let playersCount = namesArray.count



for i in 0..<playersCount {
    
    print("Plyaer \(i + 1) is called \(namesArray[i])")
    
}

/*:---
 - 2) 배열의 서브스크립트 문법과 함께 사용
 ---
 */


namesArray[...2]

namesArray[..<1]


/*:---
 - 3) 스위치문의 케이스에서 사용
 ---
 */

var myage: Int = Int.random(in: 10...49)


switch myage {
case 10...19:
    print("10대입니다.")
case 20...29:
    print("20대입니다.")
case 30...39:
    print("30대입니다.")
case 40...49:
    print("40대입니다.")
default:
    break
}


var point = (1,3)


switch point {
case (0,0):
    print("(0,0은 원점 위에 있다.")
case (-2...2, -2...2):
    print("\(point.0), \(point.1)은 원점의 주위에 있다.")
default:
    print("점은 (\(point.0), \(point.1))에 위치한다.")
}


/*: ## 7) 패턴매칭 연산자(~=)
 - 패턴매칭 연산자: 숫자가 범위내에 있는지 확인하는 연산자
 ---
 */

let myRange = 1...100

myRange ~= 30

// 결과 값은 참과 거짓


/*:---
 - 10 <= n <= 100 이런 문장은 스위프트에서 성립하지 않는다.
 ---
 */
var n = 20


if n >= 10 && n <= 100 {
    
    print("10이상, 100이하입니다.")
    
}


if 10...100 ~= n {
    
    print("10이상, 100이하입니다.")
    
}

var yourAge = 33

if 20...29 ~= yourAge {
    print("20대 입니다.")
} else if 30...39 ~= yourAge {
    print("30대 입니다.")
}


// 스위치문은 내부적으로 패턴매칭 연산자로 구현이 되어있음

switch yourAge {
    
case 20...29:
    
    print("20대 입니다.")
    
case 30...39:
    
    print("30대 입니다.")
    
default :
    
    break
}
