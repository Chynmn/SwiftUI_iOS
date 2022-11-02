import UIKit

/*  상속, 클래스, 하위 클래스
 상속을 통해서 class에 특성을 정의할 수 있게 하고, class를 상속받은 다른 class를 생성할 수 있게 한다.
 상속된 클래스는 부모 클래스의 모든 기능을 상속받으며 자신만의 기능을 추가한다.
 
 class 상속을 통해 class hierarchy를 만든다.
 최상위 클래스를 base class 또는 root class라고 부르고, 상속받은 클래스를 subclass 또는 child class라고 부르며,
 상속해준 클래스를 super class 또는 parent class라고 부른다.
 
 swift의 subclass는 반드시 단 한 개의 부모 클래만 둘 수 있는데 이것을 single inheritance(단일 상속)이라 한다.
 
 상속을 통해 새로운 클래스가 기존의 클래스로부터 파생되어 새로운 기능이 추가되도록 하는 방법으로 객체지향 프로그래밍에서의 객체 재사용성 개념을 확장시킨다.
 */

/*  상속 예제 -> 10장 객체지향 프로그래밍에서 계좌 번호와 현재 잔고를 담은 클래스
 BankAccount 클래스 뿐만 아니라 저축 계좌 클래스를 선언할 것. -> 계좌, 잔고 및 데이터 접근 메서드 필요.
 따라서 BankAccount 클래스의 하위 클래스로 저축 계좌 클래스를 선언.
 */
// 상속해준 상위 클래스
class BankAccount {
    
    var accountBalance: Float
    var accountNumber: Int
    
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }   // SavingsAccount 클래스에 상속
    
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
}

// 상속받은 하위 클래스
class SavingsAccount: BankAccount { // BankAccount 클래스의 모든 메서드와 프로퍼티를 상속받았음
    
    var interestRate: Float = 0.0
    
    // 하위 클래스 초기화하기 -> 이자율을 초기화하는 작업을 통해 부모 클래스의 init 메서드를 호출하여 모든 변수가 초기화되도록 한다.
    // -> 하위 클래스의 인스턴스가 생성될 때 프로퍼티 초기화되도록 해야 한다.
    init(number: Int, balance: Float, rate: Float) {    // 이자율에 대한 이자율 변수.
        interestRate = rate
        super.init(number: number, balance: balance)    // 상위 클래스에서 호출
    }   // 초기화 과정에서 발생 할 수 있는 잠재적 문제를 피하기 위해 상위 클래스의 init 메서드는 항상 하위 클래스의 초기화 작업이 완료된 후에 호출되도록 해야 한다.
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance    // 상위 클래스에서 상속받은 프로퍼티 사용함.
    }
    
    /* 상속받은 메서드 오버라이딩 : 상속받은 기능을 수정을 통해 필요로 하는 기능으로써 사용하기 위함.
     method override를 통해 하위 클래스 내에 새로운 버전의 메서드를 만든다.
     
     메서드 오버라이딩의 두 가지 규칙 :
     1. 하위 클래스의 오버라이딩 메서드는 오버라이딩되는 상위 클래스 메서드의 매개변수 개수와 타입이 정확하게 일치해야 한다.
     2. 새롭게 오버라이딩하는 메서드는 반드시 부모 클래스 메서드가 반환하는 타입과 일치해야 한다.
     
     하위 클래스에서 오버라이드된 상위 클래스의 메서드를 호출 할 수 있다.
     */
    override func displayBalance() {    // 계좌번호와 잔고를 표시하는 메서드 + 계좌에 할당된 이자율
//        print("Number \(accountNumber)")
//        print("Current balance is \(accountBalance)")
        super.displayBalance()          // 상위 클래스의 메서드를 호출함으로써 코드의 중복을 없앨 수 있다.
        print("Prevailing interest rate is \(interestRate)")
    }
}

let savings1 = SavingsAccount(number: 12311, balance: 600.00, rate: 0.07)   // 하위 클래스 사용

print(savings1.calculateInterest())
savings1.displayBalance()


/*
 Extension을 이용해 swift class에 하위 클래스를 생성하거나 참조하지 않고 기존 클래스에 메서드, 초기화, 연산 프로퍼티, 서브스크립트 등의 새로운 기능을 추가할 수 있다.
 특히, swift언어와 iOS SDK 프레임워크에 내장된 클래스에 기능을 추가할 때 익스텐션을 이용하면 매우 효과적이다.
 
 extension ClassName {
     // Extension을 이용해 클래스에 새로운 기능을 추가한다.
 }
 
 */

extension Double {  // 연산 프로퍼티 확장
    
    var squared: Double {   // 제곱
        return self * self
    }
    
    var cubed: Double {     // 세제곱
        return self * self * self
    }
}

let myValue: Double = 3.0   // 상수를 선언할 때 Double형으로 선언하여 익스텐션 프로퍼티를 사용했다.
print(myValue.squared)

print(3.0.squared)      // 하위 클래스를 사용하는 것이 아니라 익스텐션으로 추가된 것이므로, Double값에서 프로퍼티에 직접 접근 가능
print(6.0.cubed)

/*
 분명 익스텐션은 하위 클래스를 사용하지 않고 클래스의 기능을 확장할 수 있는 빠르고 편리한 방식을 제공하지만,
 익스텐션을 이용해서는 클래스에 있는 기존의 기능을 오버라이드 할 수 없으며, 익스텐션에는 저장 프로퍼티를 포함할 수도 없다는 점에서 하위 클래스가 익스텐션보다 좋은 장점도 있다.
 */
