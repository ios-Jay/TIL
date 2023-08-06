import UIKit

// 열거형과 Switch문

// 열거형의 정의와 Switch문을 통한 활용

// 열거형에 대한 구체적인 처리는 스위치(switch)문과 함께 쓸때, 사용성이 높아짐

// 로그인 타입을 정의

enum LoginProvider: String {      // 3가지로 정의
    case email
    case facebook
    case google
}


let userLogin = LoginProvider.facebook




// 열거형은 한정된 사례로 만든 타입이고,
// 스위치문은 표현식에 대한 분기처리에 최적화

switch userLogin {                   // 3가지로 분기처리
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
case .google:
    print("구글 로그인")
}




// 물론 특정한 경우도 처리 가능

if LoginProvider.email == userLogin {
    print("이메일 로그인")
}

