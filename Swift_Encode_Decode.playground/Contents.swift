import UIKit

func encode(_ strs: [String]) -> String { //O(n)
    var res = ""
    for s in strs {
        res += ("\(s.count)/\(s)")
    }
    return res
}

func decode(_ s: String) -> [String] { //O(n)
    var result: [String] = []
    var charArr = Array(s)
    var index = 0

    while index < s.count {
        var decodedNumber = 0
        while let number = Int(String(charArr[index])) {
            decodedNumber = decodedNumber*10 + number
            index += 1
        }
        if decodedNumber > 0 {
            let rightBound = index + decodedNumber // Current index + number we decoded to get total string
            let leftBound = index + 1 // for slash
            let str = String(charArr[leftBound...rightBound])
            result.append(str)
        } else {
            result.append("")
        }
         
        index += decodedNumber + 1
    }
    return result
}
