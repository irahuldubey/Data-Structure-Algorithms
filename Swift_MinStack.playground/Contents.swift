import UIKit

class MinStack {
    
    struct MintStack {
        var val: Int
        var min: Int
    }
    
    var minStack: [MintStack] = [MintStack]()
    
    init() { }
    
    var isEmpty: Bool {
        return minStack.count == 0
    }
    
    var count = 0
    
    func push(_ val: Int) {
        if !isEmpty {
            let minValue = getMin()
            if minValue < val {
                minStack.append(MintStack.init(val: val, min: minValue))
            } else {
                minStack.append(MintStack.init(val: val, min: val))
            }
        } else {
            minStack.append(MintStack.init(val: val, min: val))
        }
    }
    
    func pop() {
        minStack.removeLast()
    }

    func top() -> Int {
        return minStack.last!.val
    }
    
    func getMin() -> Int {
        if !isEmpty{
            return minStack.last!.min
        }
        return Int.max
    }
}

let minStack = MinStack()
minStack.push(1)
minStack.push(3)
minStack.push(2)

minStack.minStack.forEach { value in
    debugPrint("Value: \(value)")
}

minStack.getMin()
