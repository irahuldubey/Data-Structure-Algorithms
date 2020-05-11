
//Return Kth to Last: Implement an algorithm to find the kth to last element of a singly linked list.

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

public func KthTofront(k: Int, listNode: Node<Int>) -> Int? {
  guard k > 0  else { return nil }
  guard listNode.data != nil else { return nil }
  
  var currentIndex = 0
  var currenNode: Node<Int>? = listNode
  var foundNodeValue: Int?
  
  while currenNode != nil {
    currentIndex = currentIndex + 1
    if currentIndex == k {
      foundNodeValue = currenNode?.data
    }
    currenNode = currenNode?.next
  }
  return foundNodeValue
}

print(KthTofront(k: 2, listNode: node1) as Any)

print(node1)


// O(n) time and O(1) space
public func KthToLast(headNode: Node<Int>, k: Int) -> Int? {
  
  guard k > 0 else {
    return nil
  }
  var firsLoopNode: Node<Int>? = headNode
  var secondLoopNode: Node<Int>? = headNode
  
  var counter = 0
  
  while counter < k - 1      {
    firsLoopNode = firsLoopNode?.next
    counter = counter + 1
  }
  
  while firsLoopNode?.next != nil {
    firsLoopNode = firsLoopNode?.next
    secondLoopNode = secondLoopNode?.next
  }
  
  return secondLoopNode!.data
}

print(KthToLast(headNode: node1, k: 2))


