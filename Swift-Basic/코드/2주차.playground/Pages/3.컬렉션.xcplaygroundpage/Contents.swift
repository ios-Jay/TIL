import UIKit

/*: # 컬렉션(Collection)
 
 
 */

/*: ## 1) 배열(Array)
 - 데이터를 순서대로 저장하는 컬렉션 (자동으로 순번 지정됨)
 ---
 */
/**==============================================================
 
 컬렉션의 의미:데이터 바구니
 
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

