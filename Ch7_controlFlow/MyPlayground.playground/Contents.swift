import UIKit

/* looping control
 for-in 구문
 for 상수명 in 컬렉션 또는 범위 {
        실행될 코드
 }
 */

for index in  1...5 {
    print("Value of index is \(index)")
}

var count = 0
for _ in 1...5 {
    // 현재 값에 대한 참조체가 필요없다.
    count += 1
}

/*
 while 조건문 {
    // 조건문이 true인 동안 실행될 스위프트 구문
 }
 */

var myCount = 0

while myCount < 100 {
    myCount += 1
}

/*
 repeat...while 반복문 <- do..while문 대체
 repeat {
    // 적어도 한 번은 실행되어야 하는 스위프트 구문 ex) 배열 안의 항목들 중에 특정 항목을 찾을 떄까지 둘러봐야할 경우
 } while 조건식
 */

var i = 10
repeat {
    i -= 1
} while (i > 0)

// 반복문에서 빠져나오기 break문
var j = 10

for _ in 0 ..< 100 {
    j += j
    
    if j > 100 {
        break
    }
    print("j = \(j)")
}

// continue문
var k = 1

while k < 20 {
    k += 1
    if(k % 2) != 0 {
        continue
    }
    print("k = \(k)")
}

/* flow control
 if구문
 if 조건식 {
    // 조건식이 true일 때 수행될 스위프트 코드
 }
 */

let x = 10

if x > 9 {
    print("x is greater than 9!")
}

/*
 if 조건식 {
    // 조건식이 true일 때 수행될 스위프트 코드
} else {
    // 조건식이 false일 때 수행될 스위프트 코드
 }
 */

let y = 8

if y > 9 {
    print("y is greater than 9!")
} else {
    print("y is less than 9!")
}

let z = 11

if z == 10 {
    print("z is 10")
} else if z == 9 {
    print("z is 9")
} else if z == 11 {
    print("z is 11")
}

/* guard 구문 : 특정 조건을 만족하지 않은 경우에 현재의 함수 또는 반복문에서 빠져나올 수 있게 해준다.
 guard <조건문(불리언 표현식)> else {-> 현재의 코드에서 빠져나가는 구문(return, break, continue, throw)을 포함해야함
                                   or 자기자신을 반환하지 않는 다른 함구나 메서드를 호출 할 수 있다.
    // 조건문이 false일 때 실행될 코드
    <종료구문>
 }
    // 조건문이 true일 때 실행될 코드
 */

func multiplyByTen(value: Int?) {
    guard let number = value, number < 10 else {
        print("Number is too high")
        return
    }
    
    let result = number * 10
    print(result)
}
