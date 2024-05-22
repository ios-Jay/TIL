import UIKit

/*: # 컬렉션(Collection)
 
 
 */

/*: ## 1) 배열(Array)
 - 데이터를 순서대로 저장하는 컬렉션 (자동으로 순번 지정됨)
 ---
 */
/**==============================================================
 
 컬렉션의 의미:데이터 바구니(스위프트에서 사용하는 여러개의 데이터를 한꺼번에 다루는 바구니)
 
 1) Array(배열): 데이터를 순서대로 저장하는 컬렉션
 
 2) Dictionary(딕셔너리): 데이터를 키와 값으로 하나의 쌍으로 만들어 관리하는 순서가 없는 컬렉션
 
 3) Set(집합): 수학에서의 집합과 비슷한 연산을 제공하는 순서가 없는 컬렉션
 
 - 배열의 문법 약속
 
 - [] 대괄호로 묶는다. 배열의 인덱스의 시작은 0부터 (모든 프로그래밍 언어 공통 사항)
 
 - (참고):번호가 0부터 매겨지는 이유는 간략하게 설명하면 메모리 공간을 가장 효율적으로 사용하는 방법이기 때문에 그렇다.
 
 - 1개의 배열에는 동일한 타입의 데이터만 담을 수 있다.
 
 - (순서가 있기 때문에) 값은 중복 가능
 
================================================================**/

var numsArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let numberArray = [1, 2, 3, 4, 5]

var stringArray: [String] = []  // 빈배열: 타입을 반드시 명시해야 함

stringArray = ["라민 야말", "페드리", "가비", "더용", "슈테겐", "레반도프스키"]

/*: ---
 - 배열의 타입 표기
 ---
 */

// 정식문법

let strArray1: Array<Int> = []


// 단축문법

let strArray2: [String] = []

/*: ---
 - 빈 배열의 생성
 ---
 */

/*
 빈 배열의 경우 타입을 지우면 컴파일러가 배열에 구체적으로 어떤 데이터를 담을 것인지를 알 수 없다. 따라서 빈 배열을 생성할 경우 타입을 반드시 선언해야 한다.
 
 */

let emptyArray1: [Int] = []

let emptyArray2 = Array<Int>()

// let emptyArray2: Array<Int> or [Int] = Array<Int>()   타입 선언

let emptyArray3 = [Int]()

print(emptyArray3)

/*: ---
 - 배열의 기본 기능
 ---
 */
numsArray.count

numsArray.isEmpty

// !numsArray.isEmpty   // true

numsArray.contains(1)  //파라미터로 값을 전달

numsArray.contains(8)

numsArray.randomElement()

numsArray.swapAt(0, 1)

/*
 
 결국 핵심은 배열은 데이터 바구니 라는 것.
 
 그러니 숫자를 셀 수도 있고 비어 있는 여부를 확인할 수도 있어야 한다.
 
 또 그 안에 어떤 데이터가 있는지, 무엇을 포함하는지를 확인하는 것이고
 
 랜덤으로 데이터를 뽑을 수도, 데이터의 순서를 바꾸는 기능도 있는 것이다.
 
 */

/*: ---
 - 배열의 각 요소(element)에 대한 접근
 ---
 */

numsArray = [2, 4, 6, 8, 10]

stringArray = ["손흥민", "이강인", "김민재", "황희찬", "황인범", "조규성"]

// [] 서브스크립트 문법(대괄호를 이용한 특별한 함수)


stringArray[0]

stringArray[1]

stringArray[2]

stringArray[3]

stringArray[1] = "배준호"

print(stringArray)

stringArray.first

// 리턴값 String?  ====> 빈 배열이라면 nil 리턴

// 일반적으로 first에 접근했을때 값이 없을수도 있는 경우가 있기 때문에 옵셔널 타입으로 주는 것이다.

// 지금 실제로는 값이 존재하므로 강제추출연산자!를 사용하여 string.first!로 프린트 할 수 있다.

stringArray.last

// 배열의 시작 인덱스

stringArray.startIndex

// 시작하는 인덱스를 알려줌. 무조건 0이 나온다. 시작하는 인덱스는 언제나 0

// startIndex가 0이기도 하지만 사실 메모리 주소를 의미한다.

stringArray.endIndex

// stringArray.endIndex.advanced(by: -1)


// endIndex는 배열로 저장되는 메모리 공간의 끝의 주소를 의미한다.

// 교재의 그림을 참고 하면 직관적으로 이해할 수 있다.

// 따라서 배열의 범위를 벗어나지 않으려면 항상 마이너스 1을 해줘야 한다.

/*: ---
 - 삽입하기 (insert)
 ---
 */
var hangul = ["가", "나", "다", "라", "마", "바", "사"]

// 앞 또는 중간에 삽입하기

hangul.insert("4", at: 4)

hangul.insert("1", at: hangul.endIndex)

hangul.insert(contentsOf: ["a", "b", "c"], at: 0)

/*: ---
 - 교체하기 (replace)
 ---
 */
var alphabet = ["A", "B", "C", "D", "E", "F", "G"]

// 요소 교체하기

alphabet[0] = "a"


// 범위를 교체하기

alphabet[0...2] = ["x", "y", "z"]



// 원하는 범위 삭제

alphabet[0...1] = []

alphabet





// 교체하기 함수 문법

alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])

/*: ---
 - 추가하기(Append)
 ---
 */
alphabet = ["A", "B", "C", "D", "E", "F", "G"]


alphabet += ["H"]

// print(alphabet)

// 추가하기 함수 문법

alphabet.append("H")   // 맨 마지막에 추가하는 것

alphabet.append(contentsOf: ["H", "I"])



// alphabet.append(7)   // 에러 ===> 동일한 자료형만 저장가능함


/*: ---
 - 삭제(제거)하기 (remove)
 ---
 */
alphabet = ["A", "B", "C", "D", "E", "F", "G"]


// 서브스크립트 문법으로 삭제

alphabet[0...2] = []   //빈배열 전달하면 해당 범위가 삭제

// 요소 한개 삭제

alphabet.remove(at: 2)  // 삭제하고, 삭제된 요소 리턴

//alphabet.remove(at: 8)    // 잘못된 인덱스 전달 ====> 에러발생

// 요소 범위 삭제

alphabet.removeSubrange(0...2)



alphabet = ["A", "B", "C", "D", "E", "F", "G"]


// alphabet.removeFirst()

// 맨 앞에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)

alphabet.removeFirst(2)   // 앞의 두개의 요소 삭제 ===> 리턴은 안함


alphabet.removeLast()

// 맨 뒤에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)

alphabet.removeLast(2)




// alphabet.removeFirst()    // 리턴형 String

// 리턴형이 옵셔널 스트링이 아니고 스트링이다. 이 말은 무조건 문자열을 반환한다는 뜻.

// 무조건 문자열을 반환한다는 뜻은 잘못된 경우를 고려하지 않는다는 뜻.

// 즉, nil이 나올 가능성이 없다고 이야기를 하는 것.

// alphabet = [] --> 이런 경우는 백퍼센트 에러가 발생할 수 밖에 없다.

// 배열이 비어있는지도 잘 확인해보고 삭제(제거)해야함 =======> 에러

// alphabet.removeLast()     // 리턴형 String

// 배열의 요소 모두 삭제(제거)

alphabet.removeAll()

// 메모리 공간을 만드는 일을 다시 해줘야 함. 그래서 조금 더 느림

alphabet.removeAll(keepingCapacity: true)

// 저장공간을 일단은 보관해 둠. (안의 데이터만 일단 날림)

// 내용물은 지우되, 우리가 사용하던 이 메모리 공간은 그냥 일단 유지는 해둔다는 뜻.

/*
 메모리 공간을 그대로 놔두면 다시 할당을 할때 훨씬 내부적으로 더 빨리 할당을 할 수 있다. 기존의 메모리 공간이 그대로 남아있기 때문.
 */

/*: ---
 - 배열의 기타 기능
 ---
 */

var nums = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]



// 배열을 정리해보기

// 1) 배열을 직접 정렬하는 메서드  sort  (동사)

// 2) 정렬된 새로운 배열을 리턴  sorted (동사ing/동사ed)

// 새로 변경된 배열을 반환 하기 때문에 원본 배열 자체는 건드리지 않는 것이 sorted

// 옵션 키 눌러서 타입 확인



nums.sort()   // 배열을 직접 정렬 (오름차순) (배열리턴 하지 않음)

nums.sorted()    //오름차순으로 정렬


nums.reverse()   // 요소를 역순으로 정렬  (배열리턴 하지 않음)
nums.reversed()


nums.sorted().reversed()

// 새로운 배열은 생성하지 않고,

// 배열의 메모리는 공유하면서 역순으로 열거할 수 있는 형식을 리턴



// 배열을 랜덤으로 섞기

//nums.shuffle()    // 요소의 순서 랜덤으로 직접 바꾸기

//nums.shuffled()




/*: ---
 - 활용
 ---
 */

// 특정 요소 한개 삭제하기

// ===> 직접 삭제는 불가 (1) 인덱스 찾아서, (2) 인덱스에 해당하는 요소 지우기

var puppy1 = ["p", "u", "p", "p", "y"]



if let lastIndexOfP = puppy1.lastIndex(of: "p") {
    
    puppy1.remove(at: lastIndexOfP) // == 3
    
//    at: 3이라고 사용하지 않는 이유: 배열에 p가 없을 수도 있기 때문(앱 개발 시)
    
//    즉, 데이터 바구니가 플레이그라운드가 아닌 앱 개발에서는 복잡하기 때문.
}
// 가장 뒤에서부터 먼저 있는 p를 찾았을 때




if !nums.isEmpty {            // "!"(true ====> false)  (false ====> true)
    print("\(nums.count) element(s)")
} else {
    print("empty array")
}




// 배열의 배열 접근

var data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

// 옵션을 눌러 타입 확인:내부에는 배열 타입으로 되어 있고, 그 안에 또 배열 타입


data[0][2]


/*: ---
 - 반복문과의 결합
 ---
 */

//:> enumerate: 영어로 열거하다는 뜻

// 각 요소에 차례대로 접근, 배열과 반복문은 필연적으로 많이 쓰임

for i in nums {
    
    print(i)
    
}




//:> enumerate: 영어로 열거하다는 뜻

// enumerated() ===> 열거된 것들을 Named 튜플 형태로 한개씩 전달

// 데이터 바구니이기 때문에,

// 실제 번호표(index)까지 붙여서, 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능

nums = [10, 11, 12, 13, 14]


// (offset: 0, element: 10) -->인덱스(순서까지 같이 뽑아가지고 열거)


for tuple in nums.enumerated() {
    
    // print(tuple)
    
    print("\(tuple.0) - \(tuple.1)")
    
    // offset, element 로도 사용 가능
}



for (index, word) in nums.enumerated() {
    
    // 바로 뽑아내기
    
    print("\(index) - \(word)")
}




for (index, value) in nums.enumerated().reversed() {
    
    // 거꾸로 뒤에서 부터
    
    print("\(index) - \(value)")
}


//: ---

/*: ## 2) 딕셔너리(Dictionary)
 - 데이터를 키와 값으로 하나의 쌍으로 만들어 관리하는 컬렉션
 ---
 */
/**==============================================================
 
 - 딕셔너리의 문법 약속
 
 - [] 대괄호로 묶는다. (쌍을 콜론으로 처리)
 
 - 키값은 유일해야함 / 중복 불가능(구분하는 요소이기 때문에) 밸류값은 중복 가능
 
 - 1개의 딕셔너리에는 동일한 자료형 쌍의 데이터만 담을 수 있음
 
 - 키값은 Hashble 해야함
 
 ================================================================**/


var dic = ["A": "Apple", "B": "Banana", "C": "City"]

// 딕셔너리 리터럴로 생성해서 저장

let dic1 = [1: "Apple", 2: "Banana", 3: "City"]

// 내부적으로 순서가 존재하지 않음

print(dic)

print(dic1)

/*: ---
 
 - 딕셔너리의 타입 표기
 
 ---
 */
// 단축문법

var words: [String: String] = [:]

// 정식문법

let words1: Dictionary<Int, String>

/*: ---
 - 빈 딕셔너리의 생성
 ---
 */
let emptyDic1: Dictionary<Int, String> = [:]

let emptyDic2 = Dictionary<Int, String>()

let emptyDic3 = [Int: String]()




//var dictFromLiteral = [:]    // 타입 정보가 없으면 유추할 수가 없다.


var dictFromLiteral = ["1": 1, "2": 2]

dictFromLiteral = [:]    // 이미 위에서 타입을 정의했다면, 아래에서 빈 값으로 넣는 것은 괜찮음


/*:  ---
 - 딕셔너리의 기본 기능
 ---
 */
dic = ["A": "Apple", "B": "Banana", "C": "City"]



dic.count
dic.isEmpty


// contains 함수가 존재하긴 하나, 뒤에서 배울 클로저의 내용을 알아야함

// dic.contains(where: <#T##((key: String, value: String)) throws -> Bool#>)

//dic = [:]

dic.randomElement()

// Optional Named Tuple 형태로 리턴. 따라서 빈 딕셔너리의 경우 nil

// if let tuple = dic.randomElemebt() {

//    print(tuple)

// }

/*: ---
 - 딕셔너리의 각 요소(element)에 대한 접근 (키 값으로 접근)
 ---
 */
// 배열



var numsArray1 = [1, 2, 3, 4, 5]

numsArray1[0]

//:> 딕셔너리는 기본적으로 서브스크립트[ ]를 이용한 문법을 주로 사용
// 딕셔너리

dic = ["A": "Apple", "B": "Banana", "C": "City"]



dic["A"]        // nil의 가능성 =====> String?(옵셔널)

// print(dic["A"]) Optional("Apple")

// print(dic["Q"]) nil



if let a = dic["A"] {    // 옵셔널 바인딩
    print(a)
} else {
    print("Not found")
}



// 딕셔너리는 값만 따로 검색하는 방법은 제공하지 않음. ⭐️

// 서브스크립트 문법으로 "키"를 전달


// 참고 (잘 사용하지는 않음)

dic["S", default: "Empty"]       // nil이 발생할 확률이 없음

// 자료가 없으면 기본값을 리턴하는 문법  ===> 리턴 String




dic.keys
dic.values

// 배열로 변환
dic.keys.sorted()
dic.values.sorted()

// 배열로 변환되니 반복문에서 사용 가능

for key in dic.keys.sorted() {     // 오름차순 정렬  ===> "return 배열" 배열이 됨
    print(key)
}

/*:---
 - 업데이트 (update) - 삽입하기 / 교체하기 / 추가하기
 ---
 */
words = [:]

words["A"] = "Apple"   // 애플로 다시 바꾸기
words

words["B"] = "Banana"  // 동일한 키가 없으면 ===> 추가하기
words

words["B"] = "Blue"    // 동일한 키가 있으면 ===> 기존 밸류 덮어쓰기
words

words.updateValue("City", forKey: "C")

/*
 기존에 이 키 값(C)에 해당하는 것이 없어 가지고 새로운 것이 추가가 되면
 
 그것은 기존에 바꾸는 것이 없다는 의미이기도 하다.
 
 그러니까 단순하게 추가한다.
 
 지금은 아무것도 없고, 지금 현재까지는 아무것도 없고, 기존에 아무것도 없었고
 
 새로운 것이 추가가 더 된다는 의미에서 nil을 리턴한다.
 */



// (정식 기능) 함수 문법 (update + insert = upsert)

words.updateValue("City", forKey: "C")   // 새로운 요소가 추가되면 ==> 리턴 nil
words

/*
 
 기존에 만약에 지금은 이제 이미 C에 해당하는 ct가 있다.
 
 그래서 위의 코드는 ct를 다시 한번 추가(업데이트)하는 것이다.
 
 그럼 이렇게 되면은 만약에 기존에 이제 기존에 key 값에 해당하는 value가 존재한다.
 
 value가 있으면 원래 있던 거를 지우고 새롭게 업데이트 하겠다는 의미이다.
 
 원래 예전에 있던 데이터를 지우면서 반환을 한다는(업데이트) 의미이다.
 
 */



words = [:]      // 빈 딕셔너리로 만들기

words = ["A": "A"]   // 전체 교체하기(바꾸기)


//:> 딕셔너리는 append 함수를 제공하지 않음
// append는 순서가 있는 컬렉션의 끝에 추가하는 개념

// 딕셔너리는 순서가 없기 때문에, update를 통해서 추가

/*: ---
 - 삭제(제거)하기(Remove)
 ---
 */

dic = ["A": "Apple", "B": "Banana", "C": "City"]


// 요소 삭제해 보기

dic["B"] = nil    // 해당요소 삭제
dic


dic["E"] = nil   // 존재하지 않는 키/값을 삭제 ======> 아무일이 일어나지 않음(에러아님)
dic



// 함수로 삭제해보기

dic.removeValue(forKey: "A")   // 삭제후, 삭제된 값 리턴

dic.removeValue(forKey: "A")   // 다시 삭제해보기 ===> nil리턴




// 전체 삭제하기

dic.removeAll()
dic.removeAll(keepingCapacity: true)

/*: ---
 - 딕셔너리의 활용
 ---
 */

// 딕셔너리의 중첩 사용

var dict1 = [String: [String]]()

// 딕셔너리 밸류에 "배열"이 들어갈 수도 있다.


dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1

//dict1["arr"] = "A"



var dict2 = [String: [String: Int]]()     // 딕셔너리 안에 딕셔너리가 들어갈 수 있다.

dict2["dic1"] = ["name": 1, "age": 2]

dict2["dic2"] = ["name": 2, "age": 4]

dict2

/*: ---
 - 반복문과의 결합
 ---
 */

// 딕셔너리 열거해서 프린트 하기

let dict = ["A": "Apple", "B": "Banana", "C": "City"]


// 딕셔너리는 열거하지 않아도, Named 튜플 형태로 하나식 꺼내서 전달

// 순서가 없으므로, 실행마다 순서가 달라짐 ⭐️

/*
 
 배열은 데이터 바구니이기 때문에
 
 일반적으로 그 데이터 바구니에 들어있는 하나하나의 요소,
 
 즉 아이템들을 순차적이든 어쩄든 하나하나 꺼내서 사용하는 경우가 많다.
 
 그래서 반복문하고 결합이 되어 사용되는 경우가 많다.
 
 그런데 딕셔너리도 데이터 바구니이기 때문에 요소가 여러가지 존재하고
 
 이 요소를 하나하나씩 꺼내서 사용하는 경우가 많다.
 
 */


// 데이터 바구니이기 때문에,

// 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능


/*
 
 딕셔너리는 결국 키값과 밸류값의 한쌍이다.
 
 그래서 이 키와 밸류를 잘 다룰 수 있는,
 
 이 두개가 묶여져있는 형태로 잘 다룰 수 있는
 
 가장 논리적이고 합리적인 형태가 사실상 튜플 밖에 없다.
 
 튜플이기 때문에 일단은 반복문에서 꺼내서 줄 때
 
 이 키와 밸류를 다룰 수 있는 이 두 개 전부를 한꺼번에 잘 다룰 수 있는 튜플 형태로 전달하는 것이다.
 */


for (key, value) in dict {
    
    print("\(key): \(value)")
}


for (key, _) in dict {
    print("Key :", key)
}


for (_, value) in dict {
    print("Value :", value)
}


//: ---


/*: ## 3) 세트(Set)
 - 집합: 수학에서의 집합과 비슷한 연산을 제공하는 컬렉션
 ---
 */

/**==============================================================
 
 - Set의 문법 약속
 
 - 생김새는 배열과 같음(따라서, 생성시 타입을 선언 해야함)
 
 - 수학에서의 집합과 동일하기 때문에 요소는 유일해야함(순서가 존재하지 않음)
 
 ================================================================**/


