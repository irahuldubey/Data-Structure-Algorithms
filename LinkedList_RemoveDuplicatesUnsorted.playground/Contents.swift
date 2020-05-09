public class Node<T: Comparable> {
  public var data: T
  public var next: Node?
  public var prev: Node?
  
  public init(with data: T, nextNode: Node? = nil) {
    self.data = data
    self.next = nextNode
  }
}

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

var node1 = Node.init(with: 1)
let node2 = Node.init(with: 2)
let node3 = Node.init(with: 3)
let node4 = Node.init(with: 1)
let node5 = Node.init(with: 2)
let node6 = Node.init(with: 3)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

// removeDuplicates - using extra space
// complexity O(N) - using hashSet
public func removeDuplicates(startNode: Node<Int>) {
  
  var hashSet: Set = Set<Int>()
  var previousNode: Node<Int>?
  var currentNode: Node<Int>? = startNode

  while currentNode != nil {
    let currentNodeValue = currentNode?.data
    if let currentValue = currentNodeValue, hashSet.contains(currentValue) {
      previousNode?.next = currentNode?.next?.next
    } else {
      hashSet.insert(currentNodeValue!)
      previousNode = currentNode
    }
    currentNode = currentNode?.next
  }
}

print(node1)
removeDuplicates(startNode: node1)
print(node1)
