
import UIKit

struct Stack<T> {
  
  private var bucket = [T]()
  
  // returns if the bucket is empty
  public var isEmpty: Bool {
    return bucket.count == 0
  }
  
  public var elements: [T] {
    return self.bucket
  }
  
  public var count: Int {
    return bucket.count
  }
  
  // returns last element of the array
  public func peek() throws -> T? {
    guard bucket.count > 0 else {
      return nil
    }
    return bucket.last
  }
  
  // Complexity: O(1)
  public mutating func push(value: T) {
    self.bucket.append(value)
  }
  
  // Complexity: O(1)
  @discardableResult
  public mutating func pop() throws -> T? {
    self.bucket.popLast()
  }
}

var stackObject = Stack<Int>.init()
stackObject.push(value: 10)
stackObject.push(value: 20)
stackObject.push(value: 30)
stackObject.push(value: 40)
stackObject.push(value: 50)
print(stackObject.elements)
try stackObject.pop()
try stackObject.pop()
try stackObject.pop()
try stackObject.pop()
print(try stackObject.peek() ?? 0)
