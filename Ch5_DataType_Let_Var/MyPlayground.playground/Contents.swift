import UIKit

var myNumber = 10

print("Int32 Min = \(Int32.min) Int32 Max = \(Int32.max)")

var userName = "Cho"
var inboxCount = 25
let maxCount = 100

var message = "\(userName) has \(inboxCount) messages. Message capacity remaining is \(maxCount - inboxCount) messages"

print(message)

var multiline = """

    The console glowed with flashing warnings.
    Clearly time was running out.

    "I thought you said you knew how to fly this!" yelled Mary.

    "It was much easier on the simulator" replied her brother,
    trying to keep the panic out of his voice.

    """

print(multiline)

/*:
## 타입 선언과 타입 추론
* 상수나 변수의 타입을 지정하는 예시
 */
var userCount: Int = 10
let bookTitle: String

/*:## Tuple -> 하나의 함수에서 여러 값을 반환할 수 있음 */
let myTuple = (10, 432.433, "This is a String")
let myString = myTuple.2    // index위치 참조
print(myString)

let (myInt2, myDouble2, myString2) = myTuple // 튜플의 각 index를 추출하여 변수 또는 상수에 각각 할당
var (myInt3, _,myString3) = myTuple // _ 을 통해 튜플의 해당 값 무시하고 정수와 문자열만 변수에 할당

let myTuple2 = (count: 10, length: 432.433, message: "This is a String")
print(myTuple2.message)

/*:## 옵셔널 타입 */
var index: Int?     // 값을 할당받지 않은 옵셔널은 nil값을 가진다.

index = 3

var treeArray = ["Oak", "Pine", "Yew", "Birch"]

if index != nil {
    // index 변수는 값이 할당되어 있다. -> wrapped(래핑)
    print(treeArray[index!])    // 강제 언래핑
} else {
    // index 변수는 값이 할당되어 있지 않다.
    print("index does not contain a value")
}

/* 옵셔널 바인딩
if let constantname = optionalName {    // 지정된 옵셔널이 값을 가지고 있는지를 확인
    // 옵셔널 변수가 값을 가지고 있는 경우에 선언된 상수 또는 변수에 그 값을 할당하고 코드 실행
}
if var variablename = optionalName {
    
}
*/

if let myValue = index {
    print(treeArray[myValue])
} else {
    print("index does not contain a value")
}

if let index = index {
    print(treeArray[index])
}

// ex)
var pet1: String?
var pet2: String?

pet1 = "cat"
pet2 = "dog"

if let firstPet = pet1, let secondPet = pet2 {
    print(firstPet)
    print(secondPet)
} else {
    print("insufficient pets")
}

// 강제 언래핑으로 옵셔널 선언
var index2: Int!

index2 = 0

var animalArray = ["tiger", "rabbit", "cow", "elephant"]

if index2 != nil {
    print(animalArray[index2])  // 배열의 index로 사용할 때 값을 언래핑 할 필요가 없어짐
} else {
    print("index does not contain a value")
}

/*:## 타입 캐스팅(type casting 형 변환) as */
// 컴파일러가 메서드나 함수가 반환하는 값이 불명확하거나 예상되지 않은 타입의 값일 때 특정 타입을 식별하지 못하는 경우가 종종 발생
// let myValue = record.object(forKey: "commet") as! String    // 반환하는 값을 String으로 처리

// 업캐스팅 -> 특정 클래스의 객체가 상위 클래스들 중의 하나로 변형되는 것을 말한다.  as
let myButton: UIButton = UIButton()
let myControl = myButton as UIControl   // UIButton클래스는 UIControl클래스의 하위 클래스 -> 업캐스팅

// 다운캐스팅 -> 어떤 클래스에서 그 클래스의 하위 클래스로 변환 -> 강제 변환     as! < as?
let myScrollView: UIScrollView = UIScrollView()
let myTextView = myScrollView as? UITextView

// 다운캐스팅을 안전하게 사용하기 위한 옵셔널 바인딩 사용
if let myTextView = myScrollView as? UITextView {
    print("Type cast to UITextView succeeded")
} else {
    print("Type cast to UITextView failed")
}

/*:## 타입 검사(type check) is */
/*
if myobject is MyClass {
    // myobject는 MyClass의 인스터스
}
*/

