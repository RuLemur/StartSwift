import Foundation

struct Queue<T: CustomStringConvertible> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.isEmpty == false else {return nil}
        return elements.removeFirst()
    }
    
    //такой метод имелся во втором задании ?
    func getAllDirtyElements() -> [T]{
        return elements.filter { $0.description.contains("fuck")}
    }
    
    subscript (index: Int) -> T?{
        return (index + 1) < elements.count ? elements[index] : nil
    }
}

var str1 = String(describing: "gagagfuckafasf")
var str2 = String(describing: "asfm,asfasfsa")
var str3 = String(describing: "zv,zxvfuck")
var str4 = String(describing: "asdasd")
var str5 = String(describing: "sdgsdgsdgsdg")


var que = Queue<String>()
que.push(str1)
que.push(str2)
que.push(str3)
que.push(str4)
que.push(str5)

print(que.getAllDirtyElements())

print(que.pop()!)
print(que.pop()!)
print(que.pop()!)
print(que.pop()!)
print(que.pop()!)

