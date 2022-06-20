class MaxStack {

   var stack: [Int] = [Int]()
   var maxStack: [Int] = [Int]()
    
    init() { }
    
    func push(_ element: Int) {
        stack.append(element)
        if maxStack.isEmpty {
            maxStack.append(element)
        } else {
           let maxElement = max(maxStack.last!, element)
           maxStack.append(maxElement)
        }
    }
    
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return maxStack.last!
    }
    
    func popMax() -> Int {
       let maxValue = maxStack.last!
        var temp: [Int] = []
        while let lastItem = stack.popLast() {
            maxStack.removeLast()
            if lastItem == maxValue {
                debugPrint("Removed:", lastItem)
                break
            } else {
                temp.append(lastItem)
            }
        }

        while let lastItem = temp.popLast() {
            self.push(lastItem)
        }
        
        return maxValue
    }
}

let stack = MaxStack()
stack.push(4)
stack.push(2)
stack.push(3)
stack.push(5)
stack.push(5)

stack.pop()
stack.popMax()

debugPrint(stack.stack)
debugPrint(stack.maxStack)
