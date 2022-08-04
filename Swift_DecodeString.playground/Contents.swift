import UIKit

func decodeString(_ s: String) -> String {
    var stack = [(String, Int)]()
    var result = ""
    var num = 0

    for char in s {
        switch char {
        case "[":
            stack.append((result, num))
            result = ""
            num = 0
        case "]":
            let (prev, num) = stack.removeLast()
            result = prev + String(repeating: result, count: num)
        case _ where char.isNumber:
            num *= 10
            num += Int(String(char))!
        default:
            result += String(char)
        }
    }
    return result
}

print(decodeString("3[a]2[bc]"))
