import UIKit

// Switch문: 표현식 / 변수를 (매칭시켜) 분기처리할때 사용하는 조건문

// if 문보다 한정적인 상황에서 사용

var choice: String = "바위"


// 조건을 부등식이 아닌 "=="와만 비교

// 변수가 어떤값을 가지냐에 따라 실행문을 선택하고 진행




switch choice {   // 변수(표현식)
case "가위":       // "가위" == "가위"
    print("가위입니다.")
case "바위":
    print("바위입니다.")
case "보":
    print("보 입니다.")
default:
    break
}

/**=======================================================
 [스위치문의 특징]
 
 - 1) 스위치문에서 케이스의 ,(콤마)는 또는의 의미로 하나의 케이스에
      여러 매칭값을 넣을 수 있음
 
 - 2) switch 문은 (비교하고 있는)값의 가능한 모든 경우의 수를 반드시
      다루어야 함 (exhaustive: 하나도 빠뜨리는 것 없이 철저한)
      모든 사례를 다루지 않았을 때에는 디폴트 케이스가 반드시 있어야 한다.
 
 - 3) 각 케이스에는 문장이 최소 하나 이상 있어야 하며 만약 없다면 컴파일
      에러 발생(의도하지 않은 실수를 방지 목적)
      실행하지 않으려면, break를 반드시 입력해야함 (if문에서는 실행문을
      입력안해도 괜찮지만, 스위치문에서는 필요함)
 
=========================================================**/


var isTrue = true


switch isTrue {
case true:
    print("true")
case false:
    print("false")
}

// Switch문의 범위 매칭:패턴 매칭 연산자와 관련

var age = 33

switch age {
case 10...19: // 비교 연산자가 아닌 범위 연산자를 사용해야 함
    print("10대입니다.")
case 20...29:
    print("20대입니다.")
case 30...39:
    print("30대입니다.")
default:
    break
}





// 비교연산자와 값을 넣으면 안되고, 비교하려는 값이 와야함

//switch temperature {
//case  < 0 :    //이런식으로 작성하면 안된다. ==>   ..<0
//    print("영하 - 0미만")
//case >= 0 && <= 18 :     //이런식으로 작성하면 안된다. ==>   0...
//    print("0이상 무덥지 않은 날씨")
//default :
//    break
//}





var num1 = 30


switch num1 {
case 0...50:      // 0...50 ~= 30 내부적으로 패턴매칭으로 확인
    print("숫자의 범위: 0 ~ 50")
case 51...100:
    print("숫자의 범위: 51 ~ 100")
default:
    print("그 외의 범위")
}



var temperature = 19

switch temperature {
case ..<0:
    print("영하 - 0도 미만")
case 0...18:
    print("0도 이상 무덥지 않은 날씨")
case 19...:
    print("여름 날씨")
default:
    break
}


//... ->범위 연산자:범위를 나타내는 연산자 ex) 0..100 ->0부터 100까지의 정수 범위를 나타냄
//~= ->패턴 매칭 연산자:범위 연산자에 대한 참 거짓을 알려주는 연산자
// ex) var num = 77
//0..100 ~= num


// 즉석에서 만들어 본 가위 바위 보 게임


var choice1: Int = Int.random(in: 0...2)



 switch choice1 {
case 0:
    print("가위입니다.")
case 1:
     print("바위입니다.")
 case 2:
     print("보자기입니다.")
 default:
     break
}

var choice2: Int = Int.random(in: 0...2)


switch choice2 {
case 0:
    print("가위입니다.")
case 1:
     print("바위입니다.")
 case 2:
     print("보자기입니다.")
 default:
     break
}

if choice1 == 0 && choice2 == 1 {
    print("2번이 승리하였습니다.")
} else if choice1 == 0 && choice2 == 2 {
    print("1번이 승리하였습니다.")
} else if choice1 == 1 && choice2 == 0 {
        print("1번이 승리하였습니다.")
    } else if choice1 == 1 && choice2 == 2 {
        print("2번이 승리하였습니다.")
    }
else if choice1 == 2 && choice2 == 0 {
    print("2번이 승리하였습니다.")
} else if choice1 == 2 && choice2 == 1 {
    print("1번이 승리하였습니다.")
}
 else if choice1 == choice2 {
    print("비겼습니다.")
}
