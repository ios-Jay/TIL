import UIKit

/*: # 고차함수
 ---
 */

/*: ## 1)기본 고차함수 3가지
 - 고차함수(Higer-order Function)란?
 ---
 */

/**==========================================================
 
 - 고차원의 함수
 
 - 함수를 파라미터로 사용하거나, 함수실행의 결과를 함수로 리턴하는 함수


 - 일반적으로 함수형 언어를 지향하는 언어들에 기본적으로 구현되어 있음
 
 - 아래의 3가지 함수를 다룸

 - 1) map 함수
 
 - 2) filter 함수
 
 - 3) reduce 함수

 - (추가적으로: forEach, compactMap, flatMap)


 - Sequence, Collection 프로토콜을 따르는 컬렉션(배열, 딕셔너리, 세트 등)
 
   에 기본적으로 구현되어 있는 함수
 
 - (Optional타입에도 구현되어 있음)
 
 ============================================================**/

/*:
 ---
 * 1 - map함수
 ---
 */
/**====================================================
 
 - 기존 배열 등의 각 아이템을 새롭게 매핑해서(매핑방식은 클로저가 제공)
 
   새로운 배열을 리턴하는 함수
 
 - (각 아이템을 매핑해서, 변형해서 새로운 배열을 만들때 사용)
 
 ======================================================**/


let numbers = [1, 2, 3, 4, 5]

// numbers.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)

// 클로저 (Int) -> String

var n = numbers.map { number in
    
    return " 숫자: \(number)"
}

print(n)

var n1 = numbers.map { number1 in
    
    return number1 * 1000
}

print(n1)



var newNumbers = numbers.map { (num) in
    
    return "숫자: \(num)"
}

// 파라미터, 리턴 생략 가능

newNumbers = numbers.map { "숫자: \($0)" }


// print(numbers)

// print(newNumbers)   // ["숫자: 1", "숫자: 2", "숫자: 3", "숫자: 4", "숫자: 5"]

var alphabet = ["A", "B", "C", "D"]


//names.map(<#T##transform: (String) throws -> T##(String) throws -> T#>)

var s = alphabet.map { str in // 파라미터
    
    return str + "!" // 구현할 코드
}


var newAlphabet = alphabet.map { (name) -> String in
    return name + "'s good"
}


// print(alphabet)

// print(newAlphabet)




/*:
 ---
 * 2 - filter함수
 ---
 */
/**====================================================
 
 - 기존 배열 등의 각 아이템을 조건(조건은 클로저가 제공)을
 
   확인후, 참(true)을 만족하는 아이템을 걸러내서 새로운 배열을 리턴
 
 - (각 아이템을 필터링해서, 걸러내서 새로운 배열을 만들때 사용)
 
 ======================================================**/


let names = ["Apple", "Black", "Circle", "Dream", "Blue"]

// names.filter(<#T##isIncluded: (String) throws -> Bool##(String) throws -> Bool#>)



var strBox = names.filter { str in
    
    return str.contains("B")
    
}

print(strBox)

var newNames = names.filter { (name) -> Bool in
    return name.contains("B")
    
}


print(newNames)






let array = [1, 2, 3, 4, 5, 6, 7, 8]


//array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)


var evenNumersArray = array.filter { num in
    return num % 2 == 0
}

evenNumersArray = array.filter { $0 % 2 == 0 }

print(evenNumersArray)


// 함수로 전달해보기

//func isEven(_ i: Int) -> Bool {
//    return i % 2 == 0
//}


//let evens = array.filter(isEven)

var ccc = [2,4,6,8].filter { num in
    
    return num < 5
    
}

print(ccc)

evenNumersArray = array.filter { $0 % 2 == 0 }.filter { $0 < 5 }

print(evenNumersArray)




/*:
 ---
 * 3 - reduce함수
 ---
 */
/**====================================================
 
 - 기존 배열 등의 각 아이템을 클로저가 제공하는 방식으로 결합해서
 
   마지막 결과값을 리턴(초기값 제공할 필요)
 
 - (각 아이템을 결합해서 단 하나의 값으로 리턴)
 
 ======================================================**/


var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//numbersArray.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)

var ddd = numbersArray.reduce(0) { a, b  in
    
    return a + b
}

// 0(a) + 1(b)

// 1(a) + 2(b)

// 3(a) + 3(b)

// 6(a) + 4(b)

// ...

// 45(a) + 10(b) => 55



var resultSum = numbersArray.reduce(0) { (sum, num) in
    
    return sum + num
}

print(resultSum)



resultSum = numbersArray.reduce(100) { $0 - $1 }

print(resultSum)

"0" + "1"

"01"

"01" + "2"

"012"

"01234567890"

var eee = numbersArray.reduce("0") { result, item in
    
    return result + String(item)
}

print(eee)
/*:
 ---
 * map / filter / reduce의 활용 ⭐️
 ---
 */
numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 위의 배열 중에, 홀수만 제곱해서, 그 숫자를 다 더한 값은?


var fff = numbersArray.filter { num in
    
    return num % 2 != 0
}.map { num in
    return num * num
}.reduce(0) { first, item in
    return first + item
}

print(fff)


 
// var fff = numbersArray.filter { $0 % 2 != 0 }.map { $0 * $0 }.reduce(0) { $0 + $1 }


var newResult = numbersArray
                        .filter { $0 % 2 != 0 }
                        .map { $0 * $0 }
                        .reduce(0) { $0 + $1 }

print(newResult)


// 1, 9, 25, 49, 81 ===> 165





/*:
 ## 2) 기타 고차함수
 * 4 - forEach함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 활용해서
   각 아이템별로 특정 작업(작업 방식은 클로저가 제공)을 실행
 - (각 아이템을 활용해서 각각 특정 작업을 실행할때 사용)
 ======================================================**/


let immutableArray = [1, 2, 3, 4, 5]

// 보통 프린트를 많이 사용한다.

//immutableArray.forEach { <#Int#> in
//
//    <#code#>
//}


immutableArray.forEach { num in
    print(num)
}

immutableArray.forEach { print("숫자: \($0)") }





/*:
 ---
 * 5 - compactMap함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 새롭게 매핑해서(매핑방식은 클로저가 제공)
   변형하되, 옵셔널 요소는 제거하고, 새로운 배열을 리턴
 - (map + 옵셔널제거)
 - 옵셔널은 빼고, 컴팩트(compact)하게
 - (옵셔널 바인딩의 기능까지 내장)
 ======================================================**/

// 자동으로 옵셔널을 벗김



let stringArray: [String?] = ["A", nil, "B", nil, "C"]


var newStringArray = stringArray.compactMap { $0 }
print(newStringArray)



let numbers1 = [-2, -1, 0, 1, 2]

[nil, nil, 0, 1, 2]


var positiveNumbers = numbers1.compactMap { $0 >= 0 ? $0 : nil }

print(positiveNumbers)

// 사실 이런 경우는 filter로 가능

//numbers1.filter { $0 >= 0 }



// compactMap은 아래와 같은 방식으로도 구현 가능

newStringArray = stringArray.filter { $0 != nil }.map { $0! }

print(newStringArray)





/*:
 ---
 * 6 - flatMap함수
 ---
 */
/**====================================================
 
 - 중첩된 배열의 각 배열을 새롭게 매핑해서(매핑방식은 클로저가 제공)
 
 - 내부 중첩된 배열을 제거하고 리턴
 
 - (중첩배열을 flat하게 매핑)
 
 ======================================================**/


var nestedArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

print(nestedArray.flatMap { $0 })






var newNnestedArray = [[[1,2,3], [4,5,6], [7, 8, 9]], [[10, 11], [12, 13, 14]]]

var numbersArray1 = newNnestedArray
                            .flatMap { $0 }
                            .flatMap { $0 }

print(numbersArray1)
