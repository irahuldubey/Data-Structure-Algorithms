import UIKit

func generateParenthesis(_ n: Int) -> [String] {
    guard n > 0 else { return [] }
    var result: [String] = [String]()
    var stack: [String] = [String]()
    func backtrackParenthesis(open: Int, closed: Int) {
        if open == closed && open == n && closed == n {
            result.append(stack.joined(separator: ""))
            return
        }
        if n > open {
            stack.append("(")
            backtrackParenthesis(open: open + 1, closed: closed)
            stack.popLast()
        }
        if open > closed {
            stack.append(")")
            backtrackParenthesis(open: open, closed: closed + 1)
            stack.popLast()
        }
    }
    backtrackParenthesis(open: 0, closed: 0)
    return result
}
