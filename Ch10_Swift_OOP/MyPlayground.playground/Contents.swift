import UIKit

/*
 객체는 소프트웨어 애플리케이션을 구축하는 블록으로 쉽게 사용하고 재사용할 수 있는 독립적인 기능 모듈이다.
 작업을 수행하기 위한 객체나 인스턴스에서 접근되고 호출되는 속성(property)과 함수(method)로 객체가 구성된다.
 객체를 구성하는 데이터 변수와 함수를 포괄적으로 클래스 멤버라고 한다.
 
 class 새로운 클래스 이름: 부모 클래스 {
    프로퍼티 -> 클래스 내에 포함될 변수와 상수.
    인스턴스 메서드 -> 클래스에서 호출되는 메서드들과 클래스의 인스턴스들을 정의.
    타입 메서드
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
    let fees: Float = 25.00
    
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
var account1: BankAccount = BankAccount(number: 12312312, balance: 400.54)

/*
 클래스에 있는 인스턴스 메서드 호출 및 프로퍼티 접근 방법.
 점 표기법(dot notation) -> class_instance.property  /   class_instance.instance_method()
 
 타입 메서드도 점 표기법을 사용하여 호출하나, 클래스 인스턴스가 아닌 클래스에서 호출해야함. -> class_name.typemethod
 */
var balance1 = account1.accountBalance  // 인스턴스 메서드 -> 클래스 인스턴스에서 호출
account1.accountBalance = 6789.98
account1.displayBalance()

var maxAllowed = BankAccount.getMaxBalance()    // 타입 메서드 -> 클래스에서 호출

/* 클래스 프로퍼티
 stores property : 상수나 변수에 담기는 값
 computed property : 프로퍼티에 값을 설정하거나 가져오는 시점에서 어떤 계산이나 로직에 따라 처리된 값.
 getter를 생성하고 선택적으로 setter 메서드를 생성하며, 연산을 수행할 코드가 포함된다.
 */
// 현재 잔액에서 수수료를 뺀 값을 얻는 코드와 새로운 값을 설정하는 코드
balance1 = account1.balanceLessFess
account1.balanceLessFess = 12123.12
