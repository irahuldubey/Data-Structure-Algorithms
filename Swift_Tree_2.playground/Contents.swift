//import UIKit
//
//class Node {
//
//    let value: String
//
//    var children: [Node] = []
//
//    weak var parent: Node? // Root node do not have a parent
//
//    init(value: String) {
//        self.value = value
//    }
//
//    func add(child: Node) {
//        children.append(child)
//        child.parent = self
//    }
//}
//
//extension Node: CustomStringConvertible {
//  var description: String {
//    var text = "\(value)"
//    if !children.isEmpty {
//      text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
//    }
//    return text
//  }
//}
//
//let beverages = Node(value: "beverages")
//
//let hotBeverages = Node(value: "hot")
//let coldBeverages = Node(value: "cold")
//
//beverages.add(child: hotBeverages)
//beverages.add(child: coldBeverages)
//
//let tea = Node(value: "tea")
//let coffee = Node(value: "coffee")
//let cocoa = Node(value: "cocoa")
//
//hotBeverages.add(child: tea)
//hotBeverages.add(child: coffee)
//hotBeverages.add(child: cocoa)
//
//let black = Node(value: "black")
//let green = Node(value: "green")
//let chai = Node(value: "chai")
//
//tea.add(child: black)
//tea.add(child: green)
//tea.add(child: chai)
//
//let soda = Node(value: "soda")
//let milk = Node(value: "milk")
//
//coldBeverages.add(child: soda)
//coldBeverages.add(child: milk)
//
//let gingerAle = Node(value: "gingerAle")
//let bitterLemon = Node(value: "bitterLemon")
//
//soda.add(child: gingerAle)
//soda.add(child: bitterLemon)
//
//print(beverages.description)
//
//final class TreeNode {
//    var data: Int;
//    var left: TreeNode?
//    var right: TreeNode?
//
//    init(_ data: Int) {
//        self.data = data;
//        self.left = nil;
//        self.right = nil;
//    }
//}
//
//func inOrderTraversal(node: TreeNode?) {
//    while node != nil {
//        inOrderTraversal(node: node?.left)
//        print(node?.data, terminator: "  ")
//        inOrderTraversal(node: node?.right)
//    }
//}
//
//func preOrderTraversal(node: TreeNode?) {
//    while node != nil {
//        print(node?.data, terminator: "  ")
//        preOrderTraversal(node: node?.left)
//        preOrderTraversal(node: node?.right)
//    }
//}
//
//func postOrderTraversal(node: TreeNode?) {
//    while node != nil {
//        postOrderTraversal(node: node?.left)
//        postOrderTraversal(node: node?.right)
//        print(node?.data, terminator: "  ")
//    }
//}
//
//
//func inorderTraversalIteration(_ root: TreeNode?) -> [Int] {
//    var res = [Int](), stack = [TreeNode](), node = root
//    while node != nil || !stack.isEmpty {
//        if let currentNode = node {
//            stack.append(currentNode)
//            node = currentNode.left
//        } else {
//            let prevNode = stack.removeLast()
//            res.append(prevNode.data)
//            node = prevNode.right
//        }
//    }
//
//    return res
//}

 public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
    

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var retVal:[Int] = []
    
    if let node = root {
        var array: [TreeNode] = [node]
        while array.count != 0 {
            let last = array.last
            array.removeLast()
            retVal.insert(last!.val, at:0)
            if let left = last?.left {
                array.append(left)
            }
            if let right = last?.right {
                array.append(right)
            }
        }
    }
    
    return retVal
}
