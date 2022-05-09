import UIKit

DispatchQueue.main.async{
    // in app use
    // self.foo()
    
    foo()
}

DispatchQueue.global(qos: .background).async{
    // fetch data from api
    
    DispatchQueue.main.async{
        //update UI
    }
}

func foo(){
    
}

/*
 print("1")
 DispatchQueue.global().async {
    print("2")
    DispatchQueue.main.async {
         print("3")
         DispatchQueue.global().sync {
            print("4")
            DispatchQueue.main.sync {
                print("5")
            }
            print("6")
        }
        print("7")
    }
    print("8")
 }
 print("9")
 
 Ответ: 1, 9, 2, 8, 3, 4, deadlock
 Вопрос: Как убрать deadlock?
 Ответ: убрать любой main, main на main = deadlock
 
 */
