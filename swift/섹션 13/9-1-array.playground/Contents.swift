import UIKit

// 1) 배열(Array)

// 데이터를 순서대로 저장하는 컬렉션(자동으로 순번 저장됨)

/**==============================================================
 - 배열의 문법 약속
 
 - [] 대괄호로 묶는다. 배열의 인덱스의 시작은 0부터 (모든 프로그래밍 언어 공통 사항)
 
 - 1개의 배열에는 동일한 타입의 데이터만 담을 수 있다.
 
 - (순서가 있기 때문에) 값은 중복 가능
 
================================================================**/

var numsArray = [1, 2, 3, 4, 5]

let numsArray1 = [20, 2, 7, 4, 5, 7]

var stringArray = ["Apple", "Swift", "iOS", "Hello"]


// 배열의 타입 표기

// 정식문법

let strArray1: Array<Int> = []


// 단축문법
let strArray2: [String] = []

// 빈 배열의 생성

let emptyArray1: [Int] = []

let emptyArray2 = Array<Int>()

let emptyArray3 = [Int]()

// 배열의 기본 기능

numsArray1.count

numsArray.isEmpty

numsArray.contains(1)   //파라미터로 값을 전달

numsArray.contains(8)


numsArray.randomElement()


numsArray.swapAt(0, 1)

// 배열의 각 요소(element)에 대한 접근

numsArray = [1, 2, 3, 4, 5]   // 배열 리터럴

stringArray = ["Apple", "Swift", "iOS", "Hello"]


// [] 서브스크립트 문법(대괄호를 이용한 특별한 함수)

stringArray[0]

stringArray[1]

stringArray[2]

stringArray[3]




stringArray[1] = "Steve"

print(stringArray)



stringArray.first   // 리턴값 String?  ====> 빈 배열이라면 nil 리턴
stringArray.last


// 배열의 시작 인덱스
stringArray.startIndex

stringArray.endIndex
//stringArray.endIndex.advanced(by: -1)


stringArray[stringArray.startIndex]

stringArray[stringArray.endIndex - 1]
//stringArray[stringArray.index(before: stringArray.endIndex)]



//stringArray.index(<#T##i: Int##Int#>, offsetBy: <#T##Int#>)



stringArray.firstIndex(of: "iOS")     // 앞에서 부터 찾았을때 "iOS"는 배열의 (앞에서부터) 몇번째

stringArray.lastIndex(of: "iOS")     // 뒤에서 부터 찾았을때 "iOS"는 배열의 (앞에서부터) 몇번째



if let index = stringArray.firstIndex(of: "iOS") {
    print(index)
}
