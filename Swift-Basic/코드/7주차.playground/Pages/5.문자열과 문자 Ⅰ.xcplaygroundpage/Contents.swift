import UIKit

/*: # 문자열과 문자
 ---
 */

/*: ## 문자열과 문자(Strings and Characters)
 - 아스키코드와 유니코드
 ---
 */
/**================================================================================
 - 아스키코드(ASCII) / 유니코드(UNICODE)

  [아스키코드]
 - 참고: https://www.youtube.com/watch?v=apZFcOfAr5w

  [유니코드]
 - 참고: https://youtu.be/5aJKKgSEUnY
 - 참고: https://youtu.be/MijmeoH9LT4


 - 유니코드(Unicode)는 전 세계의 모든 문자를 컴퓨터에서 일관되게 표현하고 다룰 수 있도록 설계된 산업 표준
 - 스위프트는 유니코드의 체계를 사용
===================================================================================**/


/*: ---
 - 유니코드와 문자열의 저장
 ---
 */
/**===========================================================================
 - 스위프트의 문자열(String)?
 - 쌍따옴표 안에 문자(Character)들을 연결

 - 모든 문자열은 개별 인코딩된 유니코드 문자들(encoding-independent Unicode characters)로 구성
 - 유니코드 값(코드포인트 - 스칼라값)
 
 - 결국, 스위프트는 문자열을 저장할때, 하나의 문자를 유니코드의 스칼라값(UTF-32)으로 저장
   그리고 언제든지 UTF-8, UTF-16방식으로도 쉽게 변환할 수 있는 방법도 제공해줌
   1) 문자열.unicodeScalars
   2) 문자열.utf8
   3) 문자열.utf16
==============================================================================**/

var someString: String = "Some Swift😃"


// 문자열은 결국, 각 문자를 모아놓은 데이터 바구니

for code in someString.unicodeScalars {
    print(code.value)
}

/**=====================================
 - 문자열    UTF-32값         (16진법 표현)
 - "S"     -   83   ====>    53 (16진법)
 - "o"     -  111   ====>    6F (16진법)
 - "m"     -  109   ====>    6D (16진법)
 - "e"     -  101   ====>    65 (16진법)
 - " "     -   32   ====>    20 (16진법)
 - "S"     -   83   ====>    53 (16진법)
 - "w"     -  119   ====>    77 (16진법)
 - "i"     -  105   ====>    69 (16진법)
 - "f"     -  102   ====>    66 (16진법)
 - "t"     -  116   ====>    74 (16진법)
 - "😃"    -128515  ====> 1F603 (16진법)
========================================**/

"\u{53}"    // 대문자 S:유니 코드의 값

// 유니코드의 예시: 당연히 실제로는 사용 X

someString = "\u{53}\u{6F}\u{6D}\u{65}\u{20}\u{53}\u{77}\u{69}\u{66}\u{74}\u{1F603}"

print(someString)

/*: ---
 - Swift공식문서로 살펴보는 유니코드 예시
 ---
 */

/**=================================================================
 - 스위프트는 내부적으로 문자열을 UTF-32방식으로 저장하고 있지만
   나머지, UTF-8, UTF-16방식으로도 쉽게 변환할 수 있는 방법도 제공해줌
  (코드값을 사용하려면 물론, for문을 통해서 내부에서 요소를 다시 추출해서 사용해야함)
 ===================================================================**/


let dogString = "Dog‼🐶"
print(dogString.utf8)


for codeUnit in dogString.utf8 {             //  8비트의 숫자값
    print("\(codeUnit) ", terminator: "")
}
print("")

// 68  / 111  / 103 / 226 128 188 / 240 159 144 182


for codeUnit in dogString.utf16 {            // 16비트의 숫자값
    print("\(codeUnit) ", terminator: "")
}
print("")

// 68 / 111 / 103 / 8252 / 55357 56374


for scalar in dogString.unicodeScalars {      // 32비트의 숫자값
    print("\(scalar.value) ", terminator: "")
}
print("")

// 68 / 111 / 103 / 8252 / 128054

//:> 스위프트는 결국, 어떠한 유니코드 인코딩 방식으로도 변환이 쉬움

/*: ---
 - 유니코드로 인한 스위프트 문자열의 특징과 주의점
 ---
 */

var hangul1 = "\u{D55C}"     // "한"

print("\"한\"의 글자수: ", hangul1.count)


var hangul2 = "\u{1112}\u{1161}\u{11AB}"      // "ㅎ" "ㅏ" "ㄴ"
print("\"ㅎ\"+\"ㅏ\"+\"ㄴ\"의 글자수: ", hangul2.count)

// 유니코드의 체계에서느는 코드가 다른 방식으로 저장이 되더라도 인간의 실생활과 가깝게 그 코드를 변환을 해서 인식한다.

hangul1 == hangul2      // 같은 글자로 인식


// 한글과 같은 언어들을 "ㅎ" "ㅏ" "ㄴ" 내부적으로 하나의 글자로 취급 ⭐️



var word = "cafe"
print("글자의 숫자 \(word) is \(word.count)")
// "글자의 숫자 cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301: 301이라는 유니코드를 더한 값

// 그럼에도 불구하고 유니코드의 코드가 하나 더 더해져 있음에도 글자 수를 셀 때는 합쳐서 본다.

print("글자의 숫자 \(word) is \(word.count)")
// "글자의 숫자 café is 4"(강세 사용):강세를 붙인 것도 하나의 글자로 인식한다.

// 결국 문자열도 배열과 유사

"Some Swift😃"

let array = [1, 2, 3]

array[0]
array[1]
array[2]

// 그러나 스위프트는 위의 배열처럼 단순 인덱스 사용은 불가함.

// 언어에 따라서(파이썬 같은) 단순 인덱스로서의 접근이 가능한 경우도 있으나, 스위프트에서는 단순 인덱스로의 접근은 불가능함.

// "Some Swift😃"[0]: 단순 인덱스 사용 불가

//:> 스위프트의 문자열에서는 배열같은 단순 인덱스(index) 접근이 불가능 ⭐️

// 스위프트는 문자열을 글자의 의미단위로 사용하기 때문에, 정수 인덱스 사용이 불가능

//  0, 1, 2, 3, 4 ....   (X)



/*: ---
 - 스위프트의 문자열 String / NSString
 ---
 */

/**===============================================================
 - 스위프트에서는 2개의 문자열 자료형을 사용

 - 문자열 내부적으로 서로 연동(bridged)
 - 1) String ▶︎ Swift String  구조체/값형식 (스위프트 문자열)
 - 2) NSString ▶︎ Foundation String  클래스/참조형식  (파운데이션 문자열)
==================================================================**/


var nsString: NSString = "Swift"   // 문제없이 저장


//let string: String = nsString   //에러발생

let string: String = nsString as String


// String <===> NSString간에 자동으로 변환컨버팅되지는 않음(타입캐스팅해야함)


nsString.length       // NSString의 length속성 ===> 유니코드수(UTF-16) 기반
string.count          // String의    count속성 ===> 의미 글자수 기반



nsString = string as NSString    // 두형식은 브릿징이 가능한 타입 (Toll-Free Bidged) ===> 타입캐스팅으로 호환되는 자료형



// 두 자료형은 서로 호환되는 자료형이지만, 유니코드를 처리하는 방식이 달라서, 조심해서 사용해야함 ⭐️


// word = café 라는 단어가 저장되어 있음

let nsWord = word as NSString

word.count
nsWord.length


// NSString은 Objected-C에서 사용하는 문자열이고
// NSString에서 더 파생된 개념인 NSAttributedString을 실제 앱을 만들때, 간혹가다 사용하는 경우가 있음
// 문자열에 클릭기능을 넣는다던지. 글자별로 색깔을 다르게 한다던지


//: ***


/*: ## 문자열의 기본 다루기
 - 멀티라인 스트링 리터럴(Multiline String Literals)
 ---
 */

//:> 문자열을 한줄에 입력 ➞ 명시적인 줄바꿈이 불가능


let singleLineString = "These are \nthe same."       // 줄바꿈을 원하면, \n 입력   \ (Escape character)

// 문자열 내부에서는 아무렇게나 쌍따옴표를 사용할 수 없음:\"를 사용해야함

print("\"These are \nthe same.\"")

print(singleLineString)




/**===========================================================
 - 문자열을 여러줄 입력하고 싶을때
 - 1) """ (쌍따옴표 3개를 연속으로 붙여서 입력) - 첫째줄/마지막줄에 입력
 - 2) 해당줄에는 문자열 입력 불가
 - 3) 문자열 내부에서 쓰여진대로 줄바꿈됨. ===> (줄바꿈 하지 않으려면 \(백슬레시) 입력)
 - 4) 특수문자는 문자 그대로 입력됨
 - 5) 마지막(""")는 들여쓰기의 기준의 역할
=============================================================**/

// \n을 사용하지 않더라도 """에서는 자동으로 줄바꿈이 됨
// \를 사용하면 줄바꿈을 없앨 수도 있음
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

/*: ---
 - 문자열 내에서 특수문자(Escape sequences)
 ---
 */

/**==============================
 [Escape character sequences]
 - \0  (null문자)
 - \\  (백슬레시)
 - \t  (탭)
 - \n  (줄바꿈 - 개행문자)
 - \r  (캐리지 리턴 - 앞줄이동)
 - \"  (쌍따옴표)
 - \'  (작은따옴표)
 - \u{유니코드값}   (1~8자리의 16진수)
=================================**/

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)



/*: ---
 - 로스트링(Raw String) - 확장 구분자(Extended String Delimiters)  #
 ---
 */

// 문자열내에서 특수문자를 많이 써야하는 상황이라면,

// 글자 날것 그대로 표현하는 것이 코드에서 덜 헷갈릴 수 있음

//:> 샵 기호(#)으로 문자열 앞뒤를 감싸면 내부의 문자열을 글자 그대로 인식

// 샵의 갯수를 개발자 임의로 조절 가능

// 당연히 샾의 밸런스(갯수)를 맞춰 줘야 함


var name = #"Steve"#
print(name)

let string1 = #"Line 1\nLine 2"#       // 특수문자가 그대로 인식됨
print(string1)

let string2 = #"Line 1\#nLine 2"#
print(string2)

let string3 = ###"Line 1\###nLine 2"###
print(string3)


let string4 = #"My name is \#(name)"#         // 이스케이프 시퀀스 효과를 사용하려면, 샵을 입력



let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

print(threeMoreDoubleQuotationMarks)

//: ***

/*: ## 문자열 보간법(String Interpolation)
 - 문자열 보간법의 동작원리
 ---
 */
/**=======================================
[String Interpolation(스트링 인터폴레이션)]
 - 문자열 내에서  "\(표현식 등)"
 - 상수, 변수, 리터럴값, 그리고 표현식의 값을 표현가능
==========================================**/


let name1 = "유나"
//print("브레이브걸스: \(name1)")


let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//print(message)

//:> 문자열 내에서 "\( )"의 동작 원리는 뭘까?

// 그렇다면, 클래스나 구조체는?

struct Dog {
    var name: String
    var weight: Double
}

let dog = Dog(name: "초코", weight: 15.0)
print("\(dog)")      // Dog(name: "초코", weight: 15.0)  출력 형태를 애플이 지정해 놓음
print(dog)

// dump: 더 자세하게 출력
dump("\(dog)")
dump(dog)

/*: ---
 - 문자열 보간법 사용시, 출력 형태(방법)을 직접 구현도 가능
 ---
 */

/**=====================================================
[애플이 미리 만들어 놓은 프로토콜]
 - 아래의 프로토콜을 채택해서 구현하면 스트링 인터폴레이션을 직접구현 가능
 
   protocol CustomStringConvertible {
      var description { get }
   }
========================================================**/

//extension Dog: CustomStringConvertible {
//    var description: String {
//        return "강아지의 이름은 \(name)이고, 몸무게는 \(weight)kg 입니다."
//    }
//}



// 강아지의 이름은 초코이고, 몸무게는 15.0입니다.

/**=====================================
- \( ) ====> description 변수를 읽는 것
========================================**/

/*: ---
 - Swift5 에서의 문자열 보간법의 동작원리
 ---
 */

struct Point {
    let x: Int
    let y: Int
}


let pp = Point(x: 5, y: 7)
print("\(pp)")


//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ value: Point) {
//        appendInterpolation("X좌표는 \(value.x), Y좌표는 \(value.y)입니다.")
//    }
//    
//    mutating func appendInterpolation(_ value: Dog) {
//        appendInterpolation("강아지의 이름은 \(value.name), 몸무게는 \(value.weight)키로 입니다.")
//    }
//    
    
    
// }



print("\(pp)")


// X좌표는 5, Y좌표는 7입니다.


/**=====================================
- \( ) ====> appendInterpolation()을 실행
========================================**/

//:> 메서드로 바뀌면서 활용도가 높아짐 (다른 파라미터 지정도 가능)

//extension String.StringInterpolation {
//
//    mutating func appendInterpolation(_ value: Point, style: NumberFormatter.Style) {
//        
//        // "숫자" <====> "문자" 변환을 다루는 객체
//        let formatter = NumberFormatter()
//        formatter.numberStyle = style
//
//        // 지정된 스타일로 문자열을 구성
//        if let x = formatter.string(for: value.x), let y = formatter.string(for: value.y) {
//            appendInterpolation("X좌표는 \(x) x Y좌표는 \(y)")
//        }else  {
//            appendInterpolation("X좌표는\(value.x) x Y좌표는\(value.y)")
//        }
//    }
//    
//
//}

// 파라미터를 사용할 수도 있다는 것을 알려주는 예제

//print("\(p)")
//
//print("\(p, style: .spellOut)")     // X좌표는 five x Y좌표는 seven
//
//print("\(p, style: .percent)")      // X좌표는 500% x Y좌표는 700%
//
//print("\(p, style: .scientific)")   // X좌표는 5E0 x Y좌표는 7E0
//
////print("\(p, style: .currency)")   //$
//

/**=============================================
- \( , style: ) ====> appendInterpolation(_:,style:)을 실행
================================================**/


/**===================================
(참고용) NumberFormatter.Style 열거형으로 정의

  enum Style : UInt {
      case none = 0
      case decimal = 1
      case currency = 2
      case percent = 3
      case scientific = 4
      case spellOut = 5
      case ordinal = 6
      case currencyISOCode = 8
      case currencyPlural = 9
      case currencyAccounting = 10
  }
=====================================**/

//: ***

/*: ## 숫자(정수/실수) 등을 문자열로 변환 출력하려고 할때
 - 변수/표현식 등을 포함, 반올림의 구현
 ***
 */

// 단순 출력

var pi = 3.1415926
print("원하는 숫자는 \(pi)")



// 실제 앱 구현시, 반올림등을 상황이 자주 발생

// "원하는 숫자는 3.14" 라고 출력해야하는 경우 ⭐️

/*: ---
 - 출력 형식 지정자(Format Specifiers)
 ---
 */

// 문자열 생성자를 활용하는 방법

// String(format: <#T##String#>, <#T##arguments: CVarArg...##CVarArg#>)



var mystring: String = ""

mystring = String(3.1415926)    // 생성자:타입을 변환하는 것이 아니고 새롭게 생성하는 생성자
//print(mystring)

mystring = "원하는 숫자는 " + String(format: "%.3f", pi)  // 반올림
//print(mystring)

mystring = "원하는 숫자는 " + String(format: "%.2f", pi)
//print(mystring)

mystring = "원하는 숫자는 " + String(format: "%.1f", pi)
//print(mystring)

mystring = String(format: "원하는 숫자는 %.2f", pi)       // %.2f 자리에 pi를 대체
//print(mystring)

/*: ---
 - 출력 형식 지정자(Format Specifiers)의 종류
 ---
 */

mystring = String(format: "%d", 7)           // %d, %D   ===> 정수
print(mystring)

mystring = String(format: "%2d", 7)          // 두자리로 표현
print(mystring)

mystring = String(format: "%02d", 7)         // 두자리로 표현하되, 0포함
print(mystring)

mystring = String(format: "%07.3f", pi)      // 일곱자리로 표현하되 0과 .(dot) 포함, (소수점아래는 3자리)
print(mystring)



var swift = "Swift"

mystring = String(format: "Hello, %@", swift)       // %@  ===> 문자열

print(string)

//:> 절대 외울 필요없음! ➞ 필요할 때 찾아쓰기


// 참고 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html#//apple_ref/doc/uid/TP40004265-SW1

/*: ---
 - 형식 지정자 활용 예시
 ---
 */

// CustomStringConvertible과 결합해서 사용해보기

struct Point1: Codable {
    var x: Double
    var y: Double
}


extension Point1: CustomStringConvertible {
    var description: String {
        let formattedValue = String(format: "%1$.2f , %2$.2f", self.x, self.y)
        //let formattedValue = String(format: "%.2f", x) + " , " + String(format: "%.2f", y)
        return "\(formattedValue)"
    }
}

let ppp = Point1(x: 3.1415926, y: 2.5963756)


print("\(ppp)")




// 자주 사용하는 경우

var firstName = "Gildong"
var lastName = "Hong"

var korean = "사용자의 이름은 %2$@ %1$@ 입니다."         // 1$ 첫번째 파라미터, 2$ 두번째 파라미터
var english = "The username is %1$@ %2$@."


mystring = String(format: korean, firstName, lastName)
print(mystring)


mystring = String(format: english, firstName, lastName)
print(mystring)

/*: ---
 - 참고: NumberFormatter 클래스를 이용하는 방법
 ---
 */

// 소수점 버리기
let numberFormatter = NumberFormatter()
numberFormatter.roundingMode = .floor         // 버림으로 지정
numberFormatter.maximumSignificantDigits = 3  // 최대 표현하길 원하는 자릿수

let value = 3.1415926
var valueFormatted = numberFormatter.string(for: value)!    // 문자열화시키는 메서드
print(valueFormatted)   // 3.14



// 소수점 필수적 표현하기
numberFormatter.roundingMode = .floor         // 버림으로 지정
numberFormatter.minimumSignificantDigits = 4  // 최소 표현하길 원하는 자릿수

let value2 = 3.1
valueFormatted = numberFormatter.string(for: value2)!     // 문자열화시키는 메서드
print(valueFormatted)     // 3.100



// 세자리수마다 콤마 넣기 ⭐️

numberFormatter.numberStyle = .decimal  // 십진수
let price = 10000000
let result = numberFormatter.string(for: price)!
print(result) // "10,000,000"


//: ***

// 서브 스트링: 메모리를 공유하는 개념
/*: ## Substring
 - 서브 스트링(Substring)의 개념
 ---
 */

// 문자열은 결국에는 어떤 메모리 공간을 차지하고 있는데, 이 메모리 공간 차지를 항상 복사해서 사용을 하지는 않는다.

// 또 메모리 공간을 쓰고 또 메모리 공간을 쓰고 이렇게 사용을 하지 않고 스위프트 내부적으로 뭔가 아주 잘 설계를 이미 똑똑한 사람들이 애플에서 해놨더니

// 메모리 공간을 공유하는 개념이 있다는 것이다.

// 굳이 새로운 이 hello를 담기 위해서 새로운 메모리 공간을 쓰지 않고 기존의 메모리 공간에서 그냥 앞의 글자만 이렇게 사용을 하는 것 즉,

// 이렇게 뽑아가지고 사용을 하는 것이 바로 서브 스트링이라는 개념이다. 그래서 메모리 공간을 공유하고 있는 것이다.

var greeting = "Hello, world!"

let index: String.Index = greeting.firstIndex(of: ",") ?? greeting.endIndex    // ,(콤마)의 인덱스

let beginning: String.SubSequence = greeting[..<index]// 처음부터 인덱스까지

// "Hello"   // 타입 확인해보기 ⭐️  String.SubSequence 타입


/**======================================================
 - prefix(...)메서드 등의 사용시
 - "Hello"란 beginning문자열은 greeting 문자열의 메모리공간을 공유
 - 스위프트 내부적으로 최적화되어 있음
 - 수정 등이 일어나기 전까지 메모리 공유
 - 오랜기간 저장하기 위해서는, 새롭게 문자열로 저장할 필요
 ========================================================**/


var myword: String.SubSequence = greeting.prefix(5)

myword     // String.SubSequence 타입
// "Hello"


greeting = "Happy"    // 원본을 바꾸는 순간 Substring 문자열들은 새로운 문자열 공간을 만들어서 저장

print(beginning)
print(myword)



myword = greeting.suffix(3)

myword     // String.SubSequence 타입
// "ppy"




// 아니면 명시적으로 문자열로 변환해서 저장 가능 (서브스트링에서 벗어남)

let newString: String = String(myword)

//: ***
/*: ## 문자열을 배열로 변환
 - 문자열의 배열화, (문자열)배열의 문자열화
 ---
 */

//:> 문자열(데이터바구니) ⇄ 배열  (쉽게 변형가능)

/**============================================
 - 문자열 자체도, 여러개의 문자를 담고 있는 데이터이기 때문에
   쉽게 배열로 변형이 가능하고, 반대 변형도 쉬움
 
 -  String    <====>  [String]   문자열 배열
 -  String    <====> [Character] 문자 배열
 ============================================**/


var mysomeString = "Swift"


// 1) 문자열을 문자열(String) 배열화 하기 ⭐️

// 주로 사용하는 예시

mysomeString.map { String($0) }

var myarray: [String] = mysomeString.map { String($0) }
print(array)


// 2) 문자열을 문자(Character) 배열화 하기

var array2: [Character] = Array(mysomeString)     // [Character]      //typealias Element = Character
// 실제로 잘 사용하지 않음


// (참고) 문자열을 문자열(String) 배열화하는 추가적 방법
var array3: [String] = Array(arrayLiteral: mysomeString)  // [String]





// 3) 문자열 배열 [String] =====> 문자열

var mynewString = myarray.joined()
mynewString = array3.joined()


// 4) 문자 배열  [Character] ======> 문자열

var newString2 = String(array2)

/*: ---
 - (활용 예시) 문자열을 뒤죽박죽 섞는다면?
 ---
 */

mysomeString = "Swift"


mysomeString.randomElement()     // 문자열에서 랜덤으로 뽑아내는 것 가능
mysomeString.shuffled()          // 섞어서 문자(Character) 배열로 리턴 ["t", "i", "w", "S", "f"]




//someString.shuffled().joined()     // 불가능 (문자배열 이기때문)


var newString3 = String(mysomeString.shuffled())
print(newString3)


// map고차함수를 사용해서 변환 ⭐️: 실제로는 이런 방식으로 많이 구현함

newString3 = mysomeString.map { String($0) }.shuffled().joined()
print(newString3)
