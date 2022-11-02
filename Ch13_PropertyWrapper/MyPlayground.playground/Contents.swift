import UIKit

/* property wrapper는 클래스와 구조체 구현부에 getter, setter, computed property 코드의 중복을 줄이는 방법을 제공.
 property wrapper는 연산 프로퍼티의 기능을 개별 클래스와 구조체와 분리할 수 있게하며, 앱 코드에서 재사용할 수 있게 한다.
 iOS SDK로 작업을 할 때 미리 정의된 프로퍼티 래퍼를 SwiftUI에서 주로 사용한다.
 */

// 도시 이름을 저장하는 String property를 가진 구조체 예제
struct Address {
    
    private var cityname: String = ""
    
    var city: String {  // 도시 이름을 입력에 상관없이 대문자로 저장하기 위한 연산 프로퍼티
        get { cityname }
        set { cityname = newValue.uppercased() }
    }
}

var address = Address()

address.city = "London"
print(address.city)     // setter가 private cityname 변수에 값을 저장하기 전에 대문자로 변환.

// 연산 프로퍼티를 사용하는 대신에 로직을 래퍼로 구현할 수 있다.
// 문자열을 대문자로 변환하도록 설계된 FixCase 프로퍼티 래퍼 선언.
@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    
    var wrappedValue: String {  // 모든 property wrapper는 값을 변경하거나 유효성을 검사하는 게터와 세터 코드가 포함된 wrappedValue property를 가져야 한다.
        get { value }
        set { value = newValue.uppercased() }   // 초깃값을 문자열을 대문자로 변환하고 private 변수에 저장하는 wrappedValue 프로퍼티에 할당.
    }
    
    init(wrappedValue initialValue: String) {   // 초깃값이 전달되는 초기화 메서드는 선택사항으로 포함.
        self.wrappedValue = initialValue
    }
}

struct Contact {    // 동일한 동작이 필요한 다른 프로퍼티 변수에 적용하여 재사용한다.
    @FixCase var name: String   // propertyWrapper를 사용하기 위해 클래스나 구조체의 선언부에 있는 프로퍼티 선언 앞에 @FixCase 지시자를 붙인다.
    @FixCase var city: String
    @FixCase var country: String
}

var contact = Contact(name: "John Smith", city: "London", country: "United Kingdom")
print("\(contact.name), \(contact.city), \(contact.country)")

// property wrapper를 사용해 여러 값을 받도록 구현.
@propertyWrapper
struct MinMaxVal_INT {     // Int값만 가지는 프로퍼티 래퍼
    var value: Int
    let max: Int
    let min: Int
    
    init(wrappedValue: Int, min: Int, max: Int) {   // wrapper 값에 추가된 min과 max 값을 받아서 구현된다.
        value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: Int {
        get { return value }
        set {                       // 값이 특정 범위 안에 있는지를 검사하여 그 값을 min or max에 할당한다.
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

// 지정된 값으로 사용하도록 설계된 프로퍼티 래퍼의 형태. 추가되는 값들을 괄호 안에 둔다.
struct Demo {
    @MinMaxVal_INT(min: 100, max: 200) var value: Int = 100
}

var demo = Demo()
demo.value = 150    // 최댓값의 허용범위 안에 있으므로 150을 정상적으로 출력
print(demo.value)

demo.value = 250    // 최댓값의 허용범위인 200을 초과하여 200을 출력
print(demo.value)

/*
 동일한 타입의 다른 값과 비교할 수 있는 모든 변수 타입과 함께 사용할 수 있도록 property wrapper는 특정 protocol을 따르는 모든 타입과 작업하도록 구현할 수 있다.
 프로퍼티 래퍼의 목적은 비교 작업을 하는것이므로, Foundation 프레임워크에 포함된 Comparable 프로토콜을 따르는 모든 데이터 타입을 지원하도록 수정해야 한다.
 Comparable 프로토콜을 따르는 타입은 값의 크기를 비교하는데 사용될 수 있다.
 */

// Comparable 프로토콜을 따르는 모든 타입에 사용될 수 있도록 property wrapper 구현하기 위해 위의 예제의 선언부를 수정.
@propertyWrapper
struct MinMaxVal_ALL<V: Comparable> {  // String, Int, Date, DateInterval, Character등이 Comparable protocol을 따른다.
    var value: V
    let max: V
    let min: V
    
    init(wrappedValue: V, min: V, max: V) {   // wrapper 값에 추가된 min과 max 값을 받아서 구현된다.
        value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: V {
        get { return value }
        set {                       // 값이 특정 범위 안에 있는지를 검사하여 그 값을 min or max에 할당한다.
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

// String 문자열 값이 알파벳 사전 관점에서 최솟값과 최댓값 범위 안에 들어오는지를 판단.
struct StringDemo {
    @MinMaxVal_ALL(min: "Apple", max: "Orange") var value: String = ""
}

var Stringdemo = StringDemo()
Stringdemo.value = "Banana"  // 주어진 알파벳 범위 내에 있어서 정상적으로 저장된다.
print(Stringdemo.value)

Stringdemo.value = "Watermelon"  // 주어진 알파벳 범위 밖이므로 지정한 최댓값인 Orange가 저장
print(Stringdemo.value)


// Date 객체로 동작하는 래퍼. 현재 날짜와 한 달 후 날짜 사이의 데이터로 제한.
struct DateDemo {
    @MinMaxVal_ALL(min: Date(), max: Calendar.current.date(byAdding: .month, value: 1, to: Date())! ) var value: Date = Date()
}

var dateDemo = DateDemo()

print(dateDemo.value)   // Default로 현재 날짜가 프로퍼티에 설정

dateDemo.value = Calendar.current.date(byAdding: .day, value: 10, to: Date())!  // 10일 후의 날짜를 프로퍼티에 설정
print(dateDemo.value)

dateDemo.value = Calendar.current.date(byAdding: .month, value: 2, to: Date())! // 2달 후의 날짜를 프로퍼티에 설정
print(dateDemo.value)   // 유효 범위가 현재 날짜에서 1달 후 까지이므로 프로퍼티에는 최댓값인 1달 후가 저장된다.
