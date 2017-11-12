//: Playground - noun: a place where people can play

import UIKit

// Create a custom Linked List in Swift

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
  
  public var head: Node?
  
  public var isEmpty: Bool {
    return head == nil
  }

  public var first: Node? {
    return head
  }
  
}


