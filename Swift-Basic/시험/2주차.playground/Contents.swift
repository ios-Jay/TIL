import UIKit

/**==================================================================
 
 [1번 문제]
 
  - 하나의 앱이 실행되면, 메모리는 어떤 4가지 영역으로 나누어 지나요? 4가지 영역의 이름을 쓰세요.
 
 ===================================================================**/

// 코드: 앱 실행시 순차적으로 코드를 실행시킴

// 데이터: 전역 변수등의 데이터들이 저장됨

// 힙: 동적할당(일반적으로 오랫동안 긴시간 동안 저장)

// 스택: 함수의 실행에서 사용됨. 임시적 공간

/**==================================================================
 
 [2번 문제]
 
  - 프로그래밍에서, 표현식(Expression)이 어떤 의미인가요? 아는대로 작성하세요.
 
 ===================================================================**/

// 키워드: 프로그래밍 언어에서의 약속어

// var, if, func...

// 리터럴: 데이터 값 그 자체

// "Hello": 문자열 리터럴, 3.14: Double형 리터럴

// 식별자: 변수와 상수, 함수, 사용자 정의 타입의 이름

// 표현식(Expression): 값, 변수, 연산자의 조합으로 하나의 결과값으로 평가되는 코드 단위

// (예시) num + 5

/**==================================================================
 
 [3번 문제]
 
  -  반복문을 사용해서, 1부터 10까지 값을 더한 결과값을 출력하는 코드를 작성해 보세요.
 
    (힌트: 변수를 하나 만들고, 해당 변수를 이용 어떤 반복문을 어떻게 사용할지 고민해 보세요.)
 
 
 ===================================================================**/


var num = 10

var sum = 0


for i in 1...num {
    
    sum += i
    
    // print(sum)
    
    
}


print(sum)

/**==================================================================
 
 [4번 문제]
 
  -  튜플이 뭔가요? 간단한 개념을 1-2줄로 서술 하고, 간단한 코드 예시를 하나 만들어 보세요.
 
 ===================================================================**/

// 두개 이상의 데이터 타입을 저장할 수 있는 복합 혼합 타입: 순서쌍

// "연관된 데이터"를 하나로 묶어서 간단하게 사용하는 타입

// (여러개의 데이터를 가볍게 묶어서, 데이터로 활용가능)

var id: (String, Int) = (name: "김재혁", age: 33)

var tuple = ("홍길동", 20, "서울")

var coordinate = (5, 10)

/**==================================================================
 
 [5번 문제]
 
  -  구구단을 2단부터, 9단까지 출력하는 코드를 반복문을 사용해서 만들어 보세요.
 
    (힌트: 어떤게 반복이 되어야 할까요? 구구단에서 반복이 되는 부분이 어디죠?)
 
 ===================================================================**/


for i in 2...9 {
    
    for j in 2...9 {
        
        print("\(i) * \(j) = \(i * j)")
        
    }
}

/**==================================================================
 
 
 [6번 문제]
 
  - 함수만들어 보기: 여러개의 정해지지 않은 갯수의 정수를 받아서, 평균을 구하는 함수를 작성해 보세요.
 
    (힌트: 함수의 이름은 누가봐도 알아볼 수 있게, 평균..이란 말이 들어가면 좋겠네요!)
 
 
 ===================================================================**/


func arithMeticFunction(_ number: Double...) -> Double {
    
    var sum = 0.0
    
    for i in number {
        
        sum += i
        
    
        
    }
    
    return Double(sum) / Double(number.count)

    
    
}


print(arithMeticFunction(1,3,5,7,9,11,13,15))

/*

func makeAverage(nums: Int...) -> Double {
    var sum = 0
    
    for i in nums {
        sum += i
    }
    
    return Double(sum) / Double(nums.count)
}

makeAverage(nums: 4, 2, 7)

*/

// 주의점

// 1) 가변 파라미터 주의

// (파라미터의 갯수가 정해지지 않은 경우의 input을 정의하는 법)

// 2) 실수형으로 리턴

// 정수라도 평균으로 결과값이 나온다 하면,

// 보통 실수의 형태로 나올 가능성이 크므로.. 실수형으로 리턴하는 부분 주의 ⭐️ (정수형으로 리턴하면 안됨)

/**==================================================================
 
 [7번 문제]
 
 - 함수만들어 보기: 2개의 정수를 입력 받아, 그 숫자들을 더한 결과값을 문자열로 반환하는
 
   함수를 작성해 보세요.
 
   (힌트: 문자열로 반환하려면, 함수 안에서 변환의 과정이 한번 필요하겠네요.)
 
 ===================================================================**/


func stringFunction(a: Int, b: Int) -> String {
    
    var c = a + b
    
    
    return String(c)
    
    // return String(a + b)
    
    
}

print(stringFunction(a: 10, b: 5))


/*
 
 func add(a: Int, b: Int) -> String {
     
     return String(a + b)
 }


 print(add(a: 3, b: 4))
 
 
 */


/**==================================================================
 
 [8번 문제]
 
  - 함수의 파라미터에서 사용하는 inout키워드에 대해서, 간단하게 설명해 보세요.
 
 ===================================================================**/

// inout 파라미터: 함수의 파라미터(값타입)을 메모리 주소로 전달할 수 있는 방법

// 함수의 파라미터에서 inout 키워드를 사용하면,

// 파라미터로 사용하는 변수의 직접적인 메모리 주소를 전달함

// 그래서 보통 두 숫자를 직접적으로 바꿀 수 있는 swap과 같은 함수를 구현할 수 있게 됨

// (두 숫자를 바꾸기 위해서는 함수 내부에서 상수로 사용하면 안되고, 직접 변수의 주소 전달이 필요)


var num1 = 123

var num2 = 456


func swapFunction(a: inout Int, b: inout Int) {
    
    var temp = a
    
    a = b
    
    b = temp
 
    
    
}


swapFunction(a: &num1, b: &num2)

/**==================================================================
 [9번 문제]
  -  다음의 제어전송문 4가지를 각각 쓰이는 경우와 어떻게 사용되는지 간단하게 설명하세요.
 
    (break / fallthrough / continue / return)
 
    (힌트1: break는 2가지 경우에 쓰입니다.)
 
    (힌트2: return은 리턴타입이 있는 함수/리턴타입이 없는 함수 구분해서, 설명해 주세요.)
 
 ===================================================================**/

// 1.break문

// 반복문(for/while)에서 break - (가장 가까운) 반복문을 완전히 종료

// switch문에서 break - case에서 어떤 문장의 실행도 없을 때 입력하는 약속

// 1) 코드의 실행을 중지하고자 할 때 사용

// 3을 만나자 if문의 실행이 중지되고 1과 2가 출력되는 것을 알 수 있다.

for i in 1...10 {
    
    if i == 3 {
        
        break
    }
    
    print(i)
    
}

// 2) break: switch문에서 실행하고자 하는 문장이 없을때 반드시 입력



var num3 = Int.random(in: 1...30)


switch num3 {
    
case 1...10:
    
    print("1과 10 사이의 정수")
    
case 11...20:
    
    break
    
    // 에러 발생: 'case' label in a 'switch' must have at least one executable statement
case 21...30:
    
    print("21과 30사이의 정수")
    
    
default:
    
    break
    
}

// 2.fallthrough문

// switch문에서 어떤 해당 case를 해당한 후, 다음 case의 해당 여부를

// 따지지 않고, 다음 case 내부의 문장을 실행

// fallthrogh: 실행 하는 문장의 결과와 상관없이 다음 문장도 반드시 실행하고자 할 떄 사용


var num4 = 7


switch num4 {
    
case 3:
    break
    
case 7:
    print(1)
    
    fallthrough
    
case 8:
    
    print(2)
    
    
default:
    
    break
    
    
}

// 3.continue문

// 반복문에서 (가장 가까운) 반복의 이번 주기를 끝내고 다음 주기로 바로 넘어가서,

// 다음 주기를 실행

// continue: 문장에서 코드의 결과값에 따라 다음문장으로 넘어가게 함

for i in 1...100 {
    
    if i % 2 != 0 {
        
        print(i)
        
        
        
        // 즉 짝수를 만나면 문장을 컨티뉴(건너뜀)
        
        // 따라서 홀수를 출력하게됨
                
    }
    
    continue
    
}

// 4.return문

// 1) return 타입이 없는 경우 - 해당 함수를 종료하고 벗어남

// 2) return 타입이 있는 경우 - return 문 뒤의 표현식을 평가한 후, 그 값을 반환하면서 함수를 종료하고 벗어남

/**==================================================================
 
 [10번 문제]
 
  - nil이 뭘까요? 아는대로 설명해 보세요!
 
 ===================================================================**/

// 값이 없음을 나타내는 키워드. 실제로 값이 없다는 뜻이 아닌 '나타내는' 키워드(약속어)

var numbering: Double

// numbering = 32

// 값을 저장하지 않으면(초기화하지 않으면)

// print(numbering) -> 메모리 공간에 값이 없는 상태로 접근하므로 에러 발생


var numbering1: Double?

// 옵셔널 타입인 ?(간편표기)를 붙여줌으로서

// print(numbering1)

// 접근해도 에러가 나지 않음. nil로 출력됨


// 정답:

// 스위프트의 옵셔널 타입(열거형으로 만들어진 임시타입) 중에서

// 값이 없음을 나타내는 케이스(case)이자, 값이 없음을 나타내는 표현

// 일반적으로 메모리에 실제 값이 없으면 앱이 꺼지는 에러가 발생하기 때문에(null point exception)

// 스위프트에서 이런 에러를 방지 하기 위해, 임시적인 타입을 "열거형"으로 만들어서

// 변수를 옵셔널 타입으로 선언했을때, 값을 할당해주지 않으면

// (임시타입 중에 일단 값이 없음을 의미하는) nil을 할당 시킴 (초기화 시킴)

// 변수에 "임시타입"이 무조건 들어 있기 때문에 ==> 에러 방지 가능

// 이 임시타입은 1) 값이 있는 경우 .some과 2) 값이 없는 경우 .none

// 로 이루어진 열거형이기 때문에 실제 값을 사용하려면, 이 겉의 임시타입을 벗겨내고(언래핑) 사용해야함

// 메모리에 실제 값이 없음으로 발생할 수 있는 (앱이 꺼지는) 에러를 방지할 수 있도록

// "임시타입"으로 한번 걸러주는 역할을 하며, 만약에 nil인 경우..

// 언래핑(겉의 임시타입을 벗겨내서)해서 실제 값이 없으면 에러 발생(앱이 꺼짐)하게됨

/**==================================================================
 
 [11번 문제]
 
  - Optional 타입에는 .none이 있는데, 이것과 nil의 공통점 또는 차이점은?
 
 ===================================================================**/

// 결론: .none은 명시적인 열거형으로 표현한 것이고, 일반적으로는 값이 없다는 의미의 nil키워드를 사용할뿐

// nil은 Optional.none의 리터럴 값의 형태 (그냥 완전히 같다고 생각해도 무방하긴 함) ⭐️

// 다만, nil은 구체화된 형태는 아님

// Optional<String>.none, Optional<Int>.none, Optional<Double>.none 등

// 예시: 옵셔널 타입이라는 것은 이러한 열거형으로 구현 되어 있음

enum Optional {
    
    case some(Int)  // 연관값
    
    case none
}

// [공통점]

// .none과 nil은 동일하게 임시타입으로써 내부에 값이 없음을 표현 (완전 동일)

// [차이점]

// .none은 실제 내부의 원시 형태이면서, 구체화된 형태 (nil은 포괄적인 표현)



/**==================================================================
 [12번 문제]
 
  - Optional을 언래핑(Unrapping) 하는 4가지 방법은? 간단하게 서술로 쓰시면 됩니다.
 
 ===================================================================**/

// 1번 방법

// 강제 언래핑 (!)

// 강제 추출 연산자(!) 사용

var number9: Int?

number9 = 9

print(number9!)


// 2번 방법

// if문으로 nil이 아님을 확인 한후, if문 안에서 강제 언래핑

// if문 사용

if number9 != nil {
    
    print(number9!)
    
}


// 3번 방법

// 옵셔널 바인딩(if let 바인딩)

// if let 바인딩 사용

if let n9 = number9 {
    
    print(n9)
    
}


// 4번 방법

// 옵셔널표현식 ?? 디폴트값의 제시


// 닐 코얼레싱 방법 사용


var myName: String? = "김재혁"

var myName1 = myName ?? "제이"


/**==================================================================
 
 [13번 문제]
 
  - 열거형(Enum)은 어떤 경우에 사용하는 타입인가요? 아는대로 간단하게 서술해 보세요.
 
 ===================================================================**/


// 한정된 갯수의 사례(case)로 타입을 만들 수 있을때,

// 개발자가 직접만들어서 쓸 수 있는 Custom 타입

// 월 - 화 - 수 - 목 - 금 - 토 - 일

enum Weekday {
    
    case monday
    
    case tuesday
    
    case wendsday
    
    case thursday
    
    case friday
    
    case saturday
    
    case sunday
    
}

var today: Weekday = .monday

var tomorrow: Weekday = .tuesday

/**==================================================================
 [14번 문제]
 구글(google), 페이스북(facebook), 네이버(naver) 로그인을 위해 SiteLogin라는 이름을 가진
 아래의 Enum 타입을 완성해 보세요.
 
 각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
 
 (만들고자 하는 타입 예시)
 enum SiteLogin { }
 
 (변수에 담았을때의 모습)
 var login1 = SiteLogin.google("google@gmail.com", "0000")
 
  (힌트: 연관값이라는 개념을 어떻게 사용해야 하죠?)
 ===================================================================**/


// 아래의 enum타입 완성

enum SiteLogin {
    
    case google(String, String)
    
    case facebook(String, String)
    
    case naver(String, String)
}

var login1 = SiteLogin.google("google@gmail.com", "0000")

// 또는 아래의 형태의 구현도 좋음

enum SiteLogin2 {
    
    case google(id: String, password: String)
    
    case facebook(id: String, password: String)
    
    case naver(id: String, password: String)
    
}
