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

