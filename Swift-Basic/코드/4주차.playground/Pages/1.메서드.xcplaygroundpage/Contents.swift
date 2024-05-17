import UIKit

/*: # 구조체, 클래스의 메서드
 
 */

/*: ## 1) 인스턴스 메서드
 
 - 인스턴스 메서드(Instance Methods)
 
 ---
 */
class Dog {
    
    var name: String
    
    var weight: Double
    
    init(name: String, weight: Double) {
        
        self.name = name
        
        self.weight = weight
        
    }
    
    func sit() {
        
        print("\(name)가 앉았습니다.")
        
    }
    
    func layDown() {
        
        print("\(name)가 누웠습니다.")
        
    }
    
    func play() {
        
        print("\(name)가 열심히 놉니다.")
        
    }
    
    func changeName(newName name: String) {
        
        self.name = name
    }
}


var myLove: Dog = Dog(name: "복실", weight: 3.2)


myLove.changeName(newName: "튼실")

myLove.name


/*:---
 - 클래스의 인스턴스 메서드(Instance Methods)
 ---
 */
class Dog1 {
    
    static var species = "Dog"
    
    var name: String
    
    var weight: Double
    
    init(name: String, weight: Double) {
        
        self.name = name
        
        self.weight = weight
    }
    
    func sit() {
        
        print("\(name)가 앉았습니다.")
    }
    
    func trainning() {
        
        print("월월 저는 \(Dog1.species)입니다.")
        sit()
        sit()
        self.sit()     // self 키워드는 명확하게 지칭하는 역할일 뿐
    }
    
    func changeName(newName name: String) {
        
        self.name = name
    }
    
}


let bori1 = Dog1(name: "보리", weight: 20.0)

bori1.trainning()


bori1.changeName(newName: "말썽쟁이보리")

bori1.sit()


/*:---
 - 구조체의 인스턴스 메서드(Instance Methods)
 ---
 */

//: - 값 타입(구조체, 열거형)에서 기본적으로 인스턴스 메서드 내에서 속성을 수정할 수 없음

//: - 수정하려면, mutating(변형되는)키워드를 붙이면 속성 수정 가능해짐(클래스와 구조체의 차이)
struct Dog2 {
    
    var name: String
    
    var weight: Double
    
    init(name: String, weight: Double) {
        
        self.name = name
        
        self.weight = weight
        
    }
    
    func sit() {
        
        print("\(name)가 앉았습니다.")
        
    }
    
    // mutate: 변형되다 (mutating - 변형되는)
    
    mutating func changeName(newName name: String) {
        
        self.name = name
    }
    
    // 컴파일러가 알아서 수정해줌 (실수에 대한 자동 방지가 되지만, 문법적으로 인지하고 있어야함)

    
}



//:> 값타입의 인스턴스 메서드 내에서 자신의 속성값 수정은 원칙적 불가 ➞ mutating 키워드 필요



/*: ## 2) 타입 메서드
 - 타입 메서드(Type Methods)
 ---
 */
//:
//:> 메서드이지만, 인스턴스의 성격이 아닌 타입 자체의 성격에 가까운 메서드 일때
class Dog3 {
    
    static var species = "Dog"
    
    var name: String
    
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    func trainning() {
        print("월월 저는 \(Dog3.species)입니다.")
        sit()
        sit()
        self.sit()
    }
    
    func changeName(newName name: String) {
        
        self.name = name
    }
    
    static func letmeKnow() {
        
        // 타입 메서드에서, 타입속성에 접근시에는 타입으로 접근하지 않아도 됨
        
        print("종은 항상 \(species)입니다.")
        
        // Dog.species라고 써도됨
    }
    
}


let bori = Dog(name: "보리", weight: 20.0)

bori.sit()


bori.changeName(newName: "말썽쟁이보리")

bori.sit()


// 타입 메서드의 호출 ⭐️

Dog3.letmeKnow()



// 인스턴스 기능이 아닌, 타입 자체에 필요한 기능을 구현할때 주로 사용

// 타입 자체가 가져야 하는 공통된 기능(동작) 구현시


/*:---
 - 실제, 타입 메서드 사용 예시
 ---
 */
// Int.random(in: <#T##Range<Int>#>)

Int.random(in: 1...100)



// Double.random(in: <#T##ClosedRange<Double>#>)

Double.random(in: 1.2...3.7)

/*:---
 - 클래스 - 타입 메서드의 상속
 ---
 */
// 타입 메서드를 상속시 재정의가능 하도록 하려면:

// ===> static 키워드를 상속가능한 class 키워드로 바꿔야함

// 상위클래스

class SomeClass {
    
    class func someTypeMethod() {
        
        // 타입 메서드
        
        print("타입과 관련된 공통된 기능의 구현")
        
    }
    
}


SomeClass.someTypeMethod()



// 상속한 서브클래스

class SomeThingClass: SomeClass {
    
    override class func someTypeMethod() {
        
        // super.someTypeMethod()
        
        print("타입과 관련된 공통된 기능의 구현(업그레이드)")
        
    }
}




/*: ## 3) 서브스크립트
 - 서브스크립트(Subscripts) - (배열, 딕셔너리에서 이미 경험)
 ---
 */
/**=====================================
 
- 서브스크립트?
 
- 대괄호를 이용해서 접근가능하도록 만든 문법을 가르킴

 - 배열
 
   array[인덱스]

 - 딕셔너리
 
   dictionary[키]
 
========================================**/

var array = ["Apple", "Swift", "iOS", "Hello"]


array[0]

array[1]



// 내부적으로 대괄호를 사용하면 어떤 값을 리턴하도록 구현이 되어 있어서 가능한 일



// 인스턴스.0

// 인스턴스.method()   =====> 이런 형태가 아닌

// 인스턴스[파라미터]     =====> 이런 형태로 동작을 가능하게한 문법 (대괄호로 메서드의 기능을 대신)


//:> 서브스크립트는 특별한 형태의 메서드


/*:---
 - 1) (인스턴스) 서브스크립트(Subscripts)의 직접 구현 - 클래스, 구조체, (열거형)
 ---
 */
// 인스턴스 메서드로서의 서브스크립트 구현


class SomeData {
    
    var datas = ["Apple", "Swift", "iOS", "Hello"]

    
    subscript(index: Int) -> String {
        
        // 1) 함수와 동일한 형태이지만, 이름은 subscript
        
        get {
            
            // 2) get/set은 계산속성에서의 형태와 비슷
            
            return datas[index]
        }
        set(parameterName) {
            
            datas[index] = parameterName
            
            // 또는 파라미터 생략하고 newValue로 대체 가능(계산 속성의 setter와 동일)
        }
    }
    
}


var data = SomeData()

data[0]

// data[0] = "AAA"



// 파라미터 생략 불가(값이 반드시 필요)

// 리턴형도 생략 불가능(저장할 값의 타입 명시 필요)

// 읽기 전용(read-only)으로 선언 가능 (set블록은 선택적으로 구현이 가능하고, 쓰기 전용으로의 선언은 불가)


Int.random(in: 1...10)


/*:---
 - 서브스크립트 사용 예시 - 대괄호 형태로 사용하는 메서드이다.
 */


struct TimesTable {
    
    let multiplier: Int = 3
    
    subscript(index: Int) -> Int {
        
        return multiplier * index
    }
}


let threeTimesTable = TimesTable()

print("6에 3배를 하면 숫자 \(threeTimesTable[6]) 이(가) 나옵니다.")






struct Matrix {
    
    // 2차원 배열
    
    var data = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
    
    // 2개의 파라미터를 받는 읽기전용 서브스크립트의 구현
    
    subscript(row: Int, column: Int) -> String? {
        
        if row >= 3 || column >= 3 {
            
            return nil
        }
        return data[row][column]
    }
}


// 2개의 파라미터를 받는 서브스크립트 구현도 가능


var mat = Matrix()

mat[0, 1]!     // 대괄호 안에 파라미터 2개 필요


/*:---
 - 2) 타입 서브스크립트(Type Subscripts) - 클래스, 구조체, (열거형)
 ---
 */


enum Planet: Int {   // 열거형의 원시값
    
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet {    // Self
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]      // Planet.venus
print(mars)




// static 또는 class 키워드로 타입 자체의 서브스크립트 구현 가능

// class는 상속시 재정의 가능


/*: ## 접근 제어의 개념
 - 접근 제어(Access Control)
 ---
 */
class XClass {
    
    // private: 사적인, 은밀한, 사생활의
    
    private var name = "이름"
    
    // 저장 속성을 숨길 수 있다. 외부에서 접근이 불가능하게 만들 수 있다.

    func nameChange(name: String) {
        
        self.name = name
    }
}

var x = XClass()

// 메서드를 통해 변경은 가능함.

x.nameChange(name: "헤이즈")


/**==========================
 
 - 외부에서 private으로 선언된 속성 / 메서드에 접근 불가하므로 코드 내부의 세부 구현 내용을 숨기는 것이 가능(은닉화)
 
 - name 속성은 외부에서 볼 수 없음(접근 불가)
 
 [접근 제어가 필요한 이유]
 
 - 애플이 자신들이 원하는 코드를 감출 수 있음
 
 - 코드의 영역을 분리시켜서, 효율적인 관리가 가능
 
 - 컴파일 시간이 줄어듬(컴파일러가, 해당 변수가 어느 범위에서만 쓰이는 지를 인지 가능)

 ==============================**/


/*: ## 싱글톤(Singleton) 패턴
 - 싱글톤 패턴이 필요한 이유
 ---
 */




  
//: - 앱 구현시에, 유일하게 한개만 존재하는 객체가 필요한 경우에 사용

//:  - (특정한 유일한 데이터/관리 객체가 필요한 경우)

//: - 한번 생성된 이후에는 앱이 종료될때까지, 유일한 객체로 메모리에 상주


 




/*:---
 - 싱글톤 패턴의 문법적 이해
 ---
 */
class Singleton {
    
    // 타입 프로퍼티(전역변수)로 선언
    
    // static let 식별자 = 객체생성(데이터 영역에 유일한 객체의 주소가 담겨있음)
    
    // 앱이 실행되는 동안, (데이터 공유 등) 유일하게 1개만 필요로 하는 객체일 때 사용
    
    // 한번 생성이 되면, 앱이 종료될때까지 1개의 객체로서 메모리에 상주
    
    //(다만, 실제 Static 변수로 선언된 것은 접근시에만 지연 속성처럼 동작
    
    // 일반적으로 식별자의 이름은 '공유되는' 이라는 뜻에서 shared 라는 식별자의 이름을 많이 씀
    
    static let shared = Singleton()
    
    var userInfoID = 12345
    
    // 외부에서, 또다른 새로운 객체 생성을 금지하고 싶은 경우, private init 메서드로 선언 (선택적)
    
    private init() {}
}


//:> 변수로 접근하는 순간 lazy하게 동작하여, 메모리(데이터 영역)에 올라감
Singleton.shared

let object = Singleton.shared

object.userInfoID = 1234567

Singleton.shared.userInfoID


let object2 = Singleton.shared

// 유일한 객체를 가르키는 것일뿐

object2.userInfoID


Singleton.shared.userInfoID

// 그렇지만 아래와 같은 것도 가능 ===> 새로운 객체를 생성한 것임


// let object3 = Singleton()

// 새롭게 찍어냈기 때문에 기존의 12345가 출력

// object3.userInfoId   12345



// private init() 설정으로 새로운 객체 추가적 생성이 불가하게 막는 것 가능

/*: ---
 - 실제 사용 예시
 ---
 */
// 앱을 실행하는 동안, 하나의 유일한 객체만 생성되어서, 해당 부분을 관리

let screen = UIScreen.main    // 화면

let userDefaults = UserDefaults.standard    

// 한번생성된 후, 계속 메모리에 남음!!!

let application = UIApplication.shared   // 앱

let fileManager = FileManager.default    // 파일

let notification = NotificationCenter.default   

// 노티피케이션(특정 상황, 시점을 알려줌)












