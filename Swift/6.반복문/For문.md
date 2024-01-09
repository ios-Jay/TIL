# 반복문(Loops): For문

> ###### 프로그래밍의 기본원리

모든 프로그래밍은 아래의 세가지 논리로 이루어 진다.

1. 순차

2. 조건(+ 데이터)

3. 반복

## 1)For문

- For문의 기본 형태

> ###### 범위 or 컬렉션에서 item을 한개씩 뽑아, 중괄호 안에서(각각 한번씩 순차적으로) 반복 실행함을 의미

```

for item in 범위 or 컬렉션 {

    // item: 중괄호 내부에서 사용할 상수 이름

    // 범위 or 컬렉션: Int 범위 / 문자열 / 컬렉션(배열, 딕셔너리, Set)

    code <- 중괄호 안에는 범위 내의 각 아이템에 따라 순차적으로 실행할 코드를 배치


}

```

#### 스위프트 스타일의 문법은 직관적이고 쉽게 작성이 가능하도록 되어있음

```
for index in 1...5 {

    // let index = 1, let index = 2, let index = 3, let index = 4, let index = 5

    print("For문 출력해보기: \(index)")
}

for index in 1...4 {

    print("\(index)에 5를 곱하면 \(index * 5)")

}

// 이런 방식으로 많이 활용

var number = 10


for i in 1...number {
    print(i)
}



```

> ##### 참고

C언어 / Java 스타일의 for 문 ====> 다른 언어들에 비해 엄청 읽기 쉽고 간결한 형태로 이루어짐

for(int i = 0; i <= 5; i++) {
}

### 참고) 와일드 카드 패턴

- 일반적으로 상수 / 변수로 저장할 필요 없이, 생략해도 되는 경우 사용

#### 와일드 카드 패턴 (\_) (언더바)은 스위프트에서 생략의 의미!

```
for _ in 0...10 {

    print("hello")
}
// _(under bar):생략의 의미


let _ = "문자열"


(1...10).reversed()



let a = (1...10).reversed()

print(a)

```

### 배열 등 컬렉션 타입에서도 사용 가능

#### 컬렉션에서 각 아이템을 차례 차례 한번씩 뽑아서 중괄호 안에서 사용

```
let list = ["Swift", "Programming", "Language"]


for str in list {
    print(str)
}

```

### 문자열에서도 사용 가능

##### 문자열에서 각 문자를 차례 차례 한개씩 뽑아서 중괄호 안에서 사용

```
for chr in "Hello" {

    print(chr)

    //print(chr, terminator: " ")     //다음줄로 넘어가지 말고, 한칸을 띄워라
}

```

### 특정한 함수 활용 가능

> ###### 참고) For문의 범위에서 많이 사용되는 함수 소개

```
for item in 범위 {

    범위: (1...10).reversed() -> 숫자를 역순으로 정렬하는 함수
         Stride(from:1, to:15, by:2) -> 숫자를 특정 간격(띄엄띄엄)으로 범위를 생성하는 함수


Code

}

```

##### 역순으로 바꾸기

```
for number in (1...5).reversed() {

    print(number)

}
```

##### 홀수 또는 홀수만 뽑아내기

```
for number in stride(from: 1, to: 15, by:2) {

    //마지막 숫자는 포함하지 않음

    print(number)
}
```

> #### stride: 성큼성큼 걷다.

```
let range = stride(from: 1, to: 15, by: 2)     //  StrideTo<Int>
print(range)
// 1, 3, 5, 7, 9, 11, 13

for i in range {
    print(i)
}


let range1 = stride(from: 1, through: 15, by: 2)     // StrideThrough<Int>
print(range1)
// 1, 3, 5, 7, 9, 11, 13, 15

for i in range1 {

    print(i)
}



let range2 = stride(from: 10, through: 2, by: -2)      //   StrideThrough<Int>
print(range2)
// 10, 8, 6, 4, 2


for i in range2 {
    print(i)
}

```

## For문 주의점

- for문에서 선언하는 변수(상수)에 대한 정확한 이해

> ##### 1) for문에서 선언하는 상수(임시상수)에 대한 정확한 이해

```
for item in 1...5 {

    // let item: int = 1 로 설정한 후, 중괄호 한번 실행을 의미

    // 그리고 다음주기에 재설정(let item = 2) 한 후 다시 실행 ... 반복

Code

}

```

###### 변수로 취급하고 싶다면?

- 다른 변수에 다시 담아서 사용해야함

> 참고: for var item in 1...5 {}도 사용은 가능하지만 곧 없어질 문법

```
for item in 1...5 {

    var i = item
}


```

- 1.  for문이 진행되는 동안 사용이 되는 임시적인 상수(let)이다. (정확한 용어로 반복상수)

- 2.  for문에서 선언하는 변수(상수)는 for문 내에서만 사용이 가능하다.

```
var name = "홍길동"


for name in 1...5 {

    /*

     이 name은 범위랑 가장 가까이 있는, 가장 가까이에 선언된 반복 상수 name을 출력한다.

     그래서 이 반복문에서는 이 for문 내에 있는 반복상수 name을 출력한다.

     위에 선언된 변수 name이 아니라

     */

    print(name)
}



for n in 1...5 {

     // name이 아닌 n이라고 다르게 선언함으로서 변수 name을 출력할 수 있다.

    print(name)
}


// print(n)

```

> ##### 2) for문에서 선언하는 변수는 for문 내에서만 사용이 가능(Scope와 관련)

###### 중괄호는 변수가 적용 가능한 범위를 의미

```
for item in 1...5 {

    var name = "jobs"

}

print(item)     // 에러(접근불가)

print(name)     // 에러(접근불가)


```

> ###### 코딩에서의 대원칙: 중괄호 내에서 밖의 변수는 접근 가능, 중괄호 밖에서 중괄호 내부의 변수는 접근 불가능

- 1.  for문 내부에서는 외부에 선언된 변수에는 접근이 가능하다.

- 2.  for문 내부에서 새롭게 선언한 변수에는 외부에서 접근이 불가능하다.

```
var sum = 0

for i in 1...10 {
    sum += i
}

print(sum)

/*

 sum += 1 == sum = sum + 1(복합할당연산자)

 sum = 0 + 1

 sum = 1 + 2

 sum = 3 + 3...

 sum = 45 + 10

 */



for index in 1...5 {

    print("For문 출력해보기: \(index)")
    print(name)
    var realName = "잡스"
    print(realName)
}


// print(realName)

```
