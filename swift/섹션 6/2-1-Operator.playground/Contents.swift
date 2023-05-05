import UIKit

// 기본 연산자

/**=======================================================================
 연산자(operator)
 
 - 값을 검사, 바꾸거나, 또는 조합하기 위해 사용하는 특수한 ‘기호(symbol)’나 ‘구절(phrase)’임
 
 [피연산자의 갯수에 따른 연산자의 구분]
 
 - 1.단항연산자: 단일 대상의 바로 앞 또는 바로 뒤에 위치하는 연산자
 
     (예시) -a ; +b ; !a ; a... 등이 존재
 
 - 2.이항연산자: 두개의 대상의 가운데 위치하여 검사 및 계산. (대부분 이항연산자 형태로 사용)
 
     (예시) a + b ; a - b ; a >= b
 
 - 3.삼항영산자: 세개의 대상을 조합하여 특수한 계산을 함. (단 한가지의 삼항연산자가 존재)
 
     (예시) a ? b : c
 
==========================================================================**/

// 2) 기본 연산자

// 할당 연산자(Assignment Operator):오른쪽의 값을 왼쪽에 대입

// 왼쪽의 값을 오른쪽의 값으로 초기화하거나 업데이트함

let num2 = 10

var num1 = 20

// num1 = num2

// num2 = num1 -> 당연히 이 표현식은 성립하지 않는다. 상수이므로.

// 이것은 절대로 같다는 뜻이 아니다.

// 오른쪽에 있는 num2라는 상수 값 10을 num1에 넣는다는 뜻이다.

// 같다는 의미의 연산자는 ==

// 산술 연산자(Arithmetic Operator):사칙 연산을 가능하게 해주는 연산자

/**====================================
 
 [산술 (이항) 연산자]
 
 - + : 더하기 연산자      (단항 사용도 가능: +a)
 
 - - : 빼기 연산자       (단항 사용도 가능: -a)
 
 - * : 곱하기 연산자(별표)
 
 - / : 나누기 연산자(슬래시)
 
 - % : 모듈로(나머지) 연산자 ⭐️
=======================================**/


var a = 50

var b = 35

print(a + b)

print(a - b)

print(a * b)

print(a % b)


// ================================

b / a   // 몫 구하기(정수끼리)
    
b % a   // 나머지 구하기(정수끼리)




// 모듈로(%)의 사용 (Int일때만 사용) -> 주로 사용하는 패턴의 예시


// 1) 첫번째 패턴

var yourWatchingTime: Int = 100  // 100분, ====> (예) 1시간 40분


var hour = yourWatchingTime / 60

//정수 100을 정수 60으로 나눈 것이다. 핵심은 정수형(Int)라는것. 실수가 아니다.

var minute = yourWatchingTime % 60


print("당신은 \(yourWatchingTime)분. 즉, 총 \(hour) 시간 \(minute) 분을 시청 하셨습니다.")





// 2) 두번째 패턴 (감만 익히기)

var num = 100

var array = ["1", "2", "3"]        // 배열이라는 것 (뒤에서 자세히 배움)

array[0]

array[num % 3]


// 나누기 사용은 항상 주의:프로그래밍에서 나누기 사용은 항상 주의(한번 더 생각!)

a = 4

b = 5


var newResult: Double

//newResult = a / b

newResult = Double(a / b)

newResult = Double(a) / Double(b)


let a1 = 6

let b1 = 2

var result: Int

result = a1 + b1

print(result)

result = a1 - b1

print(result)

result = a1 * b1

print(result)

result = a1 / b1

print(result)

result = a1 % b1

print(result)


// 복합 할당 연산자(Compound Assignment Operator)

var value = 0


//value = value + 10
value += 10


//value = value - 5
value -= 5


//value = value * 2
value *= 2


//value = value / 2
value /= 2


//value = value % 2
value %= 2



//value++    //다른 언어에서 1을 증가시키는 방법(스위프트에서 지원하지 않음)


//스위프트에서의 올바른 방식
value += 1



// 비교 연산자(Comparison)

// 이항 연산자를 중심으로 왼쪽과 오른쪽에 표현식이 위치.

// 결과값은 항상 참 또는 거짓


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



// 논리 연산자(Logical)

// 이항 연산자를 중심으로 왼쪽과 오른쪽에 Boolean 표현식이 위치 해야함

// 결과값 또한 항상 참 또는 거짓으로 도출

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



// 연산의 우선순위:기본적으로 곱하기 우선

1 + 2 * 3 + 3
1 * (2 - 3)


/**===================================
 연산의 우선순위
 - 1. * /              곱하기/나누기
 - 2. + -              더하기/빼기
 - 3. <=  >  ==  !=    비교
 - 4. &&  ||           논리
 - 5. 삼항연산자
 - 6. = +=             할당, 복합할당
 ===================================*/



// 접근연산자: (.)점의 활용

// 1.랜덤으로 숫자 뽑기

Int.random(in: 1...3)

var number = Int.random(in: 1...5)

// 2.글자수 세기

var name = "스티브"


print(name.count)
