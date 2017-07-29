

import UIKit

//Creating a Node
class Node {
  var value: String = ""
  var children: [Node] = []
  weak var parent: Node? = .none
  
  init(withValue value: String) {
    self.value = value
  }

  //Adding a child to the node
  func addChild(child: Node)  {
    children.append(child)
    child.parent = self
  }
}

let rootNode = Node.init(withValue: "Beverages")

let hotNode = Node.init(withValue: "Hot")
let coldNode = Node.init(withValue: "Cold")

rootNode.addChild(child: hotNode)
rootNode.addChild(child: coldNode)

let teaNode = Node.init(withValue: "Tea")
let coffeeNode = Node.init(withValue: "Coffee")
let cocoaNode = Node.init(withValue: "Cocoa")

hotNode.addChild(child: teaNode)
hotNode.addChild(child: coffeeNode)
hotNode.addChild(child: cocoaNode)

let blackNode = Node.init(withValue: "Black")
let greenNode = Node.init(withValue: "Green")
let chaiNode = Node.init(withValue: "Chai")

teaNode.addChild(child: blackNode)
teaNode.addChild(child: greenNode)
teaNode.addChild(child: chaiNode)

let sodaNode = Node.init(withValue: "Soda")
let milkNode = Node.init(withValue: "Milk")

let gingerNode = Node.init(withValue: "Ginger")
let bitterLemon = Node.init(withValue: "BitterLemon")

sodaNode.addChild(child: gingerNode)
sodaNode.addChild(child: bitterLemon)

// 1
extension Node: CustomStringConvertible {
  // 2
  var description: String {
    // 3
    var text = "\(value)"
    
    // 4
    if !children.isEmpty {
      text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
    }
    return text
  }
}

//print(rootNode.description)

extension Node {
  
  func searchNode(withValue value: String) -> Node? {
    
    if self.value == value {
      return self
    }
    
    for child in children {
      if let node = child.searchNode(withValue: value){
        return node
      }
    }
    
    return nil
  }
}

let beverageRootNode = rootNode.searchNode(withValue: "Beverages")

if beverageRootNode?.value == rootNode.value {
  print("Root Node !!", beverageRootNode?.value)
  print("YES !!")
}







