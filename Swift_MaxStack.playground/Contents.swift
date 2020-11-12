import UIKit


class MaxStack {

    var stack: [Int]
    var maxStack: [Int]
    
    /** initialize your data structure here. */
    init() {
        stack = []
        maxStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if maxStack.count == 0 {
            maxStack.append(x)
        } else {
            maxStack.append(max(x, maxStack[maxStack.count - 1]))
        }
    }
    
    func pop() -> Int {
        let largestElement = stack.last ?? 0
        stack.removeLast()
        return largestElement
    }
    
    func top() -> Int {
        return stack.last ?? 0
    }
    
    func peekMax() -> Int {
        return maxStack.last ?? 0
    }
    
    func popMax() -> Int {
        let largestElement = maxStack.last ?? 0
        maxStack.removeLast()
        return largestElement
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */
