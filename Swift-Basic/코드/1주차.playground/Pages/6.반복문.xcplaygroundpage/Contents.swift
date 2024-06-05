import Foundation

/*: # 반복문(Loops)
 
 */

/*: ## 프로그래밍의 기본 원리
 
 - 모든 프로그래밍은 아래의 세가지 논리로 이루어 진다.
 
 1. 순차
 
 2. 조건
 
 3. 반복
 
 
 */

/*: ----
 - 반복문의 종류
 ----
 */
/**====================
 
 - 1) For 반복문
 
 - 2) While 반복문
 
 (1) while
 
 (2) repeat-while
 
 =======================**/


/*: ## 1) For문
 - for문의 기본 형태
 ---
 */
// 스위프트 스타일의 문법은 직관적이고 쉽게 작성이 가능하도록 되어있음

for index in 1...5 {
    
    /*
     
     let index = 1,
     
     let index = 2,
     
     let index = 3,
     
     let index = 4,
     
     let index = 5
     
     */
    
    
    print("For문 출력해보기: \(index)")
}

for index in 1...4 {
    
    print("\(index)에 5를 곱하면 \(index * 5)")
    
}

// 이런 방식으로 많이 활용

var number = 10


for i in 1...number {
    
    print(i)
    
}

/*:---
 - 참고) 와일드 카드 패턴
 ---
 */

//:> 와일드 카드 패턴 _ (언더바)은 스위프트에서 생략의 의미!
// _(under bar):생략의 의미


for _ in 0...10 {
    
    print("hello")
}


let _ = "문자열"


(1...10).reversed()



let a = (1...10).reversed()

print(a)

/*:---
 - 배열 등 컬렉션 타입에서도 사용 가능
 ---
 */

// 컬렉션에서 각 아이템을 차례 차례 한번씩 뽑아서 중괄호 안에서 사용


let list = ["Swift", "Programming", "Language"]


for str in list {
    
    print(str)
}


/*: ---
 - 문자열에서도 사용 가능
 ---
 */
// 문자열에서 각 문자를 차례 차례 한개씩 뽑아서 중괄호 안에서 사용

for chr in "Hello" {
    
    print(chr)
    
    // print(chr, terminator: " ")     // 다음줄로 넘어가지 말고, 한칸을 띄워라
}

/*: ---
 - 특정한 함수 활용 가능
 ---
 */
// 역순으로 바꾸기

for number in (1...5).reversed() {
    
    print(number)
}




// 홀수 또는 홀수만 뽑아내기

for number in stride(from: 1, to: 15, by:2) {
    
    //마지막 숫자는 포함하지 않음
    
    print(number)
}


//:> Stride: 성큼성큼 걷다.
let range = stride(from: 1, to: 15, by: 2)

//  StrideTo<Int>

print(range)

// 1, 3, 5, 7, 9, 11, 13

for i in range {
    
    print(i)
    
}


let range1 = stride(from: 1, through: 15, by: 2)

// StrideThrough<Int>

print(range1)

// 1, 3, 5, 7, 9, 11, 13, 15

for i in range1 {
    
    print(i)
}



let range2 = stride(from: 10, through: 2, by: -2)

//   StrideThrough<Int>

print(range2)

// 10, 8, 6, 4, 2


for i in range2 {
    
    print(i)
}

/*: ## 2) for문 주의점
 - for문에서 선언하는 변수(상수)에 대한 정확한 이해
 ---
 */
/**====================================================
 
 for문의 임시 상수
 
 - 1) for문이 진행되는 동안 사용이 되는 임시적인 상수(let)이다. (정확한 용어로 반복상수)
 
 - 2) for문에서 선언하는 변수(상수)는 for문 내에서만 사용이 가능하다.
 
 ======================================================= **/


var name = "홍길동"

for name in 1...5 {
    
    /*
     
     이 name은 범위랑 가장 가까이 있는,
     
     가장 가까이에 선언된 반복 상수 name을 출력한다.
     
     그래서 이 반복문에서는 이 for문 내에 있는 반복상수 name을 출력한다.
     
     위에 선언된 변수 name이 아니라
     
     */
    
    print(name)
}

for n in 1...5 {
    
    // name이 아닌 n이라고 다르게 선언함으로서 변수 name을 출력할 수 있다.
    
    print(name)
    
}

// print(n)


/**===================================================
 
 일반적인 변수 (범위 - 스코프)
 
 - 1) for문 내부에서는 외부에 선언된 변수에는 접근이 가능하다.
 
 - 2) for문 내부에서 새롭게 선언한 변수에는 외부에서 접근이 불가능하다.
 
 ======================================================**/

var sum = 0

for i in 1...10 {
    
    sum += i
    
}

print(sum)

/*
 
 sum += 1 == sum = sum + 1(복합할당연산자)
 
 sum = 0 + 1
 
 sum = 1 + 2
 
 sum = 3 + 3...
 
 sum = 45 + 10
 
 */

for index in 1...5 {
    
    print("For문 출력해보기: \(index)")
    
    print(name)
    
    var realName = "잡스"
    
    print(realName)
}


// print(realName)



/*: ## 3) While문
 - While문의 기본 형태
 ---
 */
var sum1 = 0

var num = 1

while num <= 50 {
    
    // 조건이 만족하는 동안 계속 반복
    
    sum1 += num
    
    num += 1
    
    // 1. sum = 0 + 1, num = 1 + 1, sum == 1
    
    // 2. sum = 1 + 1, num = 2 + 1, sum == 3
    
    // 3. sum = 3 + 3, num = 3 + 1, sum == 6
    
    // 4. sum = 6 + 4, num = 4 + 1, sum == 10
    
    // 5. sum = 10 + 5, num = 5 + 1, sum == 15
    
    // 6. sum = 15 + 6, num = 6 + 1, sum == 16
    
    // ...
    
    // 이런 조건이 필요 (위의 조건식을 변화시키지 않으면 무한 반복하게됨)
}

print("총 합의 출력: \(sum1)")

// 조건을 주의해서 짜야함

//:> 무한반복(루프)을 주의


/**============================================================
 
 for문과 비교
 
 - 1) 반복이 시작되기 전에, 반복 횟수가 정해져 있지 않을때 사용 (조건에 의해 반복)
 
 - 2) 조건이 거짓이 될 때까지 일련의 명령문 수행
 
 (반드시 while문 내부에서 조건을 변화시키는 일이 일어나야함)
 
 ==============================================================**/


/*: ## 4) repeat-While문
 - repeat-While문의 기본 형태
 ---
 */
var i = 1

repeat {
    
    print("\(3) * \(i) = \(3 * i)")
    
    i += 1
    
} while i <= 9





// 일단 한번은 실행하고 나서, 조건을 판단해서 실행

// (조건(Condition)이 마지막에 있음)

// 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가

// (스위프트 이외의) 다른 언어에서는 do - while 문으로 명명


/*:---
 - while문과 repeat-While문의 차이
 ---
 */
// 미세한 차이가 생길 수 있으므로 주의해서 사용해야 함


var number1 = 5

var sumOfNum = 0


while number1 < 5 {
    
    sumOfNum += number
    
    number += 1
    
}

number      // 5

sumOfNum    // 0

// repeat-while문은 코드를 먼저 실행한 다음 조건을 확인

number = 5

sumOfNum = 0

repeat {
    
    
    sumOfNum += number
    
    number += 1
    
} while number < 5

number      // 6

sumOfNum    // 5

/*: # 제어전송문
 - 반복문에서 쓰이는 제어전송문(Control Transfer Statement)
 */

/*: ## 1) Continue
 - continue의 사용
 ---
 */

//:> 반복의 지금 주기는 끝내고 다음 주기로 이어서 간다는 뜻
for num in 1...20 {
    
    if num % 2 == 0 {
        
        // num == 2의 배수
        
        continue
        
    
        
    }
    
    // 1일 경우 if문이 거짓이므로 continue를 만나지 않고 바로 프린트문으로 넘어감
    
    // 2일 경우 if문이 참이므로 continue를 만나면서 프린트문을 실행시키지 않고 다음 주기로 넘어감
    
    // 따라서 2의 배수는 출력이 될 수 없고, 홀수들만 출력이 됨
    
    print(num)
}


/*: ## 2) break
 - break의 사용
 ---
 */

//:> 반복문을 종료시킨다는 뜻
for num in 1...20 {
    
    if num % 2 == 0 {
        
        break
        
    }
    
    print(num)
}
/*:---
 - 주의할점 - 중첩 사용시의 적용 범위
 ---
 */
for i in 0...3 {
    
    print("Outer \(i)")
    
    for j in 0...3 {
        
        if i > 1 {
            
            print("j", j)
            
            continue
            
            // contiue: 진행시켜라, 넘어가라, 이 중괄호를 넘어 다음 문장을 실행시키라는 뜻
        }
        
        print("Inner \(j)")
    }
}




/*: # 연습문제
 */

/*:---
 - 구구단 출력해보기
 ---
 */
for i in 2...9 {
    for j in 2...9 {
        print("\(i) X \(j) = \(i*j)")
    }
}

/*:---
 - 배수 구해서 출력해보기: 3의 배수 구하기
 ---
 */
for i in 1...100 {
    
    if i % 3 == 0 {
        print("3의 배수 출현: \(i)")
    }
}


for i in 1...100 {
    
    if i % 3 != 0 {
        
        continue
    }
    
    print("3의 배수 출력: \(i)")
}


/*:---
 - 이모티콘 출력해보기
 ---
 */
print("😄")
print("😄😄")
print("😄😄😄")
print("😄😄😄😄")
print("😄😄😄😄😄")


for _ in 1...5 {
    
    print("😄")
    
}



for i in 1...5 {
    
    print("😄", terminator: "")
    
}

for i in 1...5 {
    
    for j in 1...5 {
        
        if i >= j {
            
            print("😄", terminator: "")
            continue
        }
        
        
        
    }
    print()
}
