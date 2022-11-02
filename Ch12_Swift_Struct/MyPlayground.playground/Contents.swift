import UIKit

// 구조체 사용법과 클래스와 구조체의 차이점, 값 타입과 참조 타입 개념 이해

/*
 공통점 :
 property 정의, value 저장, method 정의할 수 있는 객체 생성 메커니즘을 제공.
 데이터와 기능을 재사용할 수 있는 객체로 캡슐화하는 방법을 제공한다.
 구조체도 클래스처럼 확장이 가능하며, 프로토콜을 채택하거나 초기화를 가질 수 있다.
 
 
 차이점 :
 struct 키워드를 사용한다.
 구조체 인스턴스의 타입은 value type, 클래스 인스턴스의 타입은 reference type.
 구조체는 클래스의 상속이나 하위클래스를 지원하지 않는다.
 구조체는 소멸자 메서드(deinit)를 포함할 수 없다.
 런타임에서 클래스 인스턴스의 유형을 식별할 수 있지만 구조체는 그렇지 않다.
 
 결론 :
 일반적으로 구조체가 클래스보다 효율적이고 멀티 스레드 코드를 사용하는데 더 안정적이기 때문에 가능하다면 구조체를 사용하는 것을 권장.
 그러나, 상속이 필요하거나 데이터가 캡슐화된 하나의 인스턴스가 필요한 때, 인스턴스가 소멸될 때 리소스를 확보하기 위한 작업이 필요할 때 클래스를 사용해야 함.
 */

struct SampleStruct {   // String변수, 초기화, 메서드로 구성. class 키워드를 사용하는 것을 제외하면 선언부는 동일함.
    
    var name: String
    init(name: String) {
        self.name = name
    }
}

// 인스턴스를 생성할 때도 동일한 구문을 사용
let myStruct = SampleStruct(name: "Mark1")
let myClass = SampleClass(name: "Mark2")

print(myStruct.name)
print(myClass.name)

/*
 -> 구조체 인스턴스가 복사되거나 메서드에 전달될 때 인스턴스의 복사본은 원본 객체가 가지고 있던 모든 데이터를 복사하기 때문에 원본 구조체 인스턴스와 별개인 자신만의 데이터를 가진다. 따라서 하나의 인스턴스를 변경해도 다른 복사본들에 영향을 미치지 않는다.
 -> 클래스 인스턴스가 복사되거나 인자로 전달되면 해당 클래스 인스턴스가 있는 메모리의 위치에 대한 참조체가 생성되거나 전달되고 참조체를 변경하면 원본 인스턴스에도 동일한 작업이 수행된다. 따라서 단 하나의 클래스 인스턴스가 있고 그 인스턴스를 가리키는 여러 개의 참조체가 존재하므로 참조체들 중 하나를 이용하여 인스턴스 데이터를 변경하면 모든 참조체 데이터가 변경된다.
 */
let myStruct1 = SampleStruct(name: "Mark45")
var myStruct2 = myStruct1
myStruct2.name = "David"

print(myStruct1.name)
print(myStruct2.name)   // myStruct2는 myStruct1의 복사본이므로 자신만의 데이터를 갖게 된다.

// 클래스와 비교
class SampleClass {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let myClass1 = SampleClass(name: "Mark98")
var myClass2 = myClass1
myClass2.name = "David2"

print(myClass1.name)
print(myClass2.name)    // 동일한 클래스 인스턴스에 대한 참조체들이므로 name property를 변경함으로써 myClass1와 myClass2 모두에 영향을 미치게 된다.
