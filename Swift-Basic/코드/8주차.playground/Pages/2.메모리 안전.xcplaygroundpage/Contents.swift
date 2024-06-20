import UIKit

/*: # 메모리 안전
 ---
 */
/*: ## 메모리 안전(Memory Safety)의 개념
 - 메모리 접근에 대한 충돌(confilct) 이해하기
 ---
 */

//:> 멀티쓰레드(Multi Thread)의 환경에서만 메모리 충돌이 일어나는건 아님

var stepConflict = 1


// 변수 stepConfilt에 장기적인 쓰기 접근 (입출력 파라미터)
func increment(_ number: inout Int) {
    number += stepConflict    // 변수 stepConfilt에 읽기 접근  // number = number + stepConflict
}

//increment(&stepConflict)   // 메모리에 동시접근으로 인한 문제 발생가능





/**=================================
 - 위와 같은 문제는 다른 변수를 만들어서 해결
 ===================================**/


var stepSize = 1
var copyOfStepSize = stepSize    // 명시적으로 복사본 변수를 만들어서 해결


// 변수 stepSize에 장기적인 쓰기 접근 (입출력 파라미터)
func incrementing(_ number: inout Int) {
    number += stepSize         // 변수 stepSize에 읽기 접근       // number = number + stepSize
}



incrementing(&copyOfStepSize)


// 원본을 다시 바꾸기 ⭐️
stepSize = copyOfStepSize




/*:
 ---
 * 동일한 함수의 여러 '입-출력 매개변수'로 단일 변수를 전달하는 것도 에러
 ---
 */

func balance1(_ x: inout Int, _ y: inout Int) {  // 평균값 설정하는 함수
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30


// 입출력 파라미터로 동일한 변수를 전달하고 있음
//balance(&playerOneScore, &playerOneScore)   // 에러 발생 ⭐️


balance1(&playerOneScore, &playerTwoScore)   // 에러 발생하지 않음

//: ---

/*:
 ## 구조체의 인스턴스에서의 메모리 안전
 * 메서드에서 self에 대한 접근
 ---
 */
func balance(_ x: inout Int, _ y: inout Int) { // 평균값 설정하는 함수
    let sum = x + y
    x = sum / 2
    y = sum - x
}



/**======================================================
 - 구조체 등의 메서드에서 self(동일한 인스턴스)에 접근하는 경우 접근 충돌
 - 값 타입은 속성 하나가 아닌, 인스턴스 전체에 대한 읽고/쓰기로 접근 ⭐️
 ========================================================**/


// 구조체 정의
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    // 타입 속성
    static let maxHealth = 10
    
    // health값을 바꾸는 메서드 (self.health에 접근)
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

// 확장
extension Player {
    // 자신의 체력과, 동료의 체력을 공유해서 평균 설정
    mutating func shareHealth(with teammate: inout Player) {   // 메모리 장기적 접근
        balance(&teammate.health, &health)
    }
}


var mario = Player(name: "마리오", health: 10, energy: 10)
var luigi = Player(name: "루이지", health: 5, energy: 10)



// "마리오"와 "루이지"의 체력을 공유
mario.shareHealth(with: &luigi)   // 괜찮음


// "마리오"와 "마리오"의 체력을 공유하려면 에러 ⭐️
//mario.shareHealth(with: &mario)




/*:
 ---
 * 속성에 대한 접근 충돌의 예시
 ---
 */
// 튜플 만들기
var playerInformation = (health: 10, energy: 20)

// 튜플에 대한 동시접근 문제
//balance(&playerInformation.health, &playerInformation.energy)





// 새로운 플레이어 생성
var yosi = Player(name: "요시", health: 10, energy: 10)

// 하나의 인스턴스(요시)의 체력과 에너지를 평균만들려고 하면?
//balance(&yosi.health, &yosi.energy)   // 에러 발생


// 전역이 아닌 "지역 변수"로 만들어서 접근하는 것은 괜찮음
func someFunction() {
    var yosi2 = Player(name: "요시2", health: 10, energy: 10)
    balance(&yosi2.health, &yosi2.energy)   //
}

// 컴파일러가 안전하다는 것을 판단





