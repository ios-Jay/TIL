import UIKit

// 패턴 매칭 연산자:숫자가 범위 내에 있는지 확인하는 연산자

var age = 20

1...9 ~= age // false

10...19 ~= age // false

20...29 ~= age // true

30...39 ~= age // false


let range = 1...100

range ~= 65

print(range ~= 65) // ->true 출력

// 결과 값은 참과 거짓

// - 10 <= n <= 100 이런 문장은 스위프트에서 성립하지 않는다.**



var n = 20


if n >= 10 && n <= 100 {
    print("10이상, 100이하입니다.")
}


if 10...100 ~= n {
    print("10이상, 100이하입니다.")
}



var age1 = 31


if 20...29 ~= age1 {
    print("20대 입니다.")
}




// 스위치문은 내부적으로 패턴매칭 연산자로 구현이 되어있음


switch age1 {
case 20...29:
    print("20대 입니다.")
case 30...39:
    print("30대 입니다.")
default :
    break
}
