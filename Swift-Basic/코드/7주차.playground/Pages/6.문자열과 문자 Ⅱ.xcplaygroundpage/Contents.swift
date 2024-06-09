import UIKit

/*: ## 문자열 다루기
 - 문자열의 대소문자 변형
 ---
 */

//:> 스위프트는 대문자와 소문자를 다른 문자로 인식(유니코드 다름)
var string = "swift"


string.lowercased()    // 전체 소문자로 바꾼 문자열 리턴 (원본 그대로)
string.uppercased()    // 전체 대문자로 바꾼 문자열 리턴 (원본 그대로)

string.capitalized     // 대문자로 시작하는 글자로 리턴하는 속성 (원본 그대로)
//"swift".capitalized




// 소문자로 변형시키서 비교하는 것은 가능

"swift" == "Swift"   // false

"swift".lowercased() == "Swift".lowercased()    // true


/*: ---
 - 문자열 다루기 기본 - count, isEmpty 속성
 ---
 */

var emptyString = " "    // [공백]이 포함된 문자열

// 문자열은 길이를 기준으로 빈문장열을 판단

emptyString.count     // 1
emptyString.isEmpty   // false



emptyString = ""     // [빈] 문자열    (nil이 절대 아님)

emptyString.count        // 0
emptyString.isEmpty      // true



if emptyString == nil {    // 빈 문자열은 nil이 아님 ===> String타입 (O)   String?타입 (X)
    print("nil")
}









/*: ---
 - String의 인덱스(색인/순번) 타입
 ---
 */

//:>문자열도 Collection 프로토콜(Array / Dictionary / Set)을 따르고 있음 ➞ 데이터바구니
/**============================================================
 
 - 문자열의 인덱스는 정수가 아님 ⭐️
 - (스위프트는 문자열을 글자의 의미단위로 사용하기 때문에, 정수 인덱스 사용 불가)
 
 [String.Index 타입]
 - 문자열.startIndex
 - 문자열.endIndex
 - 문자열.index(<#T##i: String.Index##String.Index#>, offsetBy: <#T##String.IndexDistance#>)
 
 - 문자열.index(after: <#T##String.Index#>)
 - 문자열.index(before: <#T##String.Index#>)
 - (다만, 인덱스의 크기 비교는 당연히 가능)
 
 - 문자열.indices     (인덱스의 모음)
 - (인덱스를 벗어나는 것에 주의)
 
 
 - 문자열.firstIndex(of: <#T##Character#>)
 - 문자열.lastIndex(of: <#T##Character#>)
 
 
 [String.Index 범위]
 - 문자열.range(of: <#T##StringProtocol#>)
 - 문자열.range(of: <#T##StringProtocol#>, options: <#T##String.CompareOptions#>, range: <#T##Range<String.Index>?#>, locale: <#T##Locale?#>)
 
 
 - String.Index를 이용, 서브스크립트 활용가능 ⭐️
 
 
 [String.Index의 정수형태로 거리는 측정 가능]
 - 문자열.distance(from: <#T##String.Index#>, to: <#T##String.Index#>)
 ==============================================================**/



let greeting = "Guten Tag!"


var index1 = greeting.startIndex

greeting.startIndex
print(greeting.startIndex)

greeting[greeting.startIndex]    // "G"

// 인덱스 문자로서 다루고 있는 인덱스 타입이 나오기 때문에 인덱스 타입으로서 서브스크립트 문법 사용 가능
greeting[index1]

// 서브스크립트 문법을 쓸 수 없다는 뜻이 아닌 정수 형태의 인덱스를 사용할 수 없다는 뜻이라는 것을 이해

// 정수형태를 한번 변형해서(걸러서) 사용하는 방식 ⭐️

var someIndex = greeting.index(greeting.startIndex, offsetBy: 2)
greeting[someIndex]      // "t"


someIndex = greeting.index(greeting.startIndex, offsetBy: 1)
greeting[someIndex]      // "u"


someIndex = greeting.index(after: greeting.startIndex)
greeting[someIndex]      // "u"


someIndex = greeting.index(before: greeting.endIndex)
greeting[someIndex]      // "!"




for index in greeting.indices {       // 개별 문자의 인덱스에 접근
    print("\(greeting[index]) ", terminator: "")
}
print("")


//======================================== 출력결과는 동일하지만 접근법이 다름
for char in greeting {
    print("\(char) ", terminator: "")
}
//========================================




// 공백 문자열 다음의 글자를 알고 싶을때

var firstIndex = greeting.firstIndex(of: " ")!
var nextOfEmptyIndex = greeting.index(firstIndex, offsetBy: 1)
greeting[nextOfEmptyIndex]


// 세번째 글자를 알고 싶을때

var thirdCharIndex  = greeting.index(greeting.startIndex, offsetBy: 2)           // 스타트 인덱스에서 2만큼 이동한 인덱스로

var thirdCh = greeting[thirdCharIndex]




// 범위를 벗어나면 에러발생 주의 ⭐️

//greeting[greeting.endIndex]
greeting[greeting.index(greeting.endIndex, offsetBy: -1)]
//greeting[greeting.index(before: greeting.endIndex)]


// 예를 들자면, 아래와 같이 올바른 범위에서 실행

someIndex = greeting.index(greeting.startIndex, offsetBy: 7)


if greeting.startIndex <= someIndex && someIndex < greeting.endIndex { // 범위를 벗어나지 않는 경우 코드 실행
    print(greeting[someIndex])
}




// indices를 직접 출력해보기

for i in greeting.indices {
    print(i)
}


// let greeting = "Guten Tag!"


// 문자열 특정범위를 추출

let lower = greeting.index(greeting.startIndex, offsetBy: 2)
let upper = greeting.index(greeting.startIndex, offsetBy: 5)
greeting[lower...upper]



// 실제로는 뒤에서 배울, 교체/삭제에서 주로 범위를 활용

var range = greeting.range(of: "Tag!")!
greeting[range]


range = greeting.range(of: "tag", options: [.caseInsensitive])!
greeting[range]



// 정수 형태 수치로 거리 측정

var distance = greeting.distance(from: lower, to: upper)
print(distance)



//: ***


/*: ## 문자열의 삽입/교체/추가/삭제
 - 삽입(insert), 교체(replace), 추가(append), 삭제(remove)
 ***
 */

//:> 문자열은 배열과 유사한 데이터 바구니

/**================================================
 [삽입하기]
   insert(_:,at:)       // 특정인덱스에 문자
   insert(contentsOf:,at:)    // 특정인덱스에 문자열
 
 [교체하기]
   replaceSubrange(_:,with:)    // 범위기준 교체
   replacingOccurrences(of:,with:)       //  (존재하면) 해당글자가 있으면 교체 ==> 원본은 그대로
   replacingOccurrences(of:,with:,options:,range:)
 
 [추가하기]
   문자열 기본 연산자 + / +=
   append(_:)

 [삭제하기]
   remove(at:)        // 특정인덱스의 문자
   removeSubrange(_:)       // 특정인덱스의 문자열
 
 - removeFirst(2)
 - removeLast(2)
 - removeAll()
 - removeAll(keepingCapacity: true)
 

 
 [Subrange만 반환] 원본은 그대로
 - dropFirst(2)   // 앞의 두글자 뺀 나머지 반환
 - dropLast(2)    // 뒤의 두글자 뺀 나머지 반환
 ==================================================**/

/*: ---
 - 삽입하기 (insert)
 ---
 */

var welcome = "Hello"

welcome.insert("!", at: welcome.endIndex)
// "Hello!"


welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// "Hello there!"


/*: ---
 - 교체하기 (replace)
 ---
 */

welcome = "Hello there!"
print(welcome)

if let range = welcome.range(of: " there!") {  // 범위를 가지고
    welcome.replaceSubrange(range, with: " Swift!")     // 교체하기
    print(welcome)
}


// 교체하되, 문자열 원본은 그대로 (occurrence: 존재하는)

var newWelcome = welcome.replacingOccurrences(of: "Swift", with: "World")
// "Swift"라는 문자열이 존재하면, "World"로 교체
print(welcome)
print(newWelcome)

// welcome.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)

                                                                // 대소문자 무시 옵션
newWelcome = welcome.replacingOccurrences(of: "swift", with: "New World", options: [.caseInsensitive], range: nil)
print(welcome)
print(newWelcome)

/*: ---
 - 추가하기 (append)
 ---
 */

"swift" + "!"  // 너무나 당연

welcome.append("!")
welcome.append(" Awesome!")

/*: ---
 - 삭제(제거)하기 (remove)
 ---
 */

welcome = "Hello Swift!"


// 인덱스를 가지고 지우기
// (endIndex의 전 인덱스)
welcome.remove(at: welcome.index(before: welcome.endIndex))     // "!" 지우기
welcome
// "Hello Swift"


// 인덱스 범위파악
var range1 = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
//range = welcome.range(of: " Swift")!


// " Swift"의 범위를 파악하고 지우기
welcome.removeSubrange(range1)
welcome      // "Hello"


welcome.removeAll()
welcome.removeAll(keepingCapacity: true)

/*: ---
 - 문자열 삽입과 삭제의 활용
 ---
 */

var string1 = "Hello world"


// 1) " " 공백 문자열의 인덱스 찾기
// 2) " " 공백 문자열의 인덱스에 " super" 삽입하기


if let someIndex = string1.firstIndex(of: " ") {    // 정수형 인덱스 형태 X, 문자열 인덱스
    string1.insert(contentsOf: " super", at: someIndex)
    print(string1)      // "Hello super world"
}


// 1) 첫 " " 공백 문자열의 인덱스 찾기
// 2) " super" 문자열의 범위 만들기
// 3) 범위 삭제하기


if let firstIndex = string.firstIndex(of: " ") {
    let range = firstIndex...string.index(firstIndex, offsetBy: 5)
    string.removeSubrange(range)
    print(string)     // "Hello world"
}



// 바꿀 문자열을 정확하게 알고 있다면 ===> 범위를 직접 리턴하는 메서드 활용 ⭐️

if let range = string.range(of: " world") {
    string.removeSubrange(range)
    print(string)
}

//: ***

/*: ## 문자열 비교하기
 - 문자열의 단순 비교
 ---
 */

// 비교연산자 (대소문자 구별)

"swift" == "Swift"   // false
"swift" != "Swift"   // true   ===> 둘의 문자는 다른 것임



// 크기 비교하기 (유니코드 비교)

"swift" < "Swift"      // false ====> 첫 글자의 (유니코드) 순서를 비교
"swift" <= "Swift"     // false ====> 소문자가 (유니코드/아스키코드) 더 뒤에 위치
//"Swift" <= "swift"     // true


// 대소문자 무시하고 비교는?
// (간단하게는 일치시킨 후 비교)

"swift".lowercased() == "Swift".lowercased()
    
//:> 대소문자무시하고 비교하는 메서드 존재 → caseInsensitiveCompare(문자열)

var a = "swift"
var b = "Swift"

var result = a.caseInsensitiveCompare(b)

switch result {
case .orderedAscending:
    print("오름차순으로 나옴")
case .orderedDescending:
    print("내림차순으로 나옴")
case .orderedSame:
    print("동일한 차순으로 나옴")
}

a.caseInsensitiveCompare(b) == ComparisonResult.orderedSame





//문자열.caseInsensitiveCompare(<#T##aString: StringProtocol##StringProtocol#>)


/**========================================================
 ComparisonResult 열거형 타입으로 정의  (비교 결과 타입)
  1) .orderedSame          // 동일
  2) .orderedAscending     // 오름차순
  3) .orderedDescending    // 내림차순
 
 - 단순 같은지 틀린지 뿐만아니라, 결과가 오름차순/내림차순인지
   내림차순인지 알수 있어서 결과값이 활용성이 높고 보다 구체적인 정보 제공가능 ⭐️
   (다만, 처음 사용하는 입장에서 헷갈릴 수 있으므로 잘 알고
   사용해야하는 불편함이 있을 수 있음)
===========================================================**/


/*: ## 문자열 비교 메서드
 - 문자열에서 일치여부 확인 메서드 사용
 ---
 */

//:> 일치여부 메서드 사용 → "다양한 옵션"적용이 가능해서 비교를 여러가지 방식으로 활용가능

// 문자열.compare(_:options:range:locale:) ⭐️


var name = "Hello, Swift"


name.compare("hello", options: [.caseInsensitive]) == .orderedDescending    // 내림차순  ( , ==>  )

/*: ---
 - 문자열 비교 옵션(String.CompareOptions)과 비교 결과
 ---
 */

// String.CompareOptions (비교 옵션)

/**==========================================
 [String.CompareOptions 구조체]와 내부의 타입 속성들
 - .caseInsensitive       // 대소문자 무시하고 ⭐️
 
 - .diacriticInsensitive  // 발음구별기호 무시하고
 - .widthInsensitive      // 글자 넓이 무시하고
 
 - .forcedOrdering        // 강제적 오름차순/내림차순 정렬순 (대소문자 무조건 구별 의미)
 - .literal               // (유니코드 자체로) 글자그대로
 - .numeric               // 숫자 전체를 인식해서 비교
 
 - .anchored              // (앞부분부터) 고정시키고 (접두어)
 - .backwards             // 문자 뒷자리부터

 - .regularExpression     // 정규식 검증 ⭐️
=============================================**/



// 옵션 입력 부분
// OptionSet 프로토콜 채택시, 여러개의 옵션을 배열 형식으로 전달 가능
//NSString.CompareOptions
/**==========================================
 struct CompareOptions : OptionSet   프로토콜 채택
=============================================**/




// .diacriticInsensitive 발음구별기호 무시하고
"café".compare("cafe", options: [.diacriticInsensitive]) == .orderedSame


// .widthInsensitive 글자 넓이 무시하고
"ァ".compare("ｧ", options: [.widthInsensitive]) == .orderedSame




// .forcedOrdering 강제적 오름차순/내림차순 정렬순 (대소문자 무조건 구별 의미)
"Hello".compare("hello", options: [.forcedOrdering, .caseInsensitive]) == .orderedAscending


// .numeric 옵션 숫자 전체를 인식해서 비교
"album_photo9.jpg".compare("album_photo10.jpg", options: [.numeric]) == .orderedAscending


// .literal 옵션
"\u{D55C}".compare("\u{1112}\u{1161}\u{11AB}", options: [.literal]) == .orderedSame
// "한"(완성형)     "ㅎ+ㅏ+ㄴ"(조합형)




// .anchored 옵션 (앞부분부터) 고정시키고 (접두어)
if let _ = "Hello, Swift".range(of: "Hello", options: [.anchored]) {   // 범위리턴 ===> 접두어 기능
    print("접두어 일치")
}




// .anchored 옵션 + .backwards 뒷자리부터 고정 (접미어)
if let _ = "Hello, Swift".range(of: "Swift", options: [.anchored, .backwards]) {   // ===> 접미어 기능
    print("접미어 일치")
}

/*: ## 문자열 (일부)포함여부 및 앞/뒤 글자의 반환
 - 문자열에서 일치여부 확인하기
 ---
 */
let mystring = "Hello, world!"



// 전체문자열에서 포함여부

mystring.contains("Hello")
mystring.lowercased().contains("hello")
mystring.contains("world")


// 접두어/접미어 포함여부

mystring.hasPrefix("Hello")
mystring.hasPrefix("world")
mystring.lowercased().hasPrefix("world")

mystring.hasSuffix("!")
mystring.hasSuffix("world!")





// 접두어/접미어 반환 (앞에서 또는 뒤에서 몇글자 뽑아내기)

mystring.prefix(2)
mystring.suffix(3)


// 공통 접두어 반환

mystring.commonPrefix(with: "Hello, swift")
mystring.commonPrefix(with: "hello", options: [.caseInsensitive])



// 앞/뒤를 drop시킨 나머지 반환

mystring.dropFirst(3)
mystring.dropLast(3)

//: ---

/*: ## 정규식 / 정규표현식
 - 정규식(정규표현식)을 이용한 문자열의 판별
 ---
 */

//:> 정규식(正規式)은 "특정한 규칙"을 가진 문자열의 집합을 표현하는 데 사용하는 형식 언어

// (스위프트에만 해당하는 것이 아님)


// 올바른 전화번호 형식일까?

// (정규식 확인하는 코드)

let number = "010-1234-12345"


// 정규식 (RawString으로 작성하면 메타문자를 바로 입력가능) ===> 가독성 높아짐

// (스위프트에서는 \ 백슬레시를 이스케이프 문자로 인식하기 때문)

var telephoneNumRegex = #"[0-9]{3}\-[0-9]{4}\-[0-9]{4}"#


if let _ = number.range(of: telephoneNumRegex, options: [.regularExpression]) {
    print("유효한 전화번호로 판단")
}

//:> 간단한 정규식 사용

// 정규식에 대한 내용을 찾으려면, 구글 및 유튜브 검색 및 활용

/**=========================================================**/
  #"[0-9]{3}[- .]?[0-9]{4}[- .]?[0-9]{4}"#   // 전화번호 러프하게
  #".*@.*\..*"#                              // 이메일 러프하게
  #"[0-9]{3}\-[0-9]{3}"#                     // 우편번호 러프하게
/**=========================================================**/



// 참고
// https://www.youtube.com/watch?v=Gg0tlbrxJSc
// https://www.youtube.com/watch?v=-5cnj7q1-YY
// https://regexr.com/
// https://regexr.com/5nvc2

//: ---

/*: ## 특정문자의 (검색 및) 제거
 - 어떻게 문자열에 있는 특정문자들을 제거할 수 있을까?
 ---
 */

/**==========================================================
[특정 문자들을 제거할때 사용하기 위한 메서드]
 
1) 간단하게 앞뒤의 특정 문자를 제거하는 메서드
 - 문자열.trimmingCharacters(in: <#T##CharacterSet#>)

 
2) 문자열의 중간에 특정 문자를 제거하는 방법 ⭐️
   "해당 특정 문자"를 기준으로 (잘라서) 문자열을 배열로 ===> (다시 배열을) 문자열로
 
 - 문자열.components(separatedBy: <#T##CharacterSet#>).joined()
=========================================================**/
//CharacterSet.uppercaseLetters




// 1) 앞뒤의 공백문자의 제거

var userEmail = " my-email@example.com "

var trimmedString = userEmail.trimmingCharacters(in: [" "])
print(trimmedString)
// "my-email@example.com" (처음, 마지막의 공백 문자열 제거)



// CharacterSet 개념을 활용해서
trimmedString = userEmail.trimmingCharacters(in: .whitespaces)
print(trimmedString)




// 2) 앞뒤의 특정문자의 제거

var someString = "?Swift!"
var removedString = someString.trimmingCharacters(in: ["?","!"])
print(removedString)


someString = "?Swi!ft!"
removedString = someString.trimmingCharacters(in: ["?","!"])
print(removedString)       // 중간에 있는 !는 제거하지 못함

//:> 중간에 있는 특수문자의 제거 원리: 해당 특수문자를 기준으로 문자열을 배열로 만든다음 → 다시 문자열로 변환

var myname = " S t e v e "
var removedName = myname.components(separatedBy: " ").joined()    //["", "S", "t", "e", "v", "e", ""]
print(removedName)



// 4) (중간에 포함된)특수문자의 제거

var phoneNum = "010-1234-1234"
var newPhoneNum = phoneNum.components(separatedBy: "-").joined()   // ["010", "1234", "1234"]
print(newPhoneNum)


// 5) 여러개의 특수문자를 한꺼번에 제거

var numString =  "1+2-3*4/5"
var removedNumString =  numString.components(separatedBy: ["+","-","*","/"]).joined()
print(removedNumString)




// 6) components(separatedBy:)와 거의 동일한 메서드 split(separator:) 그러나 차이는 있음

var str =  "Hello Swift"
var arr = str.split(separator: " ")    // 서브스트링으로 리턴함
print(arr)
print(arr.joined())


// - (1) split은 Substring 배열로 리턴
str.split(separator: " ")



// - (2) split은 클로저를 파라미터로 받기도 함 (클로저에서 원하는 함수내용을 정의하면 되므로 활용도가 더 높을 수 있음)
str.split { $0 == " " }

//str.split(whereSeparator: <#T##(Character) throws -> Bool#>)

/*: ---
 - (미리 정의된) 특정 문자 집합(Set)의 개념을 이용하면, 조금 더 편하게 사용가능
 ---
 */


// 구조체로 구현되어 있는
// 문자집합 (문자열 검색, 잘못된 문자 삭제 등에 주로 활용) (기본적인 Set성격)

/**=========================================
 [CharacterSet] 유니코드 기준
 - .symbols                // 기호
 - .alphanumerics          // 문자 + 숫자
 - .decimalDigits          // 10진법 숫자
 - .letters                // 문자 (유니코드상 Letter, Mark 카테고리 해당 문자)
 - .lowercaseLetters       // 소문자
 - .uppercaseLetters       // 대문자  ["A", "B", "C", "D", "E" ...]
 - .whitespaces            // 공백문자 [" "]
 - ....등등
 
 참고: https://developer.apple.com/documentation/foundation/characterset
============================================**/



// 문자셋을 활용해서

userEmail = " my-email@example.com "

var characterSet = CharacterSet.whitespaces   // 공백문자 집합

trimmedString = userEmail.trimmingCharacters(in: characterSet)
print(trimmedString)




myname = " S t e v e "

removedName = myname.components(separatedBy: characterSet).joined()
print(removedName)




var phoneNumbers = "010 1111 2222"
print(phoneNumbers.components(separatedBy: .whitespaces).joined())


//:> 특정 문자열 검색에도 활용가능
myname = "hello+world"


if let range = myname.rangeOfCharacter(from: .symbols) {
    print(myname[range])
}

name.rangeOfCharacter(from: .whitespaces)
