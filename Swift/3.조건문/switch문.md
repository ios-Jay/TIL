## 2) Switch문

- 표현식/변수를 (매칭시켜) 분기처리할때 사용하는 조건문

> #### _if문보다 한정적인 상황에서 사용_

```
var choice: String = "바위"

```

- 조건을 부등식이 아닌 "=="와만 비교

- 변수가 어떤값을 가지냐에 따라 실행문을 선택하고 진행

```
switch choice {   // 변수(표현식)

case "가위":       // "가위" == "가위" <--- 위의 변수(표현식)에서 나올 수 있는 값들의 사례

    print("가위 입니다.")

case "바위", "보":                        <--- 케이스를 ,(콤마)로 연결 가능. 또는(or)의 의미

    print("바위 또는 보 입니다.")

case "보":

    print("보 입니다.")

default:       <--- 케이스가 변수에서 도출 가능한 모든 케이스를 다루지 않는 경우, default 케이스 필요. 케이스는 하나도 빠뜨리는 것 없이 철저해야(exhausitive)만 하기 때문
    break      <--- 실행하려는 코드가 없을 때, switch문에서는 break 키워드를 반드시 입력해야함
}

// 매칭된 값에 대한 고려 없이, 무조건 다음 문장도 실행하고 싶을 땐, fallthrough 키워드 사용

var isTrue = true


switch isTrue {

case true:

    print("true")

case false:

    print("false")

}

```

##### [스위치문의 특징]

1.  스위치문에서 케이스의 ,(콤마)는 또는의 의미로 하나의 케이스에
    여러 매칭값을 넣을 수 있음

2.  switch 문은 (비교하고 있는)값의 가능한 모든 경우의 수를 반드시
    다루어야 함 (exhaustive: 하나도 빠뜨리는 것 없이 철저한)
    모든 사례를 다루지 않았을 때에는 디폴트 케이스가 반드시 있어야 한다.

3.  각 케이스에는 문장이 최소 하나 이상 있어야 하며 만약 없다면 컴파일
    에러 발생(의도하지 않은 실수를 방지 목적)

4.  실행하지 않으려면, break를 반드시 입력해야함 (if문에서는 실행문을
    입력안해도 괜찮지만, 스위치문에서는 필요함)

### fallthrough 키워드의 사용

```
var num1 = 10

switch num1 {

case ..<10:

    print("1")        // 매칭된 값에 대한 고려없이 무조건 다음블럭을 실행함

    fallthrough

case 10:

    print("2")

    fallthrough

default:

    print("3")

}

```

### switch문의 범위 매칭 - 패턴 매칭 연산자와 관련

- ⭐️ 잘못 작성된 예시

> 비교연산자와 값을 넣으면 안되고, 비교하려는 값이 와야함

```

switch temperature {

 case  < 0 :    //이런식으로 작성하면 안된다. ==>   ..<0

     print("영하 - 0미만")

 case >= 0 && <= 18 :     //이런식으로 작성하면 안된다. ==>   0...

     print("0이상 무덥지 않은 날씨")

 default :

     break
 }

```

> ##### 부등식을 사용될 수 없는 대신에, 범위 매칭을 지원: ⭐️ 범위연산자, 패턴매칭 연산자 (참과 거짓의 결과가 나옴)

- if 조건문의 경우 비교하려는 범위를 제시하고 switch문에서는 비교하려는 값을 제시

###### Switch문의 패턴매칭: 케이스를 범위로 구성할 수 있는 경우

```

var age = int.random(in: 10...49)

switch age {

    case 10...19: <--- 내부 구현 논리 10...19 ~= age: 오른쪽에 있는 변수가 왼쪽의 범위에 포함되는 값인지에 따라 참과 거짓 여부를 알려주는 연산자

    code <--- 부등식(<=, >)을 사용할 수 없음. 범위연산자로 만들어진 범의의 값으로 케이스를 정의해야 함.

    case 20...29:   // 20...29 ~= age

    code

    case 30...39:   // 30...39 ~= age

    code

    case 40...49    // 40...49 ~= age

    default:

    break

}



var num = 30

0...50 ~= num

// 0...50 == 0부터 50까지의 범위(1 , 2 , 3...50)

51...100 ~= num

switch num {

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

```

> #### _이해보다는 여러번 안보고 직접 작성해보는 것이 중요 ⭐️_

## 3) Switch문의 활용

- 스위치문과 밸류바인딩(Value Binding)

##### 바인딩의 일반적인 의미

```
var a = 7


let b = a     // 바인딩을 한다. (다른 변수/상수의 새로운 식별자로 할당한다.)

```

> #### _바인딩: 다른 새로운 변수/상수 식별자로 할당_

##### 스위치문에서의 바인딩

```
var num = 6


switch num {

case let a:      // let a = num

    print("숫자: \(a)")

default:

    break
}

```

### 스위치문과 where절 (스위치문에서 조건을 확인하는 방식)

- 일단 다른 상수 값에 바인딩한(넣은) 후, 조건절(참/거짓 문장)을 통해 다시 한번 더 조건 확인

- (바인딩 된 상수는 케이스블럭 내부에서만 사용 가능하고, 상수 바인딩은 주로 where절하고 같이 사용됨)

###### where절은 대부분 밸류바인딩 패턴과 함께 사용

```

var num = 7

switch num {

case let x where x % 2 == 0:      // let x = num

// num 변수를 x 상수에 바인딩한 후, where 조건절에서 케이스가 조건에 해당하는지 여부를 확인할 수 있도록 함

    print("짝수 숫자: \(x)")

case let x where x % 2 != 0:

    print("홀수 숫자: \(x)")

default:

    break
}

switch num {

case let n where n <= 7:         // let n = num

   print("7이하의 숫자: \(n)")

default:

   print("그 이외의 숫자")

}

```

> #### _where키워드는 조건을 확인하는 키워드_
