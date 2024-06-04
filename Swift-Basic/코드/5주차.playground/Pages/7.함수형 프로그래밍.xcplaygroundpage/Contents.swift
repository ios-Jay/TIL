import UIKit
/*: ## 참고)함수형 프로그래밍
 - 함수형 프로그래밍(Functional Programming)이란?
 ---
 */

//:> 명령형 프로그래밍

// 배열의 합을 구하는 문제 - 어떻게(how) 구현해낼까?

let numbers = [1, 2, 3]

var sum = 0

for number in numbers {
    
    sum += number
}

print(sum)



//:> 함수형 프로그래밍(선언형)


let newNnumbers = [1, 2, 3]

var newSum = 0


// 기존의 함수를 어떻게 조합해서 결과(what)를 만들까?

newSum = newNnumbers.reduce(0) { $0 + $1 }

print(newSum)



/**=======================================================================
 
 [함수형 프로그래밍]
 
 - 함수를 이용해서, "사이드 이펙트(부작용)가 없도록" 선언형으로 프로그래밍 하는 것
 
   (함수형 프로그래밍은 결과를 도출하기 위해 "함수"를 사용하는 것에 지나지 않음)

 - 산에 올라가는 방법은
 
   1)"산을 걸어서 올라가는 방법"(명령형)  vs  2) "헬리콥터에서 정상에서 내리는 방법"(함수형)
 
 [함수형/선언형]
 - 개발자는 중간과정을 신경쓰지 않고,
 
 - 이미 정의된 함수를 가지고 "어떻게 조합해서 결과를 만들어 낼까"만 신경쓰면 됨
 
 - ==> 모두가 map/filter/reduce의 쓰는 방법을 알고 있기 때문

 - 간결한 코드 작성이 가능해짐 ⭐️
 
 - SwiftUI에서 사용하는 방식 ⭐️(UIKIT에서 사용하는 방식: 명령형 프로그래밍)
 
==========================================================================**/



// 위의 배열 중에, 홀수만 제곱해서, 그 숫자를 다 더한 값은?

var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



var newResult = numbersArray
                        .filter { $0 % 2 != 0 }
                        .map { $0 * $0 }
                        .reduce(0) { $0 + $1 }

print(newResult)





// 추가 참고자료

// https://youtu.be/jVG5jvOzu9Y   (함수형 프로그래밍이 뭔가요? - 얄팍한 코딩사전)

// https://youtu.be/HZkqMiwT-5A   (함수형 프로그래밍이 뭐하는 건가요? - 곰튀김 님)

// https://youtu.be/cXi_CmZuBgg   (Functional Reactive Programming 패러다임 - 곰튀김 님)
