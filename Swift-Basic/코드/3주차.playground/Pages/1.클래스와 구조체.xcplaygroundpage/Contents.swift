import UIKit

/*: # 클래스와 구조체
 
 */

/*:
 ## 1) 클래스(Class)
 - 클래스의 정의와 객체의 생성: 어떤 하나의 '틀(형태)'을 찍어 내는 것. 붕어빵 틀 만들기
 ---
 */
 class Squard {  // 타입(사용자 정의 타입)이므로 대문자 사용
    
    var playerName = "페드리"
    
    var playerUniformNumber = 8
    
    
    func run() {
        
        
        print("\(playerName)가 달립니다.")
    }
    
    func profile() {
        
        print("\(playerName) 선수의 등번호는 \(playerUniformNumber)입니다.")
    }
}

// 붕어빵 찍어내기 (객체의 생성)

var fcBarcelonaSquard = Squard()

// 클래스 내부에 있는 변수를 '속성(Property)' 라고 한다. 모든 프로그래밍에서 동일

// 클래스 내부에 있는 함수를 '메서드(Method)' 라고 한다.

// 객체의 속성에 접근


fcBarcelonaSquard.playerName

fcBarcelonaSquard.playerName = "가비"

fcBarcelonaSquard.playerName

fcBarcelonaSquard.playerUniformNumber

fcBarcelonaSquard.run()

fcBarcelonaSquard.profile()

// 붕어빵 찍어내기 (객체의 생성)

var koreaNationalTeam = Squard()

// 객체의 속성에 접근


koreaNationalTeam.playerName = "설영우"

koreaNationalTeam.playerUniformNumber = 66

koreaNationalTeam.profile()

koreaNationalTeam.run()

koreaNationalTeam.playerName = "배준호"


/*: ## 2) 구조체(Struct)
 - 구조체의 정의와 instance의 생성
 ---
 */
// 붕어빵틀 만들기


struct NationalTeam {
    
    var nation: String = "대한민국"
    
    var worldRanking: Int = 23
    
    
    func nationalTeam() {
        
        print("이 선수의 국적은 \(nation)입니다.")
    }
    
    
    
}

// 붕어빵 찍어내기 (인스턴스의 생성)

var koreaTeam: NationalTeam = NationalTeam()

// 인스턴스의 속성에 접근

koreaTeam.nation

koreaTeam.worldRanking

koreaTeam.nationalTeam()


/*: ---
 - 클래스와 구조체
 ---
 */
/**=========================================================
 
 - 클래스와 구조체 모두 메모리에 찍어낸 것을 인스턴스(instance)라고 함
 
 - 인스턴스 예시: 카카오톡 친구목록
 
 - 인스턴스는 실제로 메모리에 할당되어 구체적 실체를 갖춘 것이라는 의미
 
 - 스위프트에서는 클래스의 instance를 특별히 객체(object)라고 부름
 
 - 클래스의 인스턴스(객체):클래스의 인스턴스만 '객체' 라고 부른다.
 
 - 구조체의 인스턴스
 
 - 열거형의 인스턴스
 
 
 - ⭐️ 가장 큰 차이는 메모리 저장 방식의 차이 ⭐️(중요)
 
 - 1) 구조체
 
 - 값 형식(Value Type)
 
 - 인스턴스 데이터를 모두 스택(Stack)에 저장
 
 - (복사시) 값을 전달할 때마다 복사본을 생성 (다른 메모리 공간 생성)
 
 - 스택(Stack)의 공간에 저장, 스택 프레임 종료시, 메모리에서 자동 제거
 
 - 힙의 영역에서 찍어 내지 않는다.
 
 - 데이터 영역에 구조체의 원형이 존재하고, 실제로 만들어낸 데이터가 스택에 저장된다.
 
 -  스택의 영역에 저장된다는 뜻은 함수가 실행되는 동안에만 존재한다는 뜻이다.
 
 - 2) 클래스
 
 - 참조 형식(Reference Type)
 
 - 인스턴스 데이터는 힙(Heap)에 저장, 해당 힙을 가르키는 변수는 스택에 저장하고
 
 - 메모리 주소값이 힙(Heap)을 가르킴
 
 - (복사시) 값을 전달하는 것이 아니고, 저장된 주소를 전달
 
 - 힙(Heap)의 공간에 저장, ARC 시스템을 통해 메모리 관리(주의해야함)
 
 - 참고: 스택은 데이터를 차곡차곡(적층) 쌓지만, 힙은 데이터를 군데 군데(따로 따로) 저장
 
 - 스택의 영역에 실제로 생성된 변수가  생기고(메모리 주소만 담김. 그림 참조),
 
 메모리 주소가 담기고, 그 주소가 힙의 영역을 가리킨다.
 
 - 그렇지만 그 외의 면에서는 클래스와 구조체는 거의 동일하므로,
 
 - 클래스와 구조체를 동시에 살펴볼 것임.

 - 특별하게 차이를 언급하지 않는 한,

 - 클래스의 기능은 동일하게 구조체에서 가지고 있다고 보면 됨
 
 ==========================================================**/

/*
 
 클래스의 원형(붕어빵틀)은 데이터 영역에 존재한다.
 
 클래스의 인스턴스를 하나하나씩 찍어내면
 
 실제로 메모리 영역 중에서 힙 영역에 존재한다.
 
 힙 영역의 특성상 따로따로 저장이 되어 있을 것이다.
 
 그리고 실제로 생성된 클래스의 인스턴스들은 클래스의 원형(데이터 영역에 존재하는)의
 
 메모리 주소를 가지고 있고 클래스의 원형을 가르키고 있다.(참조 타입)
 
 var bori = Dog()
 
 클래스를 bori라는 변수에 담는다면 실제로 찍어낸 인스턴스들은 힙의 영역에 존재하지만
 
 각각의 인스턴스들의 메모리 주소가 존재한다.
 
 그리고 그 메모리 주소를 bori라는 변수에 담는 것이다.
 
 즉, bori라는 변수는 스택의 영역에 생성되고,
 
 실제 데이터(인스턴스)는 힙의 영역에 저장된다.
 
 그리고 그 힙의 영역에 저장된 데이터의 주소, 메모리 주소를 변수(bori)에 담는 것이다.
 
 그래서 실제로 이 bori라는 변수에는 인스턴스의 메모리 주소만 담겨 있는 것이다.(참조 타입)
 
 
 구조체의 메모리는 힙의 영역에서 찍어내지 않는다.
 
 구조체 역시 동일하게 데이터 영역에 구조체의 원형(붕어빵 틀)이 들어가 있고
 
 실제로 찍어낸 데이터가 스택의 영역에 저장이 된다.
 
 스택에 저장된다는 의미는 함수의 실행이 종료되면 사라진다는 의미이다.
 

 
 */


/*:---
 - 클래스와 구조체의 메모리
 ---
 */
class KoreanGuy {
    
    var name = "황희찬"
    
}

/*
 
 클래스의 변수를 복사하는 경우에는
 
 메모리 주소를 복사해서 담는 것이기 때문에 동일한 데이터를 가리키게 된다.
 
 값을 저장하는 것이 아니고 저장된 주소를 전달하기 때문에 동일한 데이터를 가리킴
 
 
 */


var k = KoreanGuy()


k.name

k.name = "손흥민"

k.name


var k1 = k

k1.name

k1.name = "이강인"

k1.name

// 동일한 메모리 주소를 가리키기 때문에 변수 k와 k1은 마지막에 할당된 이강인을 출력함

// k와 k1의 메모리 주소가 동일하기 때문: 참조 타입(Reference)

k.name



/*
 
 구조체의 변수를 복사하는 경우에는 무조건 데이터를 복사해서
 
 새로 담는 것이기 때문에 각각의 데이터가 새롭게 생성된다.
 
 즉, 클래스는 주소를 복사하고 구조체는 데이터 자체를 복사한다는 것이다.
 
 그래서 클래스는 새로운 변수로 바인딩 하더라도 동일한 데이터를 가리키고
 
 구조체는 데이터가 새롭게 생성되므로 각각의 데이터로 남게 된다.
 
 */


struct SpainGuy {
    
    var name = "펩 과르디올라"
}




var s = SpainGuy()

s.name

s.name = "루이스 엔리케"


var s1 = s

s1.name

// 각각의 스택 프레임의 형성으로 s는 s의 스택 프레임 내부의 속성을 호출

// s1 역시 스택 프레임 내부의 속성을 호출한다.

// 즉 데이터 자체를 복사: 값타입(Value Type)


s1.name = "에르네스토 발베르데"

s1.name

s.name

// 구조체는 클래스에 비해 훨씬 더 가볍다. 그래서 많은 경우에 구조체를 사용한다.

// 클래스는 구조체에 비해 조금 더 무겁다. 왜냐하면 힙이라는 영역에 저장하기 때문이다.

// 힙의 메모리 영역은 데이터를 조금 더 길게 저장하기 위해 사용한다.

// 실제로 메모리에 데이터를 생성시 스택에서 생성하는 것보다 조금 더 오래 걸린다.


/*:---
 - 클래스와 구조체의 let과 var 키워드
 ---
 */

class PersonClass {
    
    var name = "사람"
    
    var age = 0
}


struct AnimalStruct {
    
    var name = "동물"
    
    var age = 0
    
}


let pClass = PersonClass()  // 상수로 선언됨

pClass.name = "사람1"



pClass.name     // 상수로 선언되었음에도 불구하고 데이터가 변한다...?

let astruct = AnimalStruct()

// astruct.name = "동물1"

astruct.name

// 반면, 구조체에서는 변하지 않는다.

/*
 
 구조체의 경우 상수로 선언하게 되면 속성 모두가 상수로 변하게 된다.
 
 메모리 구조가 스택에 생기기 때문이다.
 
 반면, 클래스의 경우에는 메모리 주소를 상수로 선언한다는 뜻이다.
 
 즉, 메모리 주소를 변경할 수 없다는 뜻이다.
 
 그래서 다른 객체를 가리킬 수 없다.
 
 새로운 객체를 가리킬 수 있는 새로운 주소를 메모리에 저장할 수 없다는 의미이다.
 
 반면에 속성은 변경이 가능하다. 왜냐하면 변수로 선언이 되어있기 때문이다.
 
 구조체의 경우에는 구조체 자체의 속성도 상수로 바인딩 되는 것이고
 
 클래스의 경우에는 클래스 자체의 속성이 아닌 메모리 주소가 상수로 바인딩 되는 개념이다.
 
 
 */

/*:---
 - 접문법 / 명시적 멤버 표현식(Explicit Member Expression)의 정확한 의미
 ---
 */
// 내부의 요소. 즉, 클래스, 구조체의 인스턴스의 멤버에 접근한다.

// 멤버는 속성, 메서드를 포함

// 접문법이라는 것은 "하위에 있는 멤버다" 라는 개념을 클래스와 구조체를 통해서 이해.

// 하위에 있는 속성이나 메서드를 가리킨다 라고 이해하면 충분하다.



k.name

"안녕하세요."

/*
 
 문자열 조차도 구조체로 만들어저 있다.
 
 그래서 실제로는 메모리에 인스턴스를 찍어내는 행위와 같다.
 
 메모리에 찍어냈기 때문에 문자열이라는 구조체의 하위개념에 해당하는
 
 점을 찍고 예를 들어 random 같은 행위들을 할 수 있게 되는 것이다.
 
 */





Int.random(in: 1...10)

/*: ---
 - 관습적인 부분들에 대한 이해
 ---
 */
/**=====================================
 
 - 일반적으로 클래스, 구조체 선언할때 모두
 
 - 1) 속성
 
 - 2) 메서드 순서대로 작성
 
 =====================================**/

class Cat {
    
    var name = "고양이"
    
    var weight = 0
    
    func sit() {
        
        print("\(name)가 앉았습니다.")
        
        // walk() 가능: 클래스 내부
        
    }
    
    func walk() {
        
        print("꽁꽁 얼어붙은 한강위로 \(name)가 걸어다닙니다.")
        
        // sit(): 클래스 내부에 있기 때문에 실행 가능
    }
    
    // walk(): 클래스 외부에 있기 때문에 실행 불가
}


//:> 주의점 - (참고) 클래스 내부에는 직접 메서드(함수) 실행문이 올 수 없다. ⭐️
// 메서드 실행문은 메서드의 정의문 내에 존재해야함

// 처음 코딩하면서 자주 실수하는 부분임에 유의

/*
 
 정리
 
 클래스의 경우 변수는 스택 영역에 생성이 되고 메모리 주소를 담고 있지만,
 
 실제 데이터는 힙의 영역에 생성이 된다.
 
 반면에 구조체의 경우에는 메모리 생성을 아예 스택에다가 해버린다.
 
 그래서 메모리 복사에서도 차이가 생긴다.
 
 구조체는 복사를 할때 데이터 자체를 복사해 버린다.
 
 반면에 클래스의 경우 복사를 할때 데이터 자체가 아닌
 
 메모리 주소를 복사해서 같은 데이터를 가리킨다.
 
 그래서 클래스의 경우에는 상수로 선언하면 메모리 주소를 변경할 수 없게 되고
 
 구조체의 경우에는 상수로 선언하면 전체 내부의 속성,
 
 즉 변수가 상수로 바인딩 되는 것이다.
 
 
 */
