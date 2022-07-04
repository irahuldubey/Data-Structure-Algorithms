import UIKit

public class Node {
    let value: String
    var next: Node?
    init(with value: String) {
        self.value = value
    }
}

public class SingleLinkedList {
    var head: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var firstItem: Node? {
        return head
    }
    
    public func append(value: String) {
        let newNode = Node(with: value)
        if var temp = head {
            while temp.next != nil {
                temp = temp.next!
            }
            temp.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func insert(value: String, at position: Int) {
        // Create instance of a new node
        let newNode: Node = Node(with: value)
        // Handle the case where we want to add the node to head
        if position == 0 {
            newNode.next = head
            head = newNode
        } else {
            var previous = head
            var current = head
            for _ in 0..<position {
                print("BOB: current \(String(describing: current?.value))")
                print("BOB: current next \(current?.next?.value)")
                previous = current
                current = current?.next
            }
            newNode.next = previous?.next
            previous?.next = newNode
        }
    }
    
    public func deleteNote(at position: Int) {
        guard head != nil else { return }
        var temp = head
        if (position == 0) {
            head = temp?.next
            return
        }
        for _ in 0..<position - 1 where temp != nil {
            temp = temp?.next
        }
        if temp == nil || temp?.next == nil {
            return
        }
        print("temp \(temp?.value)")
        print("temp?.next?.next: \(temp?.next?.next?.value)")
        print("temp?.next: \(temp?.next?.value)")
        let nextToNextNode = temp?.next?.next
        temp?.next = nextToNextNode
    }
    
    func printList() {
        var current: Node? = head
        while (current != nil) {
            print("SLL item is: \(current?.value as? String ?? "")")
            current = current?.next
        }
    }
}


let node: Node = Node.init(with: "rahul")
let node1: Node = Node.init(with: "dubey")
let node2: Node = Node.init(with: "rivansh")

let singleLinkList = SingleLinkedList()
singleLinkList.append(value: "rahul")
singleLinkList.append(value: "dubey")
singleLinkList.append(value: "rivansh")

print(singleLinkList)
singleLinkList.insert(value: "oo", at: 2)

singleLinkList.printList()

print("************************")

singleLinkList.deleteNote(at: 1)

singleLinkList.printList()
