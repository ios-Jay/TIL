import UIKit

// 2) while문

// while문의 기본 형태

var sum = 0
var num = 1

while num <= 50 {   // 조건이 만족하는 동안 계속 반복
    sum += num
    num += 1      // 이런 조건이 필요 (위의 조건식을 변화시키지 않으면 무한 반복하게됨)
}


print("총 합의 출력: ", sum)

// 조건을 주의해서 짜야함


/**============================================================
 
 for문과 비교
 
 - 1) 반복이 시작되기 전에, 반복 횟수가 정해져 있지 않을때 사용 (조건에 의해 반복)
 
 - 2) 조건이 거짓이 될 때까지 일련의 명령문 수행
 
     (반드시 while문 내부에서 조건을 변화시키는 일이 일어나야함)
 
==============================================================**/


