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

  private func indexOf(key: Key) -> Int {
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


//// Implementation
//class MyHashMap {
//
//    struct Element {
//        var key: Int
//        var value: Int
//    }
//
//    var buckets : [Element] = []
//
//    /** Initialize your data structure here. */
//    init() {
//        buckets = Array(repeating: Element(key: -1, value: -1), count: 2)
//    }
//
//    // returns the current load factor as a decimal - 1 is full, 0 is empty
//    var currentLoadFactor: Double {
//        return Double(buckets.compactMap{$0}.filter{$0.key == -1}.count) / Double(buckets.count)
//    }
//
//    private func resize() {
//        if currentLoadFactor > 0.9 {
//            // double the capacity
//            let extraBuckets: [Element] = Array(repeating: Element(key: -1, value: -1), count: buckets.count)
//            buckets += extraBuckets
//        } else {
//            if currentLoadFactor < 0.4 {
//                // remove blank buckets
//                buckets.removeAll(where: { $0.key == -1 })
//                resize()
//            }
//        }
//    }
//
//    /** value will always be non-negative. */
//    func put(_ key: Int, _ value: Int) {
//        remove(key)
//        resize()
//        buckets.append(Element(key: key, value: value))
//    }
//
//    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
//    func get(_ key: Int) -> Int {
//        return buckets.first{ $0.key == key }?.value ?? -1
//    }
//
//    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
//    func remove(_ key: Int) {
//        buckets.removeAll(where: { $0.key == key })
//    }
//}
