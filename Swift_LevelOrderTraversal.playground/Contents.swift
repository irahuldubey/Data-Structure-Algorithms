
// 102. Binary Tree Level Order Traversal

// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var levels: [[Int]] = []
    func recursiveVisit(_ node: TreeNode?, level: Int) {
        guard let node = node else {
            return
        }
        if level < levels.count {
            levels[level].append(node.val)
        } else {
            levels.append([node.val])
        }
        recursiveVisit(node.left, level: level + 1)
        recursiveVisit(node.right, level: level + 1)
    }
    recursiveVisit(root, level: 0)
    return levels
}


let three = TreeNode.init(3)
three.left = TreeNode.init(9)
let twenty = TreeNode.init(20)
three.right = twenty
twenty.left = TreeNode.init(15)
twenty.right = TreeNode.init(7)


print(levelOrder(three))
