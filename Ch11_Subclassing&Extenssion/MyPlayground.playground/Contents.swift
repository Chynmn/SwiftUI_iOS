import UIKit

/*  상속, 클래스, 하위 클래스
 상속을 통해서 class에 특성을 정의할 수 있게 하고, class를 상속받은 다른 class를 생성할 수 있게 한다.
 상속된 클래스는 부모 클래스의 모든 기능을 상속받으며 자신만의 기능을 추가한다.
 
 class 상속을 통해 class hierarchy를 만든다.
 최상위 클래스를 base class 또는 root class라고 부르고, 상속받은 클래스를 subclass 또는 child class라고 부르며,
 상속해준 클래스를 super class 또는 parent class라고 부른다.
 
 swift의 subclass는 반드시 단 한 개의 부모 클래만 둘 수 있는데 이것을 single inheritance(단일 상속)이라 한다.
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
    }
    
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
}

// 상속받은 하위 클래스
class SavingsAccount: BankAccount { // BankAccount 클래스의 모든 메서드와 프로퍼티를 상속받았음
    
    var interestRate: Float = 0.0
    
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


