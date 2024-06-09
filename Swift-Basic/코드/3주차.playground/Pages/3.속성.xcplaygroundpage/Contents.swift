import Foundation

//: # 구조체, 클래스의 속성


/*: ## 1) 저장속성(Stroed Properties) / 지연 저장 속성
 - 1-1) 저장 속성(Stored properties)
 ---
 */
/*
 
 그동안 우리가 배운 속성은 정확한 의미에서 "저장 속성"이었음
 
 ====> 앞으로 저장 속성이 아닌 것을 배우게 됨
 
 저장 속성이 아닌 다른 속성들은 메모리 공간을 가지지 않는 경우도 있다.
 
 어떤 특정한 메모리 공간을 가지고 그 안에 값을 저장할 수 있는 속성을
 
 바로 저장 속성이라고 한다.
 
 
 */


struct MySquard {
    
    var name: String
    
    var height: Double
    
    var age: Int
    
    
    init(name: String, height: Double, age: Int) {
        self.name = name
        self.height = height
        self.age = age
    }
    
    
    func profile() {
        
        print("\(name) 선수의 나이는 \(age)년생이며 키는 \(height)cm 입니다.")
        
        
    }
    
    
    
}


var myPlayer: MySquard = MySquard(name: "알레한드로 발데", height: 177.0, age: 2003)


/*:---
 - 주의점
 ---
 */
/**================================================================================
 
 - 저장 속성  ===>  구조체, 클래스 동일
 
 - let(상수) 또는 var(변수)로 선언 가능
 
 (만약 저장 속성을 let으로 선언하면 값을 바꿀 수 없음)
 
 - 저장 속성(변수)은 각 속성 자체가 고유의 메모리 공간을 가짐 ⭐️
 
 - (앞에서 배웠던 것처럼) 초기화 이전에 값을 가지고 있거나, 생성자 메서드를 통해 값을 반드시 초기화 해야만 함. 아니면 옵셔널 타입으로 선언하여 nil로 초기화 되도록 할 수도있다.
 
 ==================================================================================**/


/*: ---
 - 1-2) 지연 저장 속성(Lazy Stored Properties)
 ---
 */
class MySquard1 {
    
    // 처음에는 메모리 공간이 없다가 나중에 인스턴스를 선언할 떄 메모리 공간을 생성 하므로, 즉 변화하는 식별자이므로 let으로 선언할 수가 없다.
    
    // 지연 저장 속성은 무조건 초기 값을 가져야 한다.
    
    
    var name: String
    
    lazy var playerSubstitutionTime: Double = 76.0
    
    // 표현식도 할당 가능. 일반적으로 잘 사용하지 않음
    
    init(name: String) {
        self.name = name
    }
    
    //        self.playerSubstitutionTime = playerSubstitutionTime -> 불가. 무조건 초기값을 가져야 함
    
    //        self.playerSubstitutionTime = 89.0 -> 가능은 하지만 의미 없음. 어짜피 처음부터 메모리 공간을 만들어 내지 않으므로. 인스턴스를 호출한 이후 생성됨
    
   
    func playTime() {
        print("\(self.name)선수가 \(playerSubstitutionTime)분경에 교체 출전합니다.")
    }
    
}

// playerSubtitution 초기화 안됨

var myPlayer1 = MySquard1(name: "비토르 호키")

// 해당 변수에 접근하는 이 시점에 초기화됨

// (메모리 공간이 생기고 숫자가 저장됨)

myPlayer1.playerSubstitutionTime



myPlayer1.playTime()

/**===========================================================
 
 - 저장 속성은 저장 속성인데, 지연(lazy)의 의미가 뭘까?

 - 지연 저장 속성은 "해당 저장 속성"의 초기화를 지연시키는 것임
 
 - 즉, 인스턴스가 초기화되는 시점에 해당 속성이 값을 갖고 초기화되는
   것이 아니라(메모리에 공간과 값을 갖는 것이 아니라), 해당 속성(변수)에 접근하는 순간에 (해당 저장 속성만)개별적으로 초기화됨

 - 따라서, 상수로의 선언은 안되고 변수(var)로의 선언만 가능
 
   ➡︎ lazy var만 가능(lazy let 불가능)

 - 즉, 위의 playerSutitutionTime이라는 속성은 초기화 시점에 메모리 공간이 생기는 것이 아님
 
 - 예를 들어, 인스턴스가 생기고 난 후, myPlayer1.playerSutitutionTime 이렇게 접근하는순간 메모리 공간을 만들고 숫자를 저장 하게됨
 
=============================================================**/

/*:---
 - 주의점
 ---
 */
//:> 지연 저장 속성은 "선언시점에 기본값을 저장"해야함
/**=============================================================
 
 - 따라서, 생성자에서 초기화를 시키지 않기 때문에 "선언시점에 기본값을 저장"해야함
 

 - 지연(lazy) 저장 속성 ===> 구조체, 클래스 동일
 
 - 값을 넣거나, 표현식(함수 실행문)을 넣을수 있음(모든 형태의 표현식)
 
 - 함수호출 코드, 계산코드, 클로저 코드 등도 모두 가능
 
   ===> 저장하려는 속성과 "리턴형"만 일치하면 됨
 
 - 지연 저장 속성으로 선언된  "해당 속성"의 초기화 지연.
 
   ===> 메모리 공간이 없다가 처음 접근하는 순간에 (해당 속성만)개별적으로 초기화됨
 
================================================================*/

/**====================================================
 
 - 지연 저장 속성을 사용하는 이유

 - 1)
 
 - 메모리 공간을 많이 차지하는 이미지 등의 속성에 저장할때,
 
 - (반드시 메모리에 다 올릴 필요가 없으므로) 지연 저장 속성으로
   선언 함 (메모리 낭비 막기 위함)

 - 2)
 
 - 다른 속성들을 이용해야 할때
 
 - 초기화 시점에 모든 속성들이 동시에 메모리 공간에 저장되므로
 - 어떤 한가지 속성이 다른 속성에 접근할 수가 없다.
 
 - (그렇지만, 지연 저장 속성을 이용 하는 경우 지연으로 저장된 속성은
   먼저 초기화된 속성에 접근 할 수 있게됨)

 
 - 실제 프로젝트에서 많이 활용
 
 - 실제 프로젝트를 다루면서 자연스럽게 이해되는 내용이므로
   (프로젝트 다룰 때 설명 예정)

 - (클로저의 실행문 부분도 연결해서 설명 예정)
 
======================================================**/


/*: ## 2) 계산속성(Computed Properties)
 - 계산 속성이라는 것이 왜 필요할까?
 -----
 */
// 값이 저장되는 일반적인 속성(변수)을 저장 속성이라고 함

// 그동안 우리가 배운 속성은 정확한 의미에서 "저장 속성"이었음

// ====> 앞으로 저장 속성이 아닌 것을 배우게 됨


/*:---
 - 계산 속성 예시
 ---
 */
class Person {
    
    var birth: Int = 0
    
    var age: Int {
        
        return 2024 - birth
        
        
    }
    
    
}


var person1 = Person()

person1.birth = 2007

person1.age

// 계산 속성을 구현하지 않았기에 에러 발생

// person1.age = 20

person1.birth


class Person1 {
    
    var birth: Int = 0
    
    
    var age: Int {
        
        
        get {
            
            return 2024 - birth
        }
        
        set {
            
            birth = 2024 - newValue
        }
        
    }
    
}


var personAge: Person1 = Person1()



personAge.birth = 1991

personAge.age


personAge.age = 30

personAge.birth


/*: ---
 - 비만도를 측정하는 체질량 지수(BMI)를 계산속성으로 표현하기
 ---
 */


class PersonBMI {
    
    let name = "홍길동"
    
    var height: Double
    
    var weight: Double
    
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
    
    
    
    var bmi: Double {
        
        get {   // getter: 값을 얻는다는 의미
            
            let result = (weight) / (height * height) * 10000
            
            return result
        }
        
        set(newValue) {     // setter: 값을 세팅한다(넣는다)는 의미
            
            weight = newValue * (height * height) / 10000
        }
    }
    
}


var personBMI = PersonBMI(height: 195.0, weight: 100.0)


personBMI.bmi


personBMI.bmi = 20.0


personBMI.weight


/**======================================================
 
 - 항상 다른 저장 속성에 의한 결과로 계산해 나오는 그런 방식의 메서드인 경우
 
 - 아예 속성처럼 만들 수 있다. (===> 계산 속성)
 
=========================================================**/


//:>밖에서 해당 인스턴스에 접근해서 "set" ➞ 값을 세팅(설정)한다는 의미

/*:---
 - 읽기만 가능한 계산속성(read-only)은 get블록을 생략 가능
 ---
 */
// 읽기만 가능한 계산 속성으로 구현한다면 get 블록을 생략하고, 구현할 수 있음


class PersonBMI1 {
    
    var name: String = "사람"
    
    var height: Double = 160.0
    
    var weight: Double = 60.0
    
    var bmi: Double {
        
        get {
            
            let bmi = weight / (height * height) * 10000
            
            return bmi
        }
    }
}


// get블록만 있다면, 굳이 한번 더 감쌀 필요가 없다.

// ===> 편의를 위해 get을 생략가능

/**================================================
 
  var bmi: Double {
 
      let bmi = weight / (height * height) * 10000
 
      return bmi
  }
================================================**/


/*:---
 - set블록의 파라미터를 생략하고 'newValue'로 대체가능
 ---
 */
class PersonBMI2 {
    
    var name: String = "사람"
    
    var height: Double = 160.0
    
    var weight: Double = 60.0
    
    var bmi: Double {
        
        get {
            
            let bmi = weight / (height * height) * 10000
            
            return bmi
            
        }
        
        set {
            
            weight = newValue * height * height / 10000
        }
    }
}


/*: ---
 - 계산 속성(Computed Properties) 이해하기
 ---
 */
/**==================================================================================
 
 - 메서드가 아닌, 속성방식으로 구현하면 무슨 장점이 있을까?

 - 관련이 있는 두가지 메서드(함수)를 한번에 구현할 수 있다.
 
 - 그리고 외부에서 보기에 속성이름으로 설정가능하므로 보다 명확해 보임
 
 - 따라서, 계산 속성은 메서드를 개발자들이 보다 읽기 쉽고, 명확하게 쓸 수 있는 형태인 속성으로 변환해 놓은 것이다.

 - 실제로, 계산 속성은 겉모습은 속성(변수)형태를 가진 메서드(함수)임 ⭐️
 
 - 계산 속성은 실제 메모리 공간을 가지지 않고, 해당 속성에 접근했을때 다른 속성에 접근해서 계산한후, 그 계산 결과를 리턴하거나 세팅하는 메서드 이다.
 
=====================================================================================**/


/*:---
 - 주의점
 ---
 */
/**=====================================================================
 
 - 계산 속성 ===> 구조체, 클래스, (열거형) 동일
 

 - 1) 항상 변하는 값이므로, var로 선언해야함 (let로 선언불가)
 
 - 2) 자료형 선언을 해야함(형식추론 형태 안됨. 메서드이기 때문에 파라미터, 리턴형이 필요한 개념)
 
 - 3) get은 반드시 선언 해야함(값을 얻는 것은 필수, 값을 set하는 것은 선택)
 
=======================================================================**/

/*: ## 3) 타입 속성(Type Properties)
 - 타입 속성(Type properties)
 ---
 */

//:>static(고정적인/고정된)이라는 키워드를 추가한 저장 속성: 타입 속성이란 타입 자체에 속한 저장 속성이다.

/*
 
 인스턴스의 속성, 즉 찍어낸 붕어빵의 속성들은 각각의 메모리 공간을 가지고 있다.
 
 그런데 타입 속성이란 타입 자체에 속한 저장 속성(+계산 속성)이다.
 
 모든 인스턴스의 불변이거나 공유할 수 있는, 원래의 붕어빵 틀에서 가지고 있는
 
 메모리 공간을 의미한다. 타입 자체에 속한 속성
 
 */

class Dog {
    
    static var species: String = "Dog"  // 저장 타입 속성
    
    var name: String
    
    var weight: Double
    
    init(name: String, weight: Double) {
        
        self.name = name
        
        self.weight = weight
    }
    
}


let dog = Dog(name: "초코", weight: 15.0)

dog.name

dog.weight


// dog.         // =====> 인스턴스에서 .(점)을 찍어도 속성으로 보이지 않음


Dog.species    // ====> 반드시 타입(형식)의 이름으로 접근해야함




//:> 저장 속성, 계산 속성 2가지 모두 타입속성이 될 수 있음

/*: ---
 - 1) 저장 타입(형식) 속성
 ---
 */

class Circle {

    // 저장 타입 속성 (값이 항상 있어야 함)
    
    static let pi: Double = 3.14    // 저장 타입 속성
    
    // 인스턴스를 (전체적으로)몇개를 찍어내는지 확인

    static var count: Int = 0
    
    // 저장 속성
    
    var radius: Double
    
    init(radius: Double) {
        
        self.radius = radius
        
        Circle.count += 1
        
    }
    
    var diameter: Double {
        
        get {
            
            return radius * 2
        }
        
        set {
            
            radius = newValue / 2
        }
        
    }
    
}


var circle1 = Circle(radius: 2)   // 인스턴스를 +1 개 찍어냈다.

Circle.count

var circle2 = Circle(radius: 3)   // 인스턴스를 +1 개 찍어냈다.

Circle.count


let c = Circle.pi

// Circle()     // 이런식으로 인스턴스 생성을 안 했는데도 접근 가능

// 실제 사용 예시)

Int.max

Int.min



// 더블은 실제로 구조체로 구현이 되어 있다.



Double.pi   // 구조체: 타입(기본 타입) 그 자체로서 접근이 가능



// 5.2222   인스턴스

// 5.2222.pi    인스턴스이므로 타입(기본타입, 사용자 정의 타입 등)으로서 접근이 불가능하다.

/*: ---
 - 2) 계산 타입 속성
 ---
 */
class Circle1 {
    
    // 저장 타입 속성
    
    static let pi: Double = 3.14
    
    // 기본값 생략 불가: 타입이기 때문에 어떠한 생성 과정이 없음.
    
    // 디폴트 값으로 미리 설정해 놓아야 한다고 이해하면 됨. 생성자로서 초기화 불가
    
    static var count: Int = 0
    
    
    // (계산) 타입 속성(read-only)
    
    static var multiPi: Double {
        
        return pi * 2       // 정식 문법 Circle1.pi * 2
        
        // 타입 끼리는 접근 가능하기 때문에 pi * 2로 Circle1 생략 가능
        
        //
    }
    
    // 저장 속성
    
    var radius: Double     // 반지름
    
    
    // 생성자
    init(radius: Double) {
        
        self.radius = radius
        
        // 접근연산자로서만 접근 가능: pi = ... : 불가
        
        /*
         
         생성자라는 것은 인스턴스에 속해 있는 것이고, 인스턴스에 접근할 경우에는
         
         circle1.pi로서 접근해야 한다.(물론 read only이기에 애초에 불가)
         
         */
    }
    
}


let b = Circle1.multiPi


// 파이(3.14..)에 2배를 한 숫자가 만약, 많이 사용된다면

// 위와 같은 형태를 생각해 볼 수 있음

// 단순히, 계산 타입 속성도 가능하다는 것을 살펴보기 위한 예시


/*: ---
 - 타입 속성의 메모리 구조의 이해
 ---
 */
/**================================================================================
 
 - 저장 타입 속성
 
 - 일반 저장속성은 인스턴스를 생성할때, 생성자에서 모든 속성의 초기화를 완료.
 
 그리고, 해당 저장 속성은 각 인스턴스가 가진 고유한 값임
 
 - 하지만, 저장 타입(형식) 속성은 생성자가 따로 없기때문에, 타입 자체(유형 그 자체)에
 
 속한 속성이기 때문에 항상 기본값이 필요. 생략할 수 없음
 
 - 지연 속성의 성격을 가짐 ⭐️
 
 - 저장 타입속성은 기본적으로 지연 속성 (속성에 처음 접근하는 순간에 초기화됨)이지만, lazy라고 선언할 필요는 없음
 
 (참고: 여러 스레드에서 동시에 액세스하는 경우에도 한 번만 초기화되도록 보장됨. Thread-Safe)
 
 - 메모리 공간을 여러개 만들 필요가 없이 애플에서 미리 안전하게 설계했다고 이해하면됨
 
 - 무조건 메모리 공간을 만드는 것이 아니고 접근연산자로서 사용
 
 ================================================================================**/



/*: ---
 - 주의점
 ---
 */


/*:
 - 타입 속성(Type Properties):클래스, 구조체, (열거형)에 모두 추가할 수 있음
 - let 또는 var 둘다 선언 가능
 -
 - 타입 속성은 특정 인스턴스에 속한 속성이 아니기 때문에 인스턴스 이름으로는 접근불가
 */

//:> 인스턴스 내에서도 접근하려면 타입이름 + 속성으로 써야 접근 가능함

class Circle2 {
    
    // 저장 타입 속성
    
    static let pi: Double = 3.14
    
    static var count: Int = 0
    
    
    // 저장 속성
    
    var radius: Double     // 반지름
    
    
    // 생성자
    
    init(radius: Double) {
        
        self.radius = radius
        
        Circle2.count += 1
    }
    
    
    // 넓이 구하기 ==>  원의 넓이 공식 ==> 파이 X 반지름 제곱
    
    func getArea() -> Double {
        
        // 타입이름으로 접근해야함
        
        let area = Circle2.pi * radius * radius
        
        // 내부 인스턴스에서도 타입 속성에 접근할때 주의
        
        return area
    }
    
}



let c1 = Circle2(radius: 3)

c1.getArea()

Circle2.count


let c2 = Circle2(radius: 2)

Circle2.count


// let c3 = Circle2(radius: 2)

// Circle2.count



/**=======================================================================
 
 - 어떤 경우에 타입 속성을 선언해야 하나?
 
 - 모든 인스턴스가 동일하게 가져야 하는 속성이거나(해당 타입의 보편적인 속성),
 
 모든 인스턴스가 공유해야하는 성격에 가까운 이어야 함(예에서 확인)
 
 
 - 상속에서 재정의(overriding)
 
 - 1) 저장 타입 속성 ===> 상속에서, 하위클래스에서 재정의 불가능(class키워드 안됨)
 (인스턴스의 경우도 저장 속성은 고유의 틀이기 때문에 건드릴 수 없음)
 
 - 2) 계산 타입 속성 ===> 상속에서, 상위클래스에서 class키워드를 붙인 경우, 재정의 가능
 
 
 - class키워드(계산 타입 속성만) ⭐️
 
 - 상속이 있는 경우, 계산 타입 속성에서는 static대신 class키워드를 사용
 
 (===>static과 동일한 역할)하면 재정의 가능한 속성이 됨
 
 ========================================================================**/



/*: ## 4) 속성 감시자(Property Observer)
 
 - 속성 감시자(Property Observer
 ---
 */

class Profile {
    
    // 일반 저장 속성
    
    var name: String = "이름"
     
    var statusMessage: String = "기본 상태 메세지" {
        
        // message => newValue(저장 되기 직전에 호출)
        
        // statusMessage => 기존의 데이터
        
        // willSet은 값이 저장되기 직전에 호출됨
        
        willSet(message) {
            
            print("메세지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
            
            // print("상태메세지 업데이트 준비")
            

        }
        
        
    }
}



let p = Profile()

p.name


p.statusMessage

p.statusMessage = "출전 가능 메시지 상태"

p.statusMessage




//:> 기본적으로 "속성 감시자"라는 이름이지만, 성격은 메서드 ➞ 저장 속성 감시
// 저장 속성이 변하는 시점을 관찰

// 저장 속성이 변하는 순간 ===> 딸려있는 메서드가 호출됨

// 속성 감시자는 새 값이 속성의 현재 값과 동일하더라도 속성 값이 설정 될 때마다 호출됨


/*: ---
 - 속성 감시자의 2가지 종류 - willSet / didSet
 ---
 */


//:> willSet: (값이 변할때) 새 값이 저장되기 직전에 호출됨

class SutitutionStatus {
    
    var playerName: String = "이름"
    
    var subtitution: String = "비토르 호키" {
        
        // willSet에서 subtitution: 기존의 값
        
        willSet(player) {
            
        // willSet에서 player(newValue): 바뀔값
            
            print("\(subtitution)에서 \(player)로 교체됩니다.")
            
            
        }
        
    }
    
}


var s = SutitutionStatus()

s.playerName

s.subtitution

s.subtitution = "디발라"





//:> didSet: (값이 변할 때) 새 값이 저장된 직후에 호출됨




class SutitutionStatus1 {
    
    var playerName: String = "이름"
    
    var subtitution: String = "디발라" {
        
        didSet(player) {
            
            print("\(player)가 \(subtitution) 대신 교체 출전합니다.")
            
            
        }
        
    }
    
}



var s1 = SutitutionStatus1()

s1.subtitution


s1.subtitution = "비토르 호키"

/**===========================================================
 
 - 클래스, 구조체, (열거형) 동일하게 적용
 
 - 어떤 속성이 변하는 시점을 알아차리도록 시점에 제약을 만드는 코드를 짜기는 어려움
 
   ==> 그래서 실제 앱을 만들고 활용할때 좋은 수단

 - 일반적으로는 willSet 또는 didSet 중에서 한가지만 구현
 
 - (실제 프로젝트에서는 didSet을 많이 사용)
 
==============================================================**/

/*:---
 - 파라미터의 생략 - oldValue / newValue
 ---
 */

class Profile1 {
    
    // 일반 저장 속성
    
    var name: String = "이름"
    
    var statusMessage = "기본 상태메세지" {
        
        willSet {
            
            print("메세지가 \(statusMessage)에서 \(newValue)로 변경될 예정입니다.")
            
            print("상태메세지 업데이트 준비")
        }
        
        didSet {
            
            print("메세지가 \(oldValue)에서 \(statusMessage)로 이미 변경되었습니다.")
            
            print("상태메세지 업데이트 완료")
        }
    }
    
}




let p2 = Profile1()

p2.name
p2.name = "전지현"


p2.statusMessage
p2.statusMessage = "행복해"

/*: ---
 - 주의점
 ---
 */
/**===============================================================================
 - 속성 감시자를 추가 가능한 경우 ⭐️

 - 1) 저장 속성 (원래, 상속한 경우 둘다 가능)
 
 - 2) 계산 속성 (상속해서 재정의하는 경우에만 가능) (단순 메서드 추가)


 - 계산 속성의 경우, 속성 감시자를 만드는 대신 계산 속성의 set블록에서 값 변경을 관찰할 수 있기 때문에
 
   (재정의(상속)이 아닌 본래의 계산 속성에는 추가 불가)
 
 - let(상수) 속성에는 당연히 추가 안됨 (값이 변하지 않으므로, 관찰할 필요가 없기 때문)
 
 - 지연저장 속성에 안됨 (스위프트 5.3이후 업데이트: 지연 저장 속성에도 속성 감시자 구현 가능)
 
=================================================================================**/

/*:---
 - 속성 감시자 동작의 메커니즘
 ---
 */
var x = 0


func willSettting(newValue: Int) {
    
    print(newValue)
}

func didSetting(oldValue: Int) {
    
    print(oldValue)
}


func setX(newX: Int) {
    
    willSettting(newValue: newX)
    
    let tempX = x   // x == 0
    
    x = newX        // x == 5
    
    // 실제 값이 바뀌는 시점: x == 0, 5가 아님. tempX가 바인딩된 값이 되기 '직전(oldValue) 이므로'
    
    didSetting(oldValue: tempX)
}

x = 5

setX(newX: 5)   // 값이 저장된 '직후(newValue)' 호출됨

// x = 5           // 값이 저장 되기 '직전'


//:> 실제 값의 변경이 일어나지 않아도, 값을 Set하는 작업을 하면 무조건 호출
