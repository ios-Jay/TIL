import UIKit

/**==================================================================
 [1번 문제]
  - 아래 정수형의 num 변수와, (문자열 배열의) array 변수가 있어요.
    어떻게 해야, 100가지의 랜덤숫자를 이용해서 배열에서 넘치지 않고, 범위의 에러 없이
    배열 내부의 값을 꺼낼 수 있을까요?
    (아래처럼 범위가 넘치지 않고 반복 되도록 배열의 요소에 접근할 수 있는 방법을 제시)
    "Hello" -> "Jobs" -> "Swift" -> "Cook" -> "Hello"
    (힌트: 나머지 값은 때로는 아주 유용합니다.)
 ===================================================================**/


var num = Int.random(in: 1...100)

var array = ["Hello", "Jobs", "Swift", "Cook"]

var result = array[num % 4]

print(result)

// var result = array[num % array.count]

// print(result)





/**==================================================================
 [2번 문제]
  - 삼항 연산자를 사용해서 "성공"과 "실패"를 출력하는 코드를 만들어 보세요.
    (삼항 연산자는 "?"와 ":"를 사용하는 문법)
    number의 변수의 랜덤 숫자가 70점 이상이면 "성공"을 출력
    number의 변수의 랜덤 숫자가 70점 미만이면 "실패"를 출력
 ===================================================================**/


var number = Int.random(in: 50...100)

var isSuccess = number >= 70 ? "성공" : "실패"

print(isSuccess)





/**==================================================================
 [3번 문제]
  -  아래의 반복문을 사용해서, 1부터 20사이의 숫자 중에서 2의 배수를 출력하는 코드를 완성하세요.
 ===================================================================**/


for num in 1...20 {
    
    if num % 2 != 0 {
        
        continue
        
    }

     print("2의 배수: \(num)")
    
}


for num in 1...20 {
    
    if num % 2 == 0 {
        
        print("2의 배수: \(num)")
    }
}

