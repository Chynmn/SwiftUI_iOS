import UIKit

/*
 객체는 소프트웨어 애플리케이션을 구축하는 블록으로 쉽게 사용하고 재사용할 수 있는 독립적인 기능 모듈이다.
 작업을 수행하기 위한 객체나 인스턴스에서 접근되고 호출되는 속성(property)과 함수(method)로 객체가 구성된다.
 객체를 구성하는 데이터 변수와 함수를 포괄적으로 클래스 멤버라고 한다.
 
 클래스는 객체가 생성될 때의 모습을 정의. 메서드들이 하게 될 일이 무엇이며 어떤 프로퍼티들이 존재할 지 등을 정의
 
 class 새로운 클래스 이름: 부모 클래스 {
    프로퍼티 -> 클래스 내에 포함될 변수와 상수.
    인스턴스 메서드 -> 클래스에서 호출되는 메서드들과 클래스의 인스턴스들을 정의.
    타입 메서드 -> =
 }
*/

class BankAccount { // class의 이름은 UpperCamelCase. property의 이름은 lowerCamelCase.
    /*
     데이터 캡슐화 : 클래스에 저장되고 접근될 수 있는 데이터는 오직 해당 클래스 내에 정의된 메서드만을 통해서 된다.
     클래스 내의 캡슐화된 데이터를 property 또는 instance variable라고 한다.
     
     클래스의 메서드 : 클래스의 성격에 맞는 특정 작업을 수행하기 위해 호출되는 코드 루틴
     타입 메서드 : 클래스 레벨에서 동작(ex 클래스의 새로운 인스턴스 생성하기) -> 인스턴스 메서드와 동일한 방법으로 선언되지만 선언부 앞에 class 키워드가 붙는다.
     인스턴스 메서드 : 클래스의 인스턴스에 대한 작업(ex 두 개의 프로퍼티 변수에 대한 산술 연산을 하고 결과를 반환하는 것) -> 자신이 속하게 될 클래스의 괄호 안에 선언된다.
    */
    var accountBalance: Float = 0   // 잔고 property
    var accountNumber: Int = 0      // 계좌번호 property
    let fees: Float = 25.00         // 연산 property 사용 예제
    
    var balanceLessFess: Float {    // 은행 수수료를 뺀 현재 잔액을 담는 프로퍼티 -> 저장 < 연산
        get {                       // 수수료를 빼는 연산 프로퍼티를 반환하는 게터 사용
            return accountBalance - fees
        }
        
        set(newBalance) {
            accountBalance = newBalance - fees  // 부동소수점 값을 매개변수로 받아 수수료를 뺀 결과를 프로퍼티에 할당.
        }
    }
    
    // 2. 생성자 : 인스턴스 생성 시점에 초기화 작업을 하기 위한 메서드. -> 새로운 클래스 인스턴스가 생성될 때 계좌번호와 잔액을 초기화
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    // 3. 소멸자 : swift runtime system에 의해 클래스 인스턴스가 없어지기 전에 해야 할 정리 작업은 클래스 안에 소멸자를 구현함으로서 가능
    deinit {
        // 필요한 작업 수행
    }
    
    func displayBalance() { // 인스턴스 메서드 선언
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    
    class func getMaxBalance() -> Float {   // 클래스를 설계할 때 이 클래스에 저장할 수 있는 최대 금액을 클래스 자신의 타입 메서드로 호출할 것임.
        return 100000.00                    // 인스턴스를 처음 생성하는 과정을 거치지 않아도 됨.
    }
}

// 인스턴스 생성 과정 -> 1. 인스턴스에 대한 참조체를 저장할 변수 선언.
var account1: BankAccount = BankAccount(number: 12312312, balance: 400.54)  // 생성자를 통해 인스턴스를 생성하면서 계좌번호와 잔액으로 초기화

/*
 클래스에 있는 인스턴스 메서드 호출 및 프로퍼티 접근 방법.
 점 표기법(dot notation) -> class_instance.property  /   class_instance.instance_method()
 타입 메서드도 점 표기법을 사용하여 호출하나, 클래스 인스턴스가 아닌 클래스에서 호출해야함. -> class_name.type_method()
 */
var balance1 = account1.accountBalance  // 인스턴스 메서드 -> 클래스 인스턴스에서 호출
account1.accountBalance = 6789.98       // 인스턴스 프로퍼티에 값 설정
account1.displayBalance()               // 클래스의 인스턴스인 displayBalance 메서드 호출

var maxAllowed = BankAccount.getMaxBalance()    // 타입 메서드 -> 클래스에서 호출

/* 클래스 프로퍼티
 stored property : 상수나 변수에 담기는 값 -> BankAccount의 계좌이름과 번호 프로퍼티
 computed property : 프로퍼티에 값을 설정하거나 가져오는 시점에서 어떤 계산이나 로직에 따라 처리된 값.
 getter를 생성하고 선택적으로 setter 메서드를 생성하며, 연산을 수행할 코드가 포함된다.
 */

// 현재 잔액에서 수수료를 뺀 값을 얻는 코드와 새로운 값을 설정하는 코드
balance1 = account1.balanceLessFess     // 인스턴스 프로퍼티를 이용해 인스턴스 메서드 재초기화
account1.balanceLessFess = 12123.12


// property 초기화하는 여러가지 방법 -> 지연 저장 초기화
var myProperty = 10     // 직접 초기화

class MyClass1 {         // 초기화 작업에서 프로퍼티에 값을 할당
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
/* 주요 point!
class MyClass2 {        // closure를 이용한 property 초기화
    
    var myProperty: String = {
        var result = resourceIntensiveTask()
        result = processData(data: result)
        return result
    }()
 
}
 
 복잡한 closure의 경우 선언 시 해당 프로퍼티가 코드 내에서 실제로 사용되는지와는 상관없이 클래스의 인스턴스가 생성될 때마다 초기화 작업이 수행되기 때문에
 초기화 작업이 리소스와 시간을 많이 사용하게 될 수 있다.
 그렇게 되면 DB에서 데이터를 가져오거나 사용자의 입력을 얻게 될 떄, 실행 프로세스의 후반부단계까지 property에 값이 할당되었는지 모르게 되는 상황이 생길 수 있다.
 따라서 프로퍼티를 최초로 접근할 때만 초기화 작업을 하는 것이 효율적이다. -> lazy로 property 선언
 
 class MyClass3 {        // closure를 이용한 property 초기화
     
     lazy var myProperty: String = {
         var result = resourceIntensiveTask()
         result = processData(data: result)
         return result
     }()
  
 }
 
 property를 lazy로 선언하면 프로퍼티가 최초로 접근될 때만 초기화 되므로 리소스를 많이 사용하는 작업은 property가 필요하게 될 때 property 초기화가 끝날 때까지
 해당 작업이 지연될 수 있다. 또한 지연 property는 반드시 변수(var)로 선언되어야 한다.
*/

// swift self 사용하는 경우!
class MyClass {
    var myNumber = 1
    
    func addTen() {     // self를 사용한 경우
        self.myNumber += 10
    }
    
    func mulTen() {     // self를 생략한 경우
        myNumber *= 10
    }
}
/*
 여기서 사용된 self는 MyClass 클래스 인스턴스에 속한 myNumber라는 이름의 property를 참조한다는 것을 컴파일러에게 알려주는 역할.
 하지만 swift programming에서 self는 property와 method에 대한 참조를 Default로 간주하기 때문에 self를 자주 쓸 필요가 없다.
 따라서 위의 예제에서 self를 생략할 수 있다.
 
 self를 반드시 사용해야 하는 상황은
 1. property나 method를 closure expression 내에서 참조할 경우.
 document?.openWithCompletionHandler({(success: Bool) -> Void in
     if success {
         self.ubiquityURL = resultURL
     }
 })
 
 2. 함수의 매개변수가 클래스 프로퍼티와 동일한 이름을 가질경우와 같이 코드의 모호성을 해결하기 위하여 self 사용.
 밑의 예제에서 첫 번째 print구문은 myNumber 매개변수를 통해 함수에 전달된 값을 출력하겠지만, 두 번째 print 구문은 myNumber라는 클래스 프로퍼티에 할당된 값인 10을 출력.
 */
class MyClass4 {
    
    var myNumber = 10   // class property
    
    func addTen(myNumber: Int) {
        print(myNumber)     // 함수의 매개변수 값을 출력
        print(self.myNumber)    // 클래스 프로퍼티 값을 출력
    }
}


/*  swift protocol  -> 다른 클래스와 함꼐 작업을 해야 할 때는 특정 조건에 맞춰야 함. 특히 iOS SDK의 다양한 프레임워크와 함께 동작하는 클래스를 만들 때.
 Protocol : class가 충족해야 하는 최소한의 요구사랑을 정의하는 규칙들의 집합을 말함.
 protocol 키워드로 선언되며, 클래스가 반드시 포함해야 하는 메서드와 프로퍼티를 정의.
 어떤 클래스가 프로토콜을 채택했으나 모든 프로토콜의 요구사항을 충족하지 않는다면, 그 클래스가 해당 프로토콜을 따르지 않는다는 에러가 발생.
 
 밑의 예제에서 프로토콜을 채택하는 클래스는 이름의 읽을 수 있는 문자열 값에 대한 name이라는 프로퍼티와
 매개변수를 받지 않고 문자열 값을 반환하는 buildMessage() 메서드를 반드시 포함해야 한다.
 */
protocol MessageBuilder {
    
    var name: String { get }
    func buildMessage() -> String
}

class MyClass5: MessageBuilder {    // protocol을 준수해야함.
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        "Hello " + name
    }
}

