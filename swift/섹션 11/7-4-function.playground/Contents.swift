import UIKit

// 함수의 오버로딩(overLoading)

// 함수의 오버로딩에 대한 이해

// 오버로드(overload):영어로 '과적하다' 라는 뜻

// 같은 이름의 함수에 매개변수(파라미터)를 다르게 선언하여, 하나의 함수 이름에 실제 여러개의 함수를 대응 시키는 것

// ===> 쉽게말하면: 함수의 이름의 재사용


// 스위프트는 오버로딩을 지원하는 언어

// ⭐️ 함수이름, 파라미터 수/자료형, 아규먼트 레이블, 리턴형을 모두포함해서 함수를 식별

func doSomething(value: Int) {
    print(value)
}


func doSomething(value: Double) {
    print(value)
}


func doSomething(value: String) {
    print(value)
}


func doSomething(_ value: String) {
    print(value)
}


func doSomethging(value1: String, value2: Int) {
    print(value1, value2)
}




doSomething(value: 5)

doSomething(value: 3.4)

doSomething(value: 3)

// 오버로딩을 지원하지 않는 언어의 단점

// 같은 기능을 제공하는 함수를 파라미터 형식마다 이름을 다르게 구현해야하기 때문에 함수의 이름이 많아지고, 구별해서 사용하는 것이 어렵다.

// 실제 애플에서 만들어놓은 함수들에도 오버로딩을 사용한 함수들이 많음

//print(<#T##items: Any...##Any#>, to: &<#T##TextOutputStream#>)

//print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)

//print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>, to: &<#T##TextOutputStream#>)
