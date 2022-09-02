import UIKit

/*
 func <함수명> (<매개변수 이름: <매개변수 타입>,
                <매개변수 이름>: <매개변수 타입>, ... ) -> <반환 결과 타입> {
    // 함수 코드
 }
 */

// 매개변수를 받지 않고 결과를 반환하지도 않으며 출력만 하는 함수
func sayHello() {
    print("Hello")
}

sayHello()

// 매개변수로 문자열 하나와 정수 하나를 받으며 문자열 결과를 반환
let userName = "Hyunmin"
var cnt = 51

func buildMessageFor(name: String, count: Int) -> String {
    "\(name), you are customer number \(count)" // 함수가 단일 표현식을 가지고 있다면 return을 생략하고 사용 가능
    return "\(name), you are customer number \(count)"
}

var message = buildMessageFor(name: userName, count: cnt)
print(message)

_ = buildMessageFor(name: "John", count: 100)   // 반환된 결과값을 사용하지 않고 버리는 경우


/*
 지역 매개변수명(local parameter name) : 함수 코드 내에서 참조할 수 있는 이름을 할당한 매개변수로 구성
 외부 매개변수명(external parameter name) : 함수가 호출될 떄 참조되는 매개변수의 이름
 ➣ 위의 함수의 선언부 'name', 'count'는 지역 매개변수명이자 외부 매개변수명으로 사용
 매개변수에 할당된 디폴트 외부 매개변수명은 아래와 같이 앞에 밑줄 문자를 써서 없앨 수 있다.
 */
func buildMessageFor2(_ name: String, _ count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
 message = buildMessageFor2("Chynmn", 24)
print(message)


// 함수 선언부에서 지역 매개변수명 앞에 외부 매개변수명을 선언하면 외부 매개변수명이 추가됨.
func buildMessageFor3(userName name: String, userCount count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
message = buildMessageFor3(userName: "Mr.Cho", userCount: 32)
print(message)


// 함수에 디폴트 매개변수 선언하기 -> 함수가 호출될 때 인자로 쓸 값이 들어오지 않은 경우에 사용. 함수 선언 시 디폴트 값을 할당
func buildMessageFor4(_ name: String = "Customer", count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
message = buildMessageFor4(count: 18)
print(message)
message = buildMessageFor4("Jayson", count: 29)
print(message)

// 여러 결과값 반환하기 -> 결과값들을 튜플로 래핑하는 방식
func sizeConverter (_ length: Float) -> (yards: Float, centimeters: Float, meters: Float) {
    let yards = length * 0.0277778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    
    return (yards, centimeters, meters)
}

let lengthTuple = sizeConverter(20)
print(lengthTuple.yards)
print(lengthTuple.centimeters)
print(lengthTuple.meters)


// 가변개수 매개변수 : 함수가 호출될 때 함수가 받게 될 매개변수가 몇 개인지 알 수 없는 경우
func displayStrings(_ strings: String...) {
    for string in strings {
        print(string)
    }
}
displayStrings("one", "two", "three", "four")


// 변수인 매개변수 : 매개변수는 기본적으로 상수 취급. 따라서 함수내에서 매개변수 값을 변경하고 싶다면 매개변수의 shadow copy를 생성해야 한다.
func calculateArea (length: Float, width: Float) -> Float {
    var length = length // shadow copy
    var width = width
    
    length = length * 2.54
    width = width * 2.54
    return length * width
}
print(calculateArea(length: 10, width: 20))

// 입출력 매개변수로 작업하기
var myValue = 10

func doubleValue(_ value: Int) -> Int {
    var value = value
    value += value
    return value
}

print("Before function call myValue = \(myValue)")

print("doubleValue call returns \(doubleValue(myValue))")

print("After function call myValue = \(myValue)\n")

// 위의 결과에서 함수가 값을 반환한 뒤에도 매개변수에 대한 변경을 유지하려면 함수 선언부 내에서 매개변수를 입출력 매개변수(in-out parameter)로 선언해야 한다.
func doubleValue2(_ value: inout Int) -> Int {
    // var value = value 삭제
    value += value
    return value
}

print("Before function call myValue = \(myValue)")
print("doubleValue call returned \(doubleValue2(&myValue))")
print("After function call myValue = \(myValue)\n") // myVlaue 변수에 값이 할당되도록 함수가 수정되었음

// 매개변수인 함수 : 함수가 데이터 타입처럼 취급될 수 있음
// 장점 : 상수, 변수에 할당된 함수는 여러 데이터 타입의 기능을 가질 수 있다는 점. 함수는 다른 함수의 인자로 전달될 수 있으며 함수의 반환값으로 반환될 수 있음
// 함수의 데이터 타입 : 받게 될 매개변수의 데이터 타입과 반환됭 데이터 타입을 조합하여 결정됨.
func inchesToFeet(_ inches: Float) -> Float {
    
    return inches * 0.0833333
}

func inchesToYards (_ inches: Float) -> Float {
    
    return inches * 0.0277778
}
let toFeet = inchesToFeet
let toYards = inchesToYards

let result = toFeet(10)

func outputConversion(_ converterFunc: (Float) -> Float, value: Float) {
    
    let result = converterFunc(value)
    
    print("Result of conversion is \(result)")
    // 함수가 호출될 때 미리 선언한 데이터 타입과 일치하는 함수가 전달되어야 한다.
}

outputConversion(toYards, value: 10)    // 야드로 변환하기
outputConversion(toFeet, value: 10)     // 피트로 변환하기

// 함수의 타입을 반환 타입으로 선언하면 함수도 데이터 타입으로 반환될 수 있음
func decideFunction(_ feet: Bool) -> (Float) -> Float {
    // 불리언 매개변수의 값에 따라 우리가 만든 toFeet 함수나 toYards 함수 타입을 반환하도록 구성
    if feet {
        return toFeet
    } else {
        return toYards
    }
}
