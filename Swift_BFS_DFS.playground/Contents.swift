import UIKit

struct Tree {
    var value: Int
    var children: [Tree]?
}

var simpleNode = Tree(value: 2, children: [Tree(value: 5, children: nil),
                                           Tree(value: 6, children: nil)])
var simpleRoot = Tree(value: 1, children: [simpleNode,
                                           Tree(value: 4, children: nil),
                                           Tree(value: 3, children: [Tree(value: 12, children: nil)])])

func breadthFirstSearch(_ tree: Tree) -> [Int] {
    
    var result: [Int] = [Int]()
    
    var queueTree = [tree]
    
    while !queueTree.isEmpty {
        // FIFO - remove the first entry
        let current = queueTree.remove(at: 0) // O(N)
        // Process node
        let value = current.value
        
        result.append(value)
        
        // Here you explore all the children, if was a binary tree you should just explore left and right node, for example.
        if let children = current.children {
            children.forEach { treeNode in
                queueTree.append(treeNode)
            }
        }
    }
    
    return result
}

print(breadthFirstSearch(simpleRoot).debugDescription, "BFS")

func depthFirstSearch(_ tree: Tree) -> [Int] {
    
    var stackResult: [Int] = [Int]()
    var stackTree = [tree]
    
    while !stackTree.isEmpty {
        let current = stackTree.popLast() // remove the last one added O(1)
        
        guard let currentUnwrwap = current else {
            return stackResult
        }
        
        stackResult.append(currentUnwrwap.value)
        
        if let children = currentUnwrwap.children {
            for tree in children {
                stackTree.append(tree)
            }
        }
    }
    
    return stackResult
}

print(depthFirstSearch(simpleRoot).debugDescription, "DFS")

//Inorder Traversal
var result:[TreeNode] = [TreeNode]()
func dfs_inorder(_ root: TreeNode?) -> TreeNode? {
    
    if root == nil {
        return root
    }
    
    dfs_inorder(root?.left)
    if let root = root {
        result.append(root)
    }
    dfs_inorder(root?.right)
    
    return root;
    
}


public class TreeNode{
    public var val:Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val:Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val:Int,_ left:TreeNode?, _ right: TreeNode?){
        self.val = val
        self.left = left
        self.right = right
    }
}


// Preorder
func dfs_preorder(_ root: TreeNode?) -> TreeNode? {
    
    if root == nil {
        return root
    }
    if let root = root {
        result.append(root)
    }
    dfs_inorder(root?.left)
    dfs_inorder(root?.right)
    
    return root;
    
}

//PostOrder
func dfs_postorder(_ root: TreeNode?) -> TreeNode? {
    
    if root == nil {
        return root
    }
    
    dfs_inorder(root?.left)
    dfs_inorder(root?.right)
    if let root = root {
        result.append(root)
    }
    return root;
    
}
