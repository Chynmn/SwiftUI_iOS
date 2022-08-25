import UIKit

/*
 switch 구문을 사용하는 이유? : 많은 수의 조건을 처리하기 위함
 switch 표현식 {
    case 일치하는 값1:
        코드 구문
    case 일치하는 값2:
        코드 구문
    case 일치하는 값3, 일치하는 값4:
        코드 구문
    default:
        코드 구문
 }
 */

var value = 4

switch (value) {
    case 0:
        print("zero")
    
    case 1:
        print("one")
    
    case 2:
        print("two")

    case 3:
        print("three")
        
    case 4:
        print("four")
        
    case 5:
        print("five")
        
    default:
        print("Integer out of range")
}

// case 구문 결합
value = 1

switch (value) {
    case 0, 1, 2:
        print("zero, one or two")

    case 3:
        print("three")
        
    case 4:
        print("four")
        
    case 5:
        print("five")
        
    default:
        print("Integer out of range")
}

// 범위 매칭
var temperature = 83

switch (temperature) {
    case 0...49:
        print("Cold")
    
    case 50...79:
        print("Warm")
    
    case 80...110:
        print("Hot")
    
    default:
        print("Temperature out of range")
}

// where 구문 사용 -> case 구문에 부가적인 조건을 추가하기 위해 사용
temperature = 54

switch (temperature) {
    case 0...49 where temperature % 2  == 0:
        print("Cold and even")
    
    case 50...79 where temperature % 2  == 0:
        print("Warm and even")
    
    case 80...110 where temperature % 2  == 0:
        print("Hot and even")
    
    default:
        print("Temperature out of range or odd")
}

// fallthrough 구문 : switch 구현부에 예외상황 효과를 주어, 실행 흐름이 그 다음의 case 구문으로 계속 진행하게 할 수 있다.
temperature = 10

switch (temperature) {
    case 0...49 where temperature % 2  == 0:
        print("Cold and even")
        fallthrough
    
    case 50...79 where temperature % 2  == 0:
        print("Warm and even")
        fallthrough
    
    case 80...110 where temperature % 2  == 0:
        print("Hot and even")
        fallthrough
    
    default:
        print("Temperature out of range or odd")
    /*
     default: 아무런 작업을 할 필요가 없을 때
        break <- 사용
     */
}
