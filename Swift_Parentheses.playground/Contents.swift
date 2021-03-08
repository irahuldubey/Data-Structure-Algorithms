import UIKit

class Solution {
    
    func isValid(_ s: String) -> Bool {
        let s = Array(s)
        var stack = [String]()
        for c in s {
            switch c {
                case "(":
                    stack.append(")")
                case "{":
                    stack.append("}")
                case "[":
                    stack.append("]")
                default:
                    if stack.isEmpty {
                        return false
                    }
                    let poplastitem = stack.popLast()
                    print("\(String(describing: poplastitem!)), \(String(c))")
                    if let pop = poplastitem, pop != String(c)   {
                        return false
                    }
            }
        }
        return stack.isEmpty
    }
}


print(Solution().isValid("(]"))
