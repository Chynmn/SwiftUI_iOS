import UIKit

// array와 dictionary는 다른 객체들의 집합을 담을 수 있는 객체.
/*
 swift collection은 가변형(mutable)과 불변형(immutable)이 있다.
 불변형 컬렉션 인스턴스에 속한 것은 객체가 초기화된 이후에 변경될 수 없다.
 따라서 불변형 컬렉션을 만들고 싶다면 컬렉션을 생성할 때 constant에 할당하고 variable에 할당했다면 가변형이 된다.
 
 <Array 초기화>
 Array의 타입은 타입 어노테이션(type annotation)을 사용하여 구체적으로 지정할 수도 있고, 타입 추론(type inference)을 이용하여 컴파일러가 식별하게 할 수도 있다.
 
 1. 배열 리터럴(array lliteral)을 이용해 배열을 생성할 때 값들을 갖도록 초기화할 수 있다.
 var 변수명: [타입] = [값1, 값2, 값3, ...]
 
 2. 배열을 생성할 때 값을 할당하지 않고 빈 배열을 생성하는 방법.
 var 변수명 = [타입]()

 3. 배열의 각 항목마다 지정된 디폴트 값으로 미리 설정하여 배열이 특정 크기로 초기화되도록 함.
 
 4. 기존의 배열 두 개를 합하여(배열 모두가 동일한 타입의 값을 포함하고 있다고 가정) 새로운 배열을 생성.
 */
// var treeArray = ["Pine", "Oak", "Yew"]   <- 가변형으로 할당. 세 개의 문자열 값으로 초기화되어 생성된 새로운 배열을 변수에 할당.
// let treeArray = ["Pine", "Oak", "Yew"]   <- 배열을 상수에 할당하여 불변형으로 생성할 수 있다.
var treeArray: [String] = ["Pine", "Oak", "Yew"] // <- 방법1. 타입 어노테이션을 이용하여 선언

var priceArray = [Float]()  // 방법2.

var nameArray = [String](repeating: "My String", count: 10) // 방법3.

let firstArray = ["Red", "Green", "Blue"]
let secondArray = ["Indigo", "Violet"]
let thirdArray = firstArray + secondArray   // 방법4.

// 배열 항목 개수
var animalArray = ["tiger", "rabbit", "cat", "panda"]
var itemCount = animalArray.count           // 배열의 count property에 접근
print(itemCount)

var countryArray = [String]()
if countryArray.isEmpty {    // 배열이 비었는지를 알 수 있는 boolean 타입의 isEmpty property
    print("countArray is empty")
}

// 배열 항목 접근하기 : 인덱스 첨자(index subscripting)을 이용해 배열의 특정 항목에 접근하거나 수정할 수 있다.
print(animalArray[0])
animalArray[2] = "cow"  // car -> cow로 교체

// 배열 항목 섞기(suffled), 무작위로 가져오기(randomElement)
let shuffledTrees = treeArray.shuffled()
let randomTree = treeArray.randomElement()

// 배열에 항목 추가하기

