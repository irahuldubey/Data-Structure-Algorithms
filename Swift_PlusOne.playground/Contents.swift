import UIKit

func plusOne(_ digits: [Int]) -> [Int] {
    guard digits.count > 0 else { return [] }
    
    var newDigits:[Int] = digits
    
    for i in (0..<digits.count).reversed() {
        if newDigits[i] < 9 {
            newDigits[i] = newDigits[i] + 1
            return newDigits
        } else {
            newDigits[i] = 0
        }
    }
    
    newDigits.insert(1, at: 0)
    return newDigits
}

print(plusOne([9,9]))


print("rahu".hashValue)
