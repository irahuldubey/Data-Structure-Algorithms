//: Playground - noun: a place where people can play

import UIKit

enum BinaryTree<T: Comparable>: CustomStringConvertible {

  case empty
  indirect case node(BinaryTree, T, BinaryTree)
  
  ///Get the TREE Description
  var description: String {
    switch self {
    case .empty:
      return ""
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    }
  }
  
  ///Get the total count of the nodes.
  var count: Int {
    switch self {
    case .empty:
      return 0
    case let .node(left, _ , right):
      return left.count + 1 + right.count
    }
  }
  
  ///Inserting a value in the Binary Tree
  private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
    switch self {
    case .empty:
      return .node(.empty, newValue, .empty)
    case let .node(left, value, right):
      if newValue < value {
        return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
      }
      else {
        return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
      }
    }
  }
  
  ///Public function to Insert a value in the current TREE O(n) complexity
  mutating func insert(newValue: T) {
    self = newTreeWithInsertedValue(newValue: newValue)
  }
  
  ///Evaluate the TREE and get the TOTAL Count of all the values INT TREE
  func evaluateTree(tree: BinaryTree<Int>) -> Int {
    switch tree {
    case .empty: return 0
    case let .node(left, value, right):
      return evaluateTree(tree: left) + value + evaluateTree(tree: right)
    }
  }
  
  ///Complexity of O(n)
  func traverseTreeInOrder(process: (T) -> ()) {
    switch self {
    case .empty:
      return
    case let .node(left, value, right):
      left.traverseTreeInOrder(process: process)
      process(value)
      right.traverseTreeInOrder(process: process)
    }
  }
  
  ///Complexity of O(n)
  func traverseTreePreOrder(process: (T) -> ()){
    switch self {
    case .empty:
      return
    case let .node(left, value, right):
      process(value)
      left.traverseTreePreOrder(process: process)
      right.traverseTreePreOrder(process: process)
    }
  }
  
  ///Complexity of O(n)
  func traverseTreePostOrder(process: (T) -> ()){
    switch self {
    case .empty:
      return
    case let .node(left, value, right):
      left.traverseTreePostOrder(process: process)
      right.traverseTreePostOrder(process: process)
      process(value)
    }
  }
  
  ///Searching inside a Binary Tree O(log n) Average
  func search(searchValue: T) -> BinaryTree? {
   
    switch self {
    case .empty:
      return nil
    case let .node(left, value, right):
      if searchValue == value {
        return self
      }
      if value > searchValue {
        return left.search(searchValue: searchValue)
      }else {
        return right.search(searchValue: searchValue)
      }
    }
  }
}

var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 9)

tree.traverseTreePostOrder {
  print($0)
}

tree.search(searchValue: 5)





