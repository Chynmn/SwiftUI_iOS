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
// 문자열 값들을 매개변수로 받아 출력
displayStrings("one", "two", "three", "four")


// 변수인 매개변수 : 매개변수는 기본적으로 상수 취급. 따라서 함수내에서 매개변수 값을 변경하고 싶다면 매개변수의 shadow copy를 생성해야 한다.
func calculateArea (length: Float, width: Float) -> Float {
    var length = length // shadow copy -> 지역변수의 특성 때문인 것 같음.
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
// 매개변수는 해당 함수 내에서 상수 취급하고, 매개변수의 값을 변경하고 싶을 때에는 shadow copy를 사용하기 때문에, 기본적으로 원본 변수에 반영되지 않는다.
print("Before function call myValue = \(myValue)")
print("doubleValue call returns \(doubleValue(myValue))")
print("After function call myValue = \(myValue)\n")

// 위의 결과에서 함수가 값을 반환한 뒤에도 매개변수에 대한 변경을 유지하려면 함수 선언부 내에서 매개변수를 입출력 매개변수(in-out parameter)로 선언해야 한다.
func doubleValue2(_ value: inout Int) -> Int {
    // var value = value -> shadow copy 삭제
    value += value
    return value
}

print("Before function call myValue = \(myValue)")
print("doubleValue call returned \(doubleValue2(&myValue))")    // 단, 함수를 호출 할 때 매개변수 앞에 &를 붙여야 한다.
print("After function call myValue = \(myValue)\n") // myVlaue 변수에 값이 할당되도록 함수가 수정되었음

// 매개변수인 함수 : 함수가 데이터 타입처럼 취급될 수 있음
// 장점 : 상수, 변수에 할당된 함수는 여러 데이터 타입의 기능을 가질 수 있다는 점. 함수는 다른 함수의 인자로 전달될 수 있으며 함수의 반환값으로 반환될 수 있음
// 함수의 데이터 타입 : 받게 될 매개변수의 데이터 타입과 반환될 데이터 타입을 조합하여 결정됨.
func inchesToFeet(_ inches: Float) -> Float {
    
    return inches * 0.0833333
}

func inchesToYards (_ inches: Float) -> Float {
    
    return inches * 0.0277778
}
let toFeet = inchesToFeet
let toYards = inchesToYards

let result = toFeet(10)

// 단위를 변환하고 결과를 출력하는 함수가 필요. 부동소수를 매개변수로 받고 부동소수 결과를 반환하기 위해 (Float) -> Float 를 사용
func outputConversion(_ converterFunc: (Float) -> Float, value: Float) {
    
    let result = converterFunc(value)
    
    print("Result of conversion is \(result)")
    // 함수가 호출될 때 미리 선언한 데이터 타입과 일치하는 함수가 전달되어야 한다.
}

outputConversion(toFeet, value: 100)     // 피트로 변환하기
outputConversion(toYards, value: 200)    // 야드로 변환하기

// 함수의 타입을 반환 타입으로 선언하면 함수도 데이터 타입으로 반환될 수 있음
func decideFunction(_ feet: Bool) -> (Float) -> Float {
    // 불리언 매개변수의 값에 따라 우리가 만든 toFeet 함수나 toYards 함수 타입을 반환하도록 구성
    if feet {
        return toFeet
    } else {
        return toYards
    }
}

// 클로저 표현식 closure expression : 독립적인 코드 블록
let sayHello2 = { print("Hello") }
sayHello2()
/*
 {(<매개변수 이름>: <매개변수 타입>, <매개변수 이름>: <매개변수 타입>, ... ) -> <반환 타입> in
    클로저 표현식 코드
 }
 */
let multiply = {(_ val1: Int, _ val2: Int) -> Int in
    return val1 * val2
}
let result2 = multiply(10, 20)
// 함수 선언과 비슷하지만 클로저 표현식은 이름을 갖지 않으며, 매개변수와 반환 타입은 괄호 안에 포함되고, 클로저 표현식 코드의 시작을 가리키기 위하여 in 키워드 사용
// 따라서 함수 = 이름이 있는 클로저 표현식

/*
 클로저 표현식은 비동기 메서드 호출에 대한 완료 핸들러를 선언할 때 주로 사용
 iOS 앱을 개발할 때 어떤 작업을 백그라운드에서 작업하게 해서 애플리케이션이 다른 작업을 계속 할 수 있도록 운영체제에게 요청해야 하는 경우가 종종 생긴다.
 이 경우 보통 시스템이 application에게 작업이 완료된 것을 알리고 작업(메서드)을 호출할 때 선언했던 완료 핸들러를 호출하여 결과 반환한다.
 완료 핸들러에 대한 코드는 주로 클로저 표현식의 형태로 구현
 eventstore.requestAccess(to: .reminder, completion: {(granted: Bool,
                    error: Error?) -> Void in
    if !granted {
        print(error!.localizeDescription)
    }
 })
 
 requestAccess(to:) 메서드 호출로 수행된 작업이 완료되면, completion: 매개변수로 선언된 클로저 표현식이 실행.
 이후 선언부와 같이 완료 핸들러는 불리언 값과 Error객체를 매개변수로 받으며 아무런 결과도 반환하지 않는다.
 
 또한, swift 컴파일러는 이 메서드 호출에 대한 완료 핸들러의 매개변수와 반환값에 대해 이미 알고 있기 때문에 클로저 표현식 내에서 선언되지 않은 정보를 유추할 수 있다.
 따라서 클로저 표현식의 선언부를 다음과 같이 간략하게 할 수 있다.
 eventstore. requestAccess(to: .reminder, completion: {(granted, error) in
    if !granted {
        print(error!.localizeDescription)
    }
 })
 */

// 클로저 closure : 함수나 클로저 표현식과 같은 독립적인 코드 블록과 블록 주변에 있는 하나 이상의 변수가 결합된 것을 말함
func functionA() -> () -> Int { // funtionA는 클로저를 반환하고 있다.
    
    let counter = 0
    
    func functionB() -> Int {
        return counter + 10
    }
    return functionB
}

let myClosure = functionA()
let result3 = myClosure()
// functionB는 counter 변수를 잡고 있기 때문에 closure로 간주
print("\(result3)")
