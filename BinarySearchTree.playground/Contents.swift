import UIKit


public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
}

// First Create and lead nodes and then the node and then the root node
// Start by creating from the bottom of the tree

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)


// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

//root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .node(let left, let value, let right):
                  return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        default:
            return ""
        }
    }
    
    public var count: Int {
        switch self {
        case let .node(left, _ , right):
            print(left.description, right.description)
            return left.count + 1 + right.count
        default:
            return 0
        }
    }
    
    // Traverse the tree inOrder form
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    // Traverse the tree in pre order format
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}

print(tree.description)
print(tree.count)

