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

welcome.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)

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

