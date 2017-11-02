//: Playground - noun: a place where people can play

import UIKit


// HashMap Implementation in Swift // Similar to Dictionary in Swift

// Key - Value Pairs, Key are unique


public struct CustomHashTable<Key: Hashable, Value> {
  
  typealias Element = (key: Key, value: Value)
  typealias Bucket = [Element]
  
  private var buckets: [Bucket]
  
  private(set) public var count = 0
  
  public var isEmpty: Bool { return count == 0 }
  
  public init(capacity: Int) {
    assert(capacity > 0)
    buckets = Array<Bucket>(repeatElement([], count: capacity))
  }
  
  private func indexOf(key: Key) -> Int{
    let hashValue = key.hashValue
    let absHashValue = abs(hashValue)
    return absHashValue % buckets.count
  }
  
  //Perform Insertion, Deletion, Updation and Retrieval
  
  public subscript(key: Key) -> Value? {
    get {
      //Retrieve value for key from the given subscript
      return valueForKey(key: key)
    }
    set {
      if let value = newValue {
        //Update items in the CustomHashTable
        updateValue(value, forKey: key)
        
      }
      else{
        //Remove items from the CustomHashTable
        removeItemForKey(key: key)
      }
    }
  }
  
  //Retrieval
  private func valueForKey(key: Key) -> Value? {
    let index = indexOf(key: key)
    //Look in the bucket list
    for element in buckets[index] {
      if key == element.key {
        return element.value
      }
    }
    
    return nil
  }
  
  //Updation
  private mutating func updateValue(_ value: Value, forKey key: Key) {
    let index = indexOf(key: key)
    for (i, element) in buckets[index].enumerated() {
      if element.key == key {
        buckets[index][i].value = value
      }
    }
    
    buckets[index].append((key: key, value: value))
    count = count + 1
  }
  
  //Deletion
  private mutating func removeItemForKey(key: Key) {
    let index = indexOf(key: key)
    for (i, element) in buckets[index].enumerated() {
      if key == element.key {
        buckets[index].remove(at: i)
        count = count - 1
      }
    }
  }
}

var hashTable = CustomHashTable<String, String>(capacity: 5)
hashTable["FirstName"] = "Rahul"

print("Hash Table Value for the Key First Name is \(hashTable["FirstName"])")