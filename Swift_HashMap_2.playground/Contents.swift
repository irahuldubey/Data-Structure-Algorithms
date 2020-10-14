import UIKit

// Solution 1

class MyHashMap {
    
    var arrayMap: [Int]
    
    init() {
        arrayMap = []
    }
    
    func put(_ key: Int, _ value: Int) {
        if key >= arrayMap.count {
            let count = key-arrayMap.count + 1
            arrayMap = arrayMap + Array.init(repeating: -1, count: count)
        }
        arrayMap[key] = value
    }
    
    func get(_ key: Int) -> Int {
        if key >= arrayMap.count { return -1 }
        return arrayMap[key]
    }
    
    func remove(_ key: Int) {
        if key >= arrayMap.count { return }
        arrayMap[key] = -1
    }
}

let mapclass = MyHashMap.init()
mapclass.put(1, 1)
mapclass.put(1, 2)
print(mapclass.arrayMap)

// Solution 2

class MyHashMap2 {
    
    var arrayMap: [Int]
    
    init() {
        arrayMap = Array.init(repeating: -1, count: 1000000)
    }
    
    func put(_ key: Int, _ value: Int) {
        arrayMap[key] = value
    }
    
    func get(_ key: Int) -> Int {
        return arrayMap[key]
    }
    
    func remove(_ key: Int) {
        arrayMap[key] = -1
    }
}

// Solution 3 - Array using subscript with Struct

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

print("Hash Table Value for the Key First Name is \(String(describing: hashTable["FirstName"]))")


// Solution 4 -

class LinkedNode {
    var next: LinkedNode?
    var key: Int
    var val: Int
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class MyHashMapLinkedNode {
    
    var nodes: [LinkedNode?]
    
    init() {
        nodes = Array.init(repeating: nil, count: 5)
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = hash(key)
        
        guard let node = nodes[index] else {
            nodes[index] = LinkedNode(key, value)
            return
        }
        
        var next: LinkedNode? = node
        var pre: LinkedNode? = nil
        
        while next != nil, next!.key != key {
            pre = next
            next = next?.next
        }
        
        if let next = next {
            next.val = value
        } else {
            pre?.next = LinkedNode(key, value)
        }
    }
    
    func get(_ key: Int) -> Int {
        let index = hash(key)
        
        guard let node = nodes[index] else {
            return -1
        }
        
        var next: LinkedNode? = node
        var pre: LinkedNode? = nil
        
        while next != nil, next!.key != key {
            pre = next
            next = next?.next
        }
        
        return next?.val ?? -1
    }
    
    func remove(_ key: Int) {
        let index = hash(key)
        guard let node = nodes[index] else {
            return
        }
        
        var next: LinkedNode? = node
        var pre: LinkedNode? = nil
        while next != nil, next!.key != key {
            pre = next
            next = next?.next
        }
        
        if let pre = pre {
            pre.next = next?.next
        } else {
            nodes[index] = next?.next
        }
    }
    
    private func hash(_ key: Int) -> Int {
        return key % 10000
    }
}

let obj = MyHashMapLinkedNode()
print(obj.nodes)
