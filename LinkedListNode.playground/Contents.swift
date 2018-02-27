//: Playground - noun: a place where people can play

import UIKit

public class LinkedListNode<T> {
  var value: T
  var next: LinkedListNode?
  weak var previous: LinkedListNode?
  
  public init(value: T) {
    self.value = value
  }
}

public class LinkedList<T> {
  
  public typealias Node = LinkedListNode<T>
  
  private var head: Node?
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var first: Node? {
    return head
  }
  
  public var last: Node? {
    guard var node = head else {
      return nil
    }
    
    while let next = node.next {
      node = next
    }
    
    return node
  }
  
  public func append(value: T) {
    let newNode = Node.init(value: value)
    if let lastNode = last {
      newNode.previous = last
      lastNode.next = newNode
    }
    else{
      head = newNode
    }
  }
  
   var count: Int {
    
    guard var node = head else {
      return 0
    }
    
    var count = 1
    
    while let next = node.next {
      node = next
      count = count + 1
    }
    
    return count
  }
  
}


let list = LinkedList<String>()
list.append(value: "Rahul")


