import UIKit

// ->> References
// https://marcosantadev.com/implement-cache-lru-swift/
// https://gist.github.com/MarcoSantarossa/e21599d028a9187e4f88e767f8d2acf0
// https://gist.github.com/Trundle/e390cc38444a45b0cea084fd51c8965b
// https://www.apoorvashettigar.com/index.php/lru-cache-least-recently-used-cache-in-swift/
// https://blog.usejournal.com/a-simple-lru-cache-implementation-in-swift-5-d3df244a8d02
// https://github.com/RinniSwift/Computer-Science-with-iOS/blob/main/DataStructures/LRUCache.playground/Contents.swift

// Create a Single Linked List

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var prev: LinkedListNode?
    
    init(with value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    private var head: Node?
    public var isEmpty: Bool { return head == nil }
    public var first: Node? { return head }
    
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
        let newNode = Node.init(with: value)
        if let lastNode = last {
            newNode.prev = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count: Int = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public func node(atIndex index: Int) -> Node {
        if index == 0 { return head! }
        else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { break }
            }
            return node!
        }
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.prev = newNode
            head = newNode
        } else {
            let prevNode = self.node(atIndex: index - 1)
            let nextNode = prevNode.next
            newNode.prev = prevNode
            newNode.next = nextNode
            prevNode.next = newNode
            nextNode?.prev = newNode
        }
    }
    
    public func removeAll() {
        head = nil
        //tail = nil
    }
    
    public func remove(node: Node) -> T {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
    
    public func removeLast() -> T {
        return remove(node: last!)
    }
    
    public func removeAt(_ index: Int) -> T {
        let nodex = node(atIndex: index)
        return remove(node: nodex)
    }
    
    public func reverse() {
        var node = head
        //tail = node
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.prev)
            head = currentNode
        }
    }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    var s = "["
    var node = head
    while node != nil {
      s += "\(node!.value)"
      node = node!.next
      if node != nil { s += ", " }
    }
    return s + "]"
  }
}

let myList = LinkedList<String>()

myList.append(value: "A")
myList.append(value: "B")
myList.append(value: "C")
myList.append(value: "D")


print(myList.description)

myList.reverse()

print(myList.description)

/*
 
 func reverse() {
     var previousNode: Node<T>? = nil
     var currentNode = firstNode
     var nextNode = firstNode?.nextNode
     while nextNode != nil {
         currentNode?.nextNode = previousNode
         previousNode = currentNode
         currentNode = nextNode
         nextNode = currentNode?.nextNode
     }
     currentNode?.nextNode = previousNode
     firstNode = currentNode
 }
 */


// LRU Cache

typealias DoublyLinkedListNode<T> = DoubleyLinkedList<T>.Node<T>

final class DoubleyLinkedList<T> {
    
    final class Node<T> {
        var payload: T
        var previous: Node<T>?
        var next: Node<T>?
        
        init(payload: T) {
            self.payload = payload
        }
    }
    
    private(set) var count: Int = 0
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func addHead(_ payload: T) -> Node<T> {
        let node = Node.init(payload: payload)
        defer {
            head = node
            count += 1
        }
        guard let head = head else {
            tail = node
            return node
        }
        head.previous = node
        node.previous = nil
        node.next = head
        return node
    }
    
    func moveToHead(_ node: Node<T>) {
        guard node !== head else {
            return
        }
        let previous = node.previous
        let next = node.next
        previous?.next = next
        next?.previous = previous
        node.next = head
        node.previous = nil
        if node === tail {
            tail = previous
        }
        //self.head?.previous = node
        self.head = node
    }
    
    func removeLast() -> Node<T>? {
        guard let tail = self.tail else {
            return nil
        }
        let previous = tail.previous
            previous?.next = nil
            self.tail = previous
            if count == 1 {
                head = nil
            }
            count -= 1
            return tail
    }
}

final class CacheLRU<Key: Hashable, Value> {
    
    private struct CachePayload {
        let key: Key
        let value: Value
    }
    
    private let list = DoubleyLinkedList<CachePayload>()
    private var nodeDict = [Key: DoublyLinkedListNode<CachePayload>]()
    
    private let capacity: Int
    
    init(capacity: Int) {
        self.capacity = max(0, capacity)
    }
    
    func isEmpty() -> Bool { return nodeDict.isEmpty }
    
    func setValue(_ value: Value, for key: Key) {
        let payload = CachePayload.init(key: key, value: value)
        if let node = nodeDict[key] {
            node.payload = payload
            list.moveToHead(node)
        } else {
            let node = list.addHead(payload)
            nodeDict[key] = node
        }
        if list.count > capacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.payload.key {
                nodeDict[key] = nil
            }
        }
    }
    
    func getValue(for key: Key) -> Value? {
        guard let searchedNode = nodeDict[key] else { return nil }
        list.moveToHead(searchedNode)
        return searchedNode.payload.value
    }
    
    deinit {
        nodeDict.removeAll()
        while list.count > 0 {
            list.removeLast()
        }
    }
}

let cache = CacheLRU<Int, String>(capacity: 2)

print(cache.getValue(for: 5)) // nil
cache.setValue("One", for: 1)
cache.setValue("Eleven", for: 11)
cache.setValue("Twenty", for: 20)
print(cache.getValue(for: 1)) // nil. We exceeded the capacity with the previous `setValue`  and `1` was the last element.
print(cache.getValue(for: 11)) // Eleven
print(cache.isEmpty())


/* Leet Code in Java*/

/*
public class LRUCache {

  class DLinkedNode {
    int key;
    int value;
    DLinkedNode prev;
    DLinkedNode next;
  }

  private void addNode(DLinkedNode node) {
    /**
     * Always add the new node right after head.
     */
    node.prev = head;
    node.next = head.next;

    head.next.prev = node;
    head.next = node;
  }

  private void removeNode(DLinkedNode node){
    /**
     * Remove an existing node from the linked list.
     */
    DLinkedNode prev = node.prev;
    DLinkedNode next = node.next;

    prev.next = next;
    next.prev = prev;
  }

  private void moveToHead(DLinkedNode node){
    /**
     * Move certain node in between to the head.
     */
    removeNode(node);
    addNode(node);
  }

  private DLinkedNode popTail() {
    /**
     * Pop the current tail.
     */
    DLinkedNode res = tail.prev;
    removeNode(res);
    return res;
  }

  private Map<Integer, DLinkedNode> cache = new HashMap<>();
  private int size;
  private int capacity;
  private DLinkedNode head, tail;

  public LRUCache(int capacity) {
    this.size = 0;
    this.capacity = capacity;

    head = new DLinkedNode();
    // head.prev = null;

    tail = new DLinkedNode();
    // tail.next = null;

    head.next = tail;
    tail.prev = head;
  }

  public int get(int key) {
    DLinkedNode node = cache.get(key);
    if (node == null) return -1;

    // move the accessed node to the head;
    moveToHead(node);

    return node.value;
  }

  public void put(int key, int value) {
    DLinkedNode node = cache.get(key);

    if(node == null) {
      DLinkedNode newNode = new DLinkedNode();
      newNode.key = key;
      newNode.value = value;

      cache.put(key, newNode);
      addNode(newNode);

      ++size;

      if(size > capacity) {
        // pop the tail
        DLinkedNode tail = popTail();
        cache.remove(tail.key);
        --size;
      }
    } else {
      // update the value.
      node.value = value;
      moveToHead(node);
    }
  }
}
*/
