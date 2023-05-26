import UIKit

// 옵셔널 타입 사용하기

// 옵셔널 타입:값이 없을 수도 있는 경우를 포함하는(감싸고) 있는 임시적 타입

var num: Int?
var str: String? = "안녕하세요"


print(num)
print(str)


// 옵셔널값을 추출하는 4가지 방법

// 1) 강제로 값을 추출(Forced Unwrapping):값이 있다는 것이 확실할때 사용

// 강제 추출연산자 !를 옵셔널표현식 뒤에 붙여서 강제로 옵셔널값을 추출



print(str!)


//print(num!)       // 에러


// 2) if문으로 nil이 아니라는 것을 확인한 후, 강제로 벗기기

if str != nil {
    print(str!)
}


// 3) 옵셔널 바인딩 (if let 바인딩)

// 옵셔널 바인딩 - 바인딩이 된다면, 특정 작업을 하겠다는 의미

if let s = str {    // s라는 상수에 담긴다면    // nil
    print(s)
}





var optionalName: String? = "홍길동"



if let name = optionalName {
    print(name)
}



// 실제 앱을 만들때 guard let 바인딩 많이 사용

func doSomething(name: String?) {
    guard let n = name else { return } //optional("hello")
    print(n)
}


doSomething(name: "hello")

// 4) 닐 코얼레싱 (Nil-Coalescing) 연산자를 사용하는 방법

// 코얼레싱(coalesce): 영어로 (더 큰 덩어리로) 합치다는 뜻


// 옵셔널 타입에 대하여, 디폴트(기본)값을 제시할 수 있을 때 사용
// (직접 값을 벗겨서 사용하는 것은 아니고, 디폴트값 제시를 통해 옵셔널 가능성을 없애는 방법)


// String? ====> String


var serverName: String? = "홍길동"


var userName = serverName ?? "미인증사용자"    // String타입




var hello = "인사하겠습니다. " + (str ?? "Say, Hi")
print(hello)



str = nil
print(str ?? "Say, Hi")



// 백그라운드 기본 색상이 선택이 안되어 있으면 ====> 회색
