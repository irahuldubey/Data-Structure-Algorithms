import UIKit

func maxRepeatingCharacter(inputString: String) -> String? {
    
    guard inputString.count > 0 else { return nil }
    
    let charArray = Array(inputString)
    var count = 0
    var maxCount = 1
    var repetitionCharacter: Character?
    
    for (index, value) in charArray.enumerated() {
        if index < charArray.count - 1 && charArray[index] == charArray[index + 1] {
            maxCount += 1
        } else {
            if maxCount > count {
                count = maxCount
                repetitionCharacter = value
            }
            maxCount = 1
        }
    }
    return String(repetitionCharacter!)
}

let repeatedOccurences = maxRepeatingCharacter(inputString: "aaaabcbcdbbeeeeee")
print(repeatedOccurences!)
