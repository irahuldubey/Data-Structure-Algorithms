import UIKit

/*
 Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
 EXAMPLE
 Input: the node c from the linked list a - >b- >c - >d - >e- >f
 Result: nothing is returned, but the new linked list looks like a - >b- >d - >e- >f
*/

public class Node<T: Comparable> {
  public var data: T
  public var next: Node?
  public var prev: Node?
  
  public init(with data: T, nextNode: Node? = nil) {
    self.data = data
    self.next = nextNode
  }
}

var node1 = Node.init(with: 1)
let node2 = Node.init(with: 2)
let node3 = Node.init(with: 3)
let node4 = Node.init(with: 4)

node1.next = node2
node2.next = node3
node3.next = node4

extension Node: Equatable {
  public static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Node: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(data)"
    }
    return "\(data) -> " + String(describing: next) + ""
  }
}

print(node1)

// This logic does not delete first and last node of the list it only delete the middle node not necessarily in center

public func deleteNode(inputNode: Node<Int>) -> Bool {
  
  if inputNode.next == nil {
    return false
  }
  var currentNode: Node<Int>? = inputNode
  let nextNode: Node<Int>? = currentNode?.next
  
  inputNode.data = nextNode?.data as! Int
  inputNode.next = nextNode?.next
  
  return true
}

print(deleteNode(inputNode: node2))

print(node1)

