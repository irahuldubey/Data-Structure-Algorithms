import UIKit
 
class LRUCacheNode {
    let key: Int
    var val: Int
    
    var pre: LRUCacheNode?
    var next: LRUCacheNode?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    private let capacity: Int
    private var count = 0
    
    private let head = LRUCacheNode(0, 0)
    private let tail = LRUCacheNode(0, 0)
    
    private var dict = [Int: LRUCacheNode]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(key)
            insert(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            remove(key)
            insert(node)
            return
        }
        let node = LRUCacheNode(key, value)
        dict[key] = node
        if count == capacity, let tailKey = tail.pre?.key {
            remove(tailKey)
        }
        insert(node)
    }
    
    private func insert(_ node: LRUCacheNode) {
        dict[node.key] = node
        
        node.next = head.next
        head.next?.pre = node
        node.pre = head
        head.next = node
        
        count += 1
    }
    
    private func remove(_ key: Int) {
        guard count > 0, let node = dict[key] else {
            return
        }
        dict[key] = nil
        node.pre?.next = node.next
        node.next?.pre = node.pre
        node.pre = nil
        node.next = nil
        count -= 1
    }
}

let cache = LRUCache(2)
cache.put(1, 0)
cache.put(2, 2)
print(cache.get(1))
cache.put(3, 3)
print(cache.get(2))
cache.put(4, 4)
print(cache.get(1))
print(cache.get(3))
print(cache.get(4))

/*

class Node {
    
    var next: Node?
    var prev: Node?
    
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
}

final class LRUCache {
    
    private let capacity: Int
    private var hashMap: [Int: Node] = [:]
    
    var leftNode: Node?
    var rightNode: Node?
    
    init(_ capacity: Int) {
        self.capacity = max(0, capacity)
        // Left and Right Node
        self.leftNode = Node(value: 0)
        self.rightNode = Node(value: 0)
        // Point this to each other
        self.leftNode?.next = self.rightNode
        self.rightNode?.prev = self.leftNode
    }
    
    func get(_ key: Int) -> Int {
        guard let node = hashMap[key] else {
            return -1
        }
        self.removeNode(node)
        self.insertNode(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        
        if let hashValueNode = hashMap[key] {
            removeNode(hashValueNode)
            insertNode(hashValueNode)
            return
        }
        
        let newNode = Node(value: value)
        hashMap[key] = newNode
        insertNode(newNode)
        
        // Check the capacity
        if self.hashMap.count > capacity {
            if let lruCacheNode = leftNode?.next {
                self.removeNode(lruCacheNode)
                self.hashMap[lruCacheNode.value] = nil
            }
        }
    }
    
    func removeNode(_ node: Node) {
        node.next?.prev = node.prev
        node.prev?.next = node.next
    }
    
    func insertNode(_ node: Node) {
        node.next = leftNode?.next
        node.prev = leftNode
        
        leftNode?.next?.prev = node
        leftNode?.next = node
    }
}
    



let cache = LRUCache(2)
cache.put(1, 0)
cache.put(2, 2)
print(cache.get(1))
cache.put(3, 3)
print(cache.get(2))
cache.put(4, 4)
print(cache.get(1))
print(cache.get(3))
print(cache.get(4))
*/
