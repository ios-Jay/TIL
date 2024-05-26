import UIKit

/*: # Method Dispatch
 
 */

/*: ## 메서드 디스패치(Method Dispatch)
 - 1. 직접 디스패치 Direct Dispatch (Static)
 ---
 */
struct MyStruct {
    
    func method1() { print("Struct - Direct method1") }
    
    func method2() { print("Struct - Direct method2") }
    
}


let myStruct = MyStruct()

myStruct.method1()

myStruct.method2()
