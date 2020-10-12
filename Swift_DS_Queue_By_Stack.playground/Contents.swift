//: Playground - noun: a place where people can play

import UIKit

public struct Stack<T> {
  
  private var bucket = [T]()
  
  public var isEmptyStack: Bool {
    return bucket.isEmpty
  }
  
  public var count: Int {
    return bucket.count
  }
  
  public mutating func push(value: T) {
    bucket.append(value)
  }
  
  public mutating func pop() -> T? {
    return bucket.popLast()
  }
  
  public var top: T? {
    return bucket.last
  }
  
  
}

public struct QueueUsingStack<T> {
  
  var inStack = Stack<T>()
  var outStack = Stack<T>()
  
  mutating func enqueue(_ item: T){
    inStack.push(value: item)
  }
  
  mutating func dequeue() -> T? {
    fillOutStack()
    return outStack.top
  }
  
  mutating func peek() -> T? {
    fillOutStack()
    return outStack.top
  }
  
  private mutating func fillOutStack() {
    if outStack.count == 0 {
      while inStack.count != 0 {
        outStack.push(value: inStack.pop()!)
      }
    }
  }
}

public struct StackUsingQueue<T> {
  
  
}

