

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
let node2 = Node.init(with: 3)
let node3 = Node.init(with: 2)
let node4 = Node.init(with: 4)
let node5 = Node.init(with: 2)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

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

public func partitionLinkedList(with node: Node<Int>, partitionValue: Int) -> Node<Int> {
  
  var currentNode: Node<Int>? = node
  
  var l1: Node<Int>, p1: Node<Int>, l2: Node<Int>, p2: Node<Int>
  l1 = Node(with: 0)
  l2 = Node(with: 0)
  p1 = l1
  p2 = l2
  
  while currentNode != nil {
    if currentNode!.data < partitionValue {
      p1.next = currentNode
      p1 = p1.next!
    } else {
      p2.next = currentNode
      p2 = p2.next!
    }
    currentNode = currentNode?.next
  }

  p2.next = nil
  p1.next = l2.next
  return l1.next!
}

print(node1)
print(partitionLinkedList(with: node1, partitionValue: 2))
