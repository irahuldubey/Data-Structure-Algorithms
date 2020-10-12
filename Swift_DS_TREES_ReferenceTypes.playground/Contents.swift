//: Playground - noun: a place where people can play

import UIKit

///TREES as REFERENCE SEMANTICS

class BinaryTree<T: Comparable> : CustomStringConvertible {
  
  private(set) public var value: T
  private(set) public var parent: BinaryTree?
  private(set) public var left: BinaryTree?
  private(set) public var right: BinaryTree?
  
  init(withValue value: T) {
    self.value = value
  }
  
  public convenience init(array: [T]) {
    precondition(array.count > 0)

    //Initialize the Root
    self.init(withValue: array.first!)

    ///Drop first loop and insert all the values in the arrat
    array.dropFirst().forEach { (nvalue) in
      self.insert(value: nvalue)
    }
  }
  
  public var description: String {
    var fullTree = ""
    if let left = left {
      fullTree = fullTree + "(\(left.description)) -> "
    }
    fullTree += "\(value)" //Add the value to the full tree string
    if let right = right {
      fullTree = fullTree + " <- (\(right.description))"
    }
    return fullTree
  }
  
  public var isRoot: Bool {
    return parent == nil
  }
  
  public var isLeaf: Bool {
    return left == nil && right == nil
  }

  public var isLeftChild: Bool {
    return parent?.left === self
  }
  
  public var isRightChild: Bool {
    return parent?.right === self
  }
  
  public var hasLeftChild: Bool {
    return left != nil
  }
  
  public var hasRightChild: Bool {
    return right != nil
  }
  
  public var hasAnyChild: Bool {
    return hasLeftChild || hasRightChild
  }
  
  public var hasBothChildren: Bool {
    return hasLeftChild && hasRightChild
  }
  
  public var count: Int {
    return (left?.count ?? 0) + 1 + (right?.count ?? 0)
  }
  
  ///Insertion Nodes to the TREE
  
  public func insert(value: T) {
    if value < self.value {
      if let left = left {
        left.insert(value: value)
      }
      else{
        left = BinaryTree.init(withValue: value)
        left?.parent = self
      }
    }
    else{
      if let right = right {
        right.insert(value: value)
      }
      else{
        right = BinaryTree.init(withValue: value)
        right?.parent = self
      }
    }
  }
  
  public func search(value: T) -> BinaryTree? {
    if value < self.value {
      return left?.search(value: value)
    }
    else if value > self.value {
      return right?.search(value: value)
    }
    else{
      return self
    }
  }
  
  public func traverseInOrder(process: (T) -> Void) {
    left?.traverseInOrder(process: process)
    process(value)
    right?.traverseInOrder(process: process)
  }
  
  public func traversePreOrder(process: (T) -> Void) {
    process(value)
    left?.traversePreOrder(process: process)
    right?.traversePreOrder(process: process)
  }
  
  public func traversePostOrder(process: (T) -> Void) {
    left?.traversePostOrder(process: process)
    right?.traversePostOrder(process: process)
    process(value)
  }
  
  ///Reconnect to the Parent Node
  private func reconnectParentToNode(node: BinaryTree?) {
    if let parent = parent {
      if isLeftChild {
        parent.left = node
      }
      else {
        parent.right = node
      }
    }
    node?.parent = parent
  }
  
  ///Get the min node of the Binary Tree
  public func minimum() -> BinaryTree {
    var node = self
    while let nextNode = node.left {
      node = nextNode
    }
    return node
  }
  
  ///Get the max node of the Binary Tree
  public func maximum() -> BinaryTree {
    var node = self
    while let nextNode = node.right {
      node = nextNode
    }
    return node
  }
  
  ///Remove the current node
  public func remove() -> BinaryTree? {
    
    var replacementNode: BinaryTree?
    
    if let rightNode = right {
      replacementNode = rightNode.minimum()
    }
    else if let leftNode = left {
      replacementNode = leftNode.maximum()
    }
    else{
      replacementNode = nil
    }
    
    replacementNode?.remove()
    
    //Place the replacement node in current node position
    replacementNode?.right = right
    replacementNode?.left = left
    
    //Connect the parent to the replacement Node
    right?.parent = replacementNode
    left?.parent = replacementNode
    
    //Reconnect to the Parent Node after the replacement is Done
    reconnectParentToNode(node: replacementNode)
    
    //Clean up the current Node
    parent = nil
    left = nil
    right = nil
    
    return replacementNode
  }
  
  public func height() -> Int {
    if isLeaf {
      return 0
    } else {
      return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
    }
  }
  
  public func depth() -> Int {
    var node = self
    var edge: Int = 0
  
    while let parent = node.parent {
      node = parent
      edge = edge + 1
    }
    return edge
  }
  
  public func predecessor() -> BinaryTree<T>? {
    if let left = left {
      return left.maximum()
    } else {
      var node = self
      while let parent = node.parent {
        if parent.value < value { return parent }
        node = parent
      }
      return nil
    }
  }
  
  public func successor() -> BinaryTree<T>? {
    if let right = right {
      return right.minimum()
    } else {
      var node = self
      while let parent = node.parent {
        if parent.value > value { return parent }
        node = parent
      }
      return nil
    }
  }
  
}

var tree = BinaryTree<Int>(withValue: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)

tree.traverseInOrder { value in
  print(value)
}

print(tree.height())



