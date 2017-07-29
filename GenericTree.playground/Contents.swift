//: Playground - noun: a place where people can play

import UIKit


//Generic Tree 

class Node<T> {
  
  var value: T
  var children: [Node] = []
  weak var parentNode: Node? = .none
  
  init(withValue value: T) {
    self.value = value
  }
  
  func addChild(childNode: Node){
    children.append(childNode)
    childNode.parentNode = self
  }
}

extension Node where T : Equatable{

  func searchNode(childNode: Node) -> Bool{
    //Check if its the parent node and then return
    if childNode.value == self.value {
      return true
    }
    for child in childNode.children {
      let found = searchNode(childNode: child)
      if found {
        return true
      }
    }
    return false
  }
  
}



