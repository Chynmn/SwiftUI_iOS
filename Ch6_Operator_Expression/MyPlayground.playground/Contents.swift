import UIKit

var myResult = 1 + 2    // 피연산자는 숫자, 변수, 상수가 혼합하여 사용될 수 있다.

var x: Int? // 옵셔널 Int  변수 선언
var y = 10  // 두 번째 Int 변수 선언과 초기화
x = 10      // x에 값 할당
x = x! + y  // 언래칭한 x와 y의 합을 x에 할당
x = y       // y의 값을 x에 할당

var z = 0
z = x! + y
print(z)
z = x! - y
print(z)
z = x! * y
print(z)
z = x! / y
print(z)
z = x! % y
print(z)

var flag = true
var secondFlag = !flag

// 닫힌 범위 연산자 5...8 -> 5,6,7,8    5..<8 -> 5,6,7

// 삼항 연산자
let a = 10
let b = 20

print("Largest number is \(a > b ? a : b)")

// Not bit operator (~) : 0 -> 1, 1 -> 0
let q = 129
let w = ~q
print("Result is \(w)")

// And bit operator (&) : 비트 단위로 비교하여 비트가 모두 1이면 1이 된다.
let e = 171
let r = 3
let t = e & r
print("Result is \(t)")

// OR bit operator (|) : 비트 단위로 비교하여 둘 중 하나라도 1이면 1이 된다.
let u = e | r
print("Result is \(u)")

// XOR bit operator (^) : 두 개의 비트중 하나만 1일 때 1이 된다.
let i = e ^ r
print("Result is \(i)")

// 왼쪽 시프트 비트 연산 (<<) : 정숫값을 2배로
// 오른쪽 시프트 비트 연산 (>>) : 정숫값을 1/2배


