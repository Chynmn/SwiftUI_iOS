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

// 반복문에서 빠져나오기
var j = 10

for _ in 0 ..< 100 {
    j += j
    
    if j > 100 {
        break
    }
    print("j = \(j)")
}

