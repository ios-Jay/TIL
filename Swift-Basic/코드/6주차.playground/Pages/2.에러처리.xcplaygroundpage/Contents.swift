import UIKit

/*:
 # 에러 처리(Error Handling)
 */

//: ---


/*:
 ## 에러 처리 문법
 * 에러(오류)의 이해
 ---
 */
/**=========================================================================
 
 - 에러의 종류는
 
   1) 컴파일 타임 에러 ===> 스위프트 문법과 관련된 에러(컴파일러가 미리 알고 수정해야한다고 알려줌)
 
   2) 런타임 에러 ===> 프로그램이 실행되는 동안 발생

 - 런타임 에러 ===> 크래시(앱이 강제로 종료)
 
   ===> 발생가능한 에러를 미리 처리해 두면, 강제종료되지 않음 (개발자가 처리해야만 하는 에러)
 
 ===========================================================================**/
/*:
 ---
 * (런타임)에러 처리가 왜 필요할까?
 ---
 */
/**====================================================================================
 - 앱이 실행하는 중간에 왜 꺼질까?
 
 - 어떤 얘기치 못한 상황이 발생할 수 있음
 - (네트워크 통신을 하는 등의 경우에서) 서버에서 데이터를 못 받아와서 ==> 꺼짐

 - 앱이 그냥 꺼지는 게 좋은가? 아니면 예를들어 "서버에서 문제가 발생했습니다. 잠시뒤에 다시 접속해 주세요"라고
   알려주는 것이 좋은가?
 
 - 프로세스 중에서, 예외적인 상황(에러)이 발생하는 것이 미리 가능성 등을 처리해 놓으면
   앱이 무작정 꺼지는 것을 예방할 수 있음 ⭐️


 - 에러는 일반적으로 동작. 즉, 함수의 처리과정에서 일어남
 - 함수를 정의할때, 예외적인 일이 발생하는 경우가 발생할 수 있는 함수이다.라고 정의하고 처리하는 과정을 배울 것임


 - (에러 발생 가능)함수 ====>  함수 실행시에 조금 다르게 처리해야함(에러 처리) ⭐️
 =====================================================================================**/


/*:
 ---
 * 에러 처리의 과정 (3단계)
 ---
 */
// 1) 에러 정의 (어떤 에러가 발생할지 경우를 미리 정의)

enum HeightError: Error {    //에러 프로토콜 채택 (약속)
    case maxHeight
    case minHeight
}




// 2) 에러가 발생할 수 있는 함수에 대한 정의

func checkingHeight(height: Int) throws -> Bool {    // (에러를 던잘수 있는 함수 타입이다)
    
    if height > 190 {
        throw HeightError.maxHeight
    } else if height < 130 {
        throw HeightError.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}




// 3) 에러가 발생할 수 있는 함수의 처리(함수의 실행) ===> 기존과 조금 다르다 (try와 do-catch문으로 처리)


// checkingHeight(height: 160)

// 에러 발생: marked with 'try'?


do {    // 정상적인 경우의 처리 상황
    var result = try checkingHeight(height: 160)    // 에러를 발생시킬 수 있는 함수 앞에 try라는 키워드를 붙이고 반드시 do 블럭 내부에서 사용
    
    if result {
        print("참")
    } else {
        print("거짓")
    }
}

// 에러를 던질 수 있는 함수가 실제로 에러를 던졌을 때는 do 블럭 내부의 코드가 절대로 실행되지 않음

// 에러를 던진 이후 에러를 받아줄 코드가 필요. 그래서 에러를 던지면 캐치 블럭이 필요

catch {
    
    print("놀이기구 이용 불가")
    
}













do {
    
    let isChecked = try checkingHeight(height: 200)
    
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch {
    
    print("놀이기구 타는 것 불가능")
    
}

/**================================================
 
 - do블럭  - 함수를 통한 정상적인 처리의 경우 실행하는 블럭
 
 - catch블럭 - 함수가 에러를 던졌을 경우의 처리 실행하는 블럭
 
 ==================================================**/

/*:
 ---
 * 에러 발생가능한 함수의 형태
 ---
 */
/**=========================
 
 - () throws -> ()
 
 - (Int) throws -> ()
 
============================**/


//[1, 2, 3, 4, 5].map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)

//: ---


/*:
 ## 에러 처리 방법
 * 에러 함수 정의
 ---
 */
// 1) 에러 정의 (어떤 에러가 발생할지 경우를 미리 정의)

enum HeightError0: Error {  //에러 프로토콜 채택
    case maxHeight
    case minHeight
}



// 2) 에러가 발생할 수 있는 함수에 대한 정의

func checkingHeight0(height: Int) throws -> Bool {
    
    if height > 190 {
        throw HeightError0.maxHeight
    } else if height < 130 {
        throw HeightError0.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}



/*:
 ---
 * 에러를 처리하는 방법 - try / try? / try!
 ---
 */

/**===========================================
 
 1) 에러 정식 처리 방법: 대부분의 경우 사용
 
============================================**/


do {
    let isChecked = try checkingHeight(height: 200)
    
    if isChecked {
        print("청룡열차 가능")
    } else {
        print("후룸라이드 가능")
    }
} catch {
    print("놀이기구 타는 것 불가능")
}



/**===========================================
 
 2) try? (옵셔널 트라이) ===> 옵셔널 타입으로 리턴

   (1) 정상적인 경우 ==> (정상)리턴타입으로 리턴
 
   (2) 에러가 발생하면 ==> nil 리턴
 
============================================**/


let isChecked = try? checkingHeight(height: 200)      // Bool?



// 당연히, 옵셔널 타입을 벗겨서 사용해야함




/**===========================================
 
 3) try! (Forced 트라이) ===> 에러가 날 수 없는 경우에만 사용 가능

   (1) 정상적인 경우 ==> (정상)리턴타입으로 리턴
 
   (2) 에러가 발생하면 ==> 런타임에러
 
============================================**/


let isChecked2: Bool = try! checkingHeight(height: 150)      // Bool


// 에러가 발생할 수 없다고 확신이 있는 경우만 사용해야 함



/*:
 ---
 * Catch블럭 처리법
 ---
 */
// catch블럭은 do블럭에서 발생한 에러만을 처리하는 블럭

// 모든 에러를 반드시 처리해야만 함 (글로벌 스코프에서는 모든 에러를 처리하지 않아도 컴파일 에러발생하지 않음)



// 패턴이 있는 경우(모든 에러를 각각 따로 처리 해야함)

do {    // 캐치문에서 구체적인 에러를 케이스별로 처리
    
    let isChecked = try checkingHeight(height: 100)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch HeightError.maxHeight  {    // where절을 추가해서, 매칭시킬 에러패턴에 조건을 추가할 수 있음
    
    print("키가 커서 놀이기구 타는 것 불가능")
    
} catch HeightError.minHeight {      // 생략가능
    
    print("키가 작아서 놀이기구 타는 것 불가능")
    
}



// catch 패턴이 없이 처리도 가능

do {
    
    let isChecked = try checkingHeight(height: 100)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch {    // error 상수를 제공 (모든 에러가 넘어옴): 캐치문을 일반적으로 처리할 때 상수로 바인딩 된다는 의미
    
    // print(error)
    
    // 아래의 코드를 작성하지 않아도 error 상수를 통해 간단한 출력으로 마무리 할 수도 있고, 아래의 코드처럼 다운캐스팅을 통해 구체적인 분기 처리도 가능
    
    print(error.localizedDescription)   // 지역 설정: 예) 한국어로 설정 되어 있으면 한국어 방식으로 출력. 실제 앱에서 많이 사용. 중요 X
    
    // 구체적이지 않은 타입을 열거형 타입으로 다운캐스팅하여 바인딩
    
    if let error = error as? HeightError {    // 실제 우리가 정의한 구체적인 에러 타입이 아니고, 에러 타입(프로토콜)이 넘어올 뿐
        switch error {
        case .maxHeight:
            print("키가 커서 놀이기구 타는 것 불가능")
        case .minHeight:
            print("키가 작아서 놀이기구 타는 것 불가능")
        }
    }
}



/*:
 ---
 * Catch블럭의 처리 (Swift 5.3)
 ---
 */
// 스위프트 5.3 버전 업데이트

do {
    
    let isChecked = try checkingHeight(height: 100)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch HeightError.maxHeight, HeightError.minHeight {   // 케이스 나열도 가능해짐
    
    print("놀이기구 타는 것 불가능")
    
}

//: ---


/*:
 ## 에러를 던지는 함수를 처리하는 함수
 * 에러 정의
 ---
 */
// 에러정의
enum SomeError: Error {
    case aError
}


// 에러를 던지는 함수 정의 (무조건 에러를 던진다고 가정)
func throwingFunc() throws {
    throw SomeError.aError
}


// 에러의 처리

do {
    
    try throwingFunc()
    
} catch {
    
    print(error)
}



/*:
 ---
 * 일반적인 함수로 처리
 ---
 */
// 함수 내부에서 do-catch문으로 에러를 처리
// 즉, 발생한 에러를 catch블럭에서 받아서 알맞은 처리

func handleError() {
    do {
        try throwingFunc()
    } catch {
        print(error)
    }
}


handleError()


/*:
 ---
 * 1 - throwing함수로 에러 다시 던지기
 ---
 */
/**====================================================
 - 함수 내에서 에러를 직접처리하지 못하는 경우, 에러를 다시 던질 수 있음
 ====================================================**/

func handleError1() throws {
    //do {
    try throwingFunc()
    //}                     // catch블럭이 없어도 에러를 밖으로 던질 수 있음 ⭐️
}



do {
    try handleError1()   // 에러를 받아서 처리 가능
} catch {
    print(error)
}


/*:
 ---
 * 2 - rethrowing함수로 에러 다시 던지기(rethrows 키워드)
 ---
 */
/**================================================================
 
 - 에러를 던지는 throwing함수를 파라미터로 받는 경우, 내부에서 다시 에러를 던지기 가능
 
 - rethrows키워드 필요 (Rethrowing메서드)
 
 ==================================================================**/


// 다시 에러를 던지는 함수(방법1)
func someFunction1(callback: () throws -> Void) rethrows {      // 에러를 던질 수 있는 함수를 파라미터로 사용하고 실행할때 다시 에러를 던짐
    try callback()             // 에러를 다시 던짐(직접 던지지 못함)
    // throw (X)
}


// 다시 에러를 던지는 함수(방법2) - 에러변환

func someFunction2(callback: () throws -> Void) rethrows {
    
    enum ChangedError: Error {
        case cError
    }
    
    do {
        try callback()
    } catch {   // catch구문에서는 throw (O)
        throw ChangedError.cError    // 에러를 변환해서 다시 던짐
    }
}




// 실제 에러를 다시던지는(rethrowing)함수를 처리하는 부분

do {
    try someFunction1(callback: throwingFunc)
} catch {
    print(error)
}



do {
    try someFunction2(callback: throwingFunc)
} catch {
    print(error)
}






/*:
 ## 메서드 / 생성자
 * 메서드 / 생성자에 throw키워드의 적용
 ---
 */
/**=======================================================================
 
 - 에러는 1)Throwing함수 뿐만아니라, 2) 메서드와 3)생성자에도 적용 가능
 
 - 에러는 던질 수 있는 메서드는 Throwing메서드, 에러는 던질 수 있는 생성자는 Throwing생성자
 
 =========================================================================**/

// 에러 정의

enum NameError: Error {
    case noName
}



// 생성자와 메서드에도 적용 가능
class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("수업을 올바르게 생성")
        }
    }
    
}



// 에러 처리 (생성자에 대한)

do {
    var course = try Course(name: "스위프트 클래스")
} catch NameError.noName {
    print("객체가 생성되지 않음")
}



do {
    let _ = try Course(name: "스위프트5")
} catch NameError.noName {
    print("이름이 없어 수업이 생성 실패하였습니다.")
}



/*:
 ---
 * 생성자와 메서드의 재정의
 ---
 */

class NewCourse: Course {
    
    override init(name: String) throws {
        try super.init(name: name)
        
    }
}


/**=================================================================
 - Throwing 메서드/생성자는 재정의할 때, 반드시 Throwing메서드/생성자로 재정의해야함
   (Throwing 메서드/생성자를 일반 메서드/생성자로 재정의 불가)

 - 일반 메서드/생성자를 Throwing 메서드/생성자로 재정의 하는 것은 가능
   (일반 메서드/생성자의 범위가 더 큼)
 
 [상속관계에서]
 - (상위) throws    (하위) throws재정의    (O 가능)
 
 - (상위) 일반       (하위) throws재정의    (O 가능)
   (상위) throws    (하위) 일반재정의       (X 불가능)
 
 - (상위) throws    (하위) rethrows재정의  (O 가능)
   (상위) rethrows  (하위) throws재정의    (X 불가능)

 - Throwing메서드와 Rethrowing메서드를 비교하면 Rethrowing메서드의 범위가 더 작음
 
 ===================================================================**/




 
//: ---

/*:
 ## Defer문
 * 할일을 미루는 defer문에 대한 이해
 ---
 */
// defer문은 코드의 실행을 스코프가 종료되는 시점으로 연기시키는 문법

// 일반적인 사용은, 어떤 동작의 마무리 동작을 특정하기 위해서 사용 (정리의 개념)


func deferStatement1() {
    
    defer {     // 할일을 미루는 것
        print("나중에 실행하기")
    }
    
    print("먼저 실행하기")
}

deferStatement1()






func deferStatement2() {
    
    if true {
        print("먼저 실행하기")
        return
    }
    
    defer {                   // 디퍼문이 호출되어야, 해당 디퍼문의 실행이 예약되는 개념
        print("나중에 실행하기")
    }
}

deferStatement2()






// 등록한 역순으로 실행  ====> 일반적으로 하나의 디퍼문만 사용하는 것이 좋음

// 3 2 1

func deferStatement3() {
    
    defer {
        print(1)
    }
    defer {
        print(2)
    }
    defer  {
        print(3)
    }
}

deferStatement3()





// 어떻게 실행될까?

for i in 1...3 {
    defer { print ("Defer된 숫자?: \(i)") }
    print ("for문의 숫자: \(i)")
}

