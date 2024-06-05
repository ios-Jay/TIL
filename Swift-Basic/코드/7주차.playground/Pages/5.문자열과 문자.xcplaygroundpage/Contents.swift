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
