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

var stackObj = Stack<Int>.init()
stackObj.push(value: 5)
stackObj.push(value: 1)
print(stackObj.count)
