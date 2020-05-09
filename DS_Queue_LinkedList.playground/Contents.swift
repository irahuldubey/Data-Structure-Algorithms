
//import Foundation
//
//// Single Linked list
//public class LinkedListNode<T> {
//  var value: T
//  var next: LinkedListNode?
//
//  public init(value: T) {
//    self.value = value
//  }
//}
//
//// Implement a Queue which uses the below operations
//// 1. Add(item): Add item to the end of the list
//// 2. Remove: Remove first items in the list
//// 3. Peek: Return the top of the queue
//// 4. isEmpty: Return true if and only if queue is empty
//
//public class Queue<T> {
//
//
//}

public class Node {
  
  var value: String
  
  var next: Node?
  
  weak var previous: Node?
  
  init(with value: String) {
    self.value = value
  }
}

public class LinkedList {
  
  private var head: Node?
  private var tail: Node?
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var first: Node? {
    return head
  }
  
  public var last: Node? {
    return tail
  }
  
  public func append(value: String) {
    let newNode = Node.init(with: value)
    if let tailNode = tail {
      tailNode.next = newNode
      newNode.previous = tailNode
    } else {
      head = newNode
    }
    tail = newNode
  }
}

extension LinkedList: CustomStringConvertible {
  // 2
  public var description: String {
    // 3
    var text = "["
    var node = head
    // 4
    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil { text += ", " }
    }
    // 5
    return text + "]"
  }
}

let dogBreeds = LinkedList()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")
print(dogBreeds)  
