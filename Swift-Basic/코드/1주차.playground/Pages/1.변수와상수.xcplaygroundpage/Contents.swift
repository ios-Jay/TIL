import UIKit

//: # 변수와 상수

//: ---

/*: ## 1) 변수(Variables)
 
 * 변수의 의미: 변할 수 있는 데이터(자료)를 담을 수 있는 메모리 공간(바구니)
 ---
 */

//:> 프로그램 동작의 첫번째 단계 ➞ 메모리에 값(데이터)을 저장 (변수)
// 변수(mutable): 값이 변경 가능한

// 변수를 선언하면서 저장

var num1 = 3

var num2 = 9

num2 = 12

num2 = num2 + 6

print(num2)

var num = num1 + num2


print(num)



// 변수를 여러개 한꺼번에 선언하는 방법: ,(콤마)로 연결:콤마를 통해서도 선언할 수 있다는 뜻.

var x = 1, y = 3, z = 5

// 새로운 공간을 만들고 값을 복사(Copy)해서 저장: 바인딩

var k = x + y + z


/*:
 ---
  - 변수의 이름 / 이름 짓기 규칙
 
---
 
 */
// 변수의 이름은 소문자로 시작(대문자로 시작하는 것은 권장하지 않음)

// 중간에 숫자들어가는 것은 Ok. (숫자를 첫글자로 시작하는 것은 금지)

// 특수문자, 한자, 한글 등 사용가능 하지만, 관습적으로 잘 사용하지는 않음

var myPosition: String = "포워드"

var myUniformNumbers: Int = 10

var π = 3.1415926

var 你好 = "你好世界"

var 🐶🐮 = "dogcow"

var 변수 = "안녕하세요"





/*:---
 - 변수는 실제로 어떻게 사용이 될까?
 ---
 */
var playerName = "손흥민"

let playerNationalTeam = "대한민국"

var playerClub = "토트넘 핫스퍼"

let uniformNumber = 7

var activityLevel: Double = 12.5

// 문자열 보간법(String Interporation)

// "\(삽입할변수)" ➡︎ 문자열 중간에 삽입할때 사용


print("이 선수의 국적은 \(playerNationalTeam) 입니다.")

print("\(playerName) 선수는 \(playerClub)에서 뛰고 있으며 등번호는 \(uniformNumber)번입니다. 오늘 \(playerName) 선수는 총 \(activityLevel)km의 활동량을 기록했습니다.")


print(playerName, playerClub)


//:> String Interpolation(스트링 인터폴레이션): 문자열 보간법

/*: ## 2) 상수(Constants)
 - 상수의 의미: 변하지 않는 데이터(자료)를 담을 수 있는 메모리 공간(바구니)
 ---
 */
// 상수(immutable): 값이 변경 불가능한

let koreanFootballPlayer: String = "이강인"


// koreaFootballPlayer = "뎀벨레"

// → 변하지 않는 데이터이므로 당연히 에러 발생

print(koreanFootballPlayer)


// 변수와 상수를 통틀어, 변수(저장된 데이터라는 관점에서)라고 일반적으로 부르기도 함

/*: ## 변수 선언의 정식문법
 - 변수의 선언과 저장
 ---
 */
var number: Int = 10


// 변수를 선언하면서 저장. 메모리 공간을 먼저 생성하는 동시에 데이터를 저장


