import UIKit

// MaxStack solution with LinkedList and Tree

class MaxStack2 {

   var stack: [Int] = [Int]()
    
    init() { }
    
    func push(_ element: Int) {
        stack.append(element)
    }
    
    func pop() -> Int {
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return 0
    }
    
    func popMax() -> Int {
       return 0
    }
}


public class Node {
  var value: Int
  var next: Node?
  weak var previous: Node?
  
  public init(value: Int) {
    self.value = value
  }
}
