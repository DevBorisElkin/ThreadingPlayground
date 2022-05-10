import UIKit

// DispatchQueues below

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


// DispatchGroups below

func getData(){
    let urls = [
        "https://api.google.com/1",
        "https://api.google.com/2",
        "https://api.google.com/3"
    ]
    
    let group = DispatchGroup()
    
    for url in urls{
        guard let url = URL(string: url) else{
            continue
        }
        
        group.enter()
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            defer{
                group.leave()
            }
            
            guard let data = data else{
                return
            }
            print(data)
        })
        
        task.resume()
    }
    
    group.notify(queue: .main, execute: {
        // Update User Interface
    })
}
