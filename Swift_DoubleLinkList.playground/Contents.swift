import UIKit

class Node<T: Equatable>: Equatable {
    var value: T
    var next: Node<T>?
    weak var prev: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

class DoublyLinkList<T: Equatable> {

    var head: Node<T>?
    var tail: Node<T>?
    var size: Int = 0
    
    func append(value: T) {
        let newNode = Node(value: value)
        
        guard self.head != nil else {
            self.head = newNode
            self.tail = newNode
            self.size = self.size + 1
            return
        }
        
        self.tail?.next = newNode
        newNode.prev = self.tail
        self.tail = newNode
        
        self.size = size + 1
    }
    
    func prepend(value: T) {
        let newNode = Node(value: value)
        
        guard self.head != nil else {
            self.head = newNode
            self.tail = newNode
            self.size = self.size + 1
            return
        }
        
        self.head?.prev = newNode
        newNode.next = self.head
        self.head = newNode
        
        self.size = size + 1
    }
    
    func items() -> [T?] {
        guard self.head != nil else { return [] }
        var allItems = [T]()
        var currendNode = self.head
        while currendNode != nil  {
            allItems.append(currendNode!.value)
            currendNode = currendNode?.next
        }
        return allItems
    }
    
    func insertAtIndex(_ value: T, atIndex: Int) {
        guard atIndex >= 0 && atIndex <= self.size else {
            print("Error: Index out of bounds")
            return
        }
        
        guard atIndex != 0 else {
            self.prepend(value: value)
            return
        }
        
        let newNode = Node(value: value)
        var currentNode = self.head
        
        for _ in 0..<atIndex {
            currentNode = currentNode?.next
        }
        
        currentNode?.prev?.next = newNode
        newNode.prev = currentNode?.prev
        
        currentNode?.prev = newNode
        newNode.next = currentNode
        
        self.size = size + 1
    }
    
    func getAtIndex(_ index: Int) -> T? {
        guard index >= 0 && index <= self.size else {
            return nil
        }
        var currentNode = self.head
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        return currentNode?.value
    }
    
    
    
}

