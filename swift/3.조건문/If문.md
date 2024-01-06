# 프로그래밍의 기본원리와 조건문

### _모든 프로그래밍은 세가지 논리로 이루어 진다._

1. 순차

2. 조건(+데이터)

3. 반복

### _순차: 개발자가 정한 규칙에 따라 순차적으로(차례대로) 실행한다._

## 1) 조건문(if문)

- 참(true) 또는 거짓(false)의 특정 조건에 따라 특정 코드만 실행하게 할 수 있는 문장

#### 조건문(if문)

```
var number = 100



if number <= 100 {

    print("100보다 작거나 같다.")
}

```

### _"조건"의 자리에는 결과가 참 또는 거짓이 나와야함_

#### 조건문(if - else)

```
 number = 150


if number <= 100 {

    print("100보다 작거나 같다.")

}
 else { // else 문에는 조건이 오는 것이 아니다. else if와는 다름

    print("100보다 크다.")
}

```

#### if - else if - else

```
number = 50

if number <= 10 {

    print("10보다 작거나 같다.")

} else if number >= 30 {

    print("30보다 크거나 같다.")

} else {

    print("10보다 크고 30보다 작거나 같다.")

}
```

#### if - else if

```
number = 72

if number <= 10 {

    print("10보다 작거나 같다.")

} else if number >= 30 {

    print("30보다 크거나 같다.")
}

```

### 1) if문에서는 논리적인 구조 및 조건의 순서가 중요

#### 논리적인 오류가 없도록 구성해야함

```
var num = 8


if num >= 0 {

    print("0 또는 양수입니다.")

} else if num % 2 == 0 {

    print("양의 짝수입니다.")

} else if num % 2 == 1 {

    print("양의 홀수입니다.")

} else {

    print("음수입니다.")

}

```

#### 올바르게 수정해 본다면?

```
if num >= 0 {

    print("0 또는 양수입니다.")

    if num % 2 == 0 {

        print("짝수입니다.")

    } else if num % 2 == 1 {

        print("홀수입니다.")
    }

} else {

    print("음수입니다.")
}

```

#### 조건의 확인 순서를 잘 고려해야함

```
var score = 100


if score >= 70 {

    print("70점이상입니다.")

} else if score >= 80 {

    print("80점이상입니다.")

} else if score >= 90 {

    print("90점이상입니다.")

} else {

    print("70점미만입니다.")

}

```

#### 올바르게 수정해 본다면

```
if score >= 90 {                // 범위가 작은 조건이 먼저 와야함
    print("90점이상입니다.")
} else if score >= 80 {
    print("80점이상입니다.")
} else if score >= 70 {
    print("70점이상입니다.")
} else {
    print("70점미만입니다.")
}

```

### 2) 조건을 &&(and), 또는 ||(or)로 연결하는 것도 가능

```
var email = "ios.developer.jay@gmail.com"

var password = "*****"



if email == "ios.developer.jay@gmail.com" && password == "*****" {

    print("메인페이지로 이동")
}



if email != "ios.developer.jay@gmail.com" || password != "*****" {

    print("경고메세지 띄우기")

    print("이메일주소 또는 패스워드가 올바르지 않습니다.")

}

```

### 3) 중첩 사용 가능

```
var score1 = 81;

if score1 >= 70 {

    if score1 == 100 {
        print("만점")
    } else {
        print("70점이상")
    }

}
```

#### _프로그래밍에서는 타입만 일치하면 언제든지 중첩이 가능(2중, 3중 상관없음)_
