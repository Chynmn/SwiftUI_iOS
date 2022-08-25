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
print("\(message)")

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
print("\(message)")


// 함수 선언부에서 지역 매개변수명 앞에 외부 매개변수명을 선언하면 외부 매개변수명이 추가됨.
func buildMessageFor3(userName name: String, userCount count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
message = buildMessageFor3(userName: "Mr.Cho", userCount: 32)
print("\(message)")


// 함수에 디폴트 매개변수 선언하기
