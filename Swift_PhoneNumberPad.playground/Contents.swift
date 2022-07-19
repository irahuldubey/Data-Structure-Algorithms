import UIKit

pad(processed: "", unprocessed: "12")

func pad(processed: String, unprocessed: String) {
    
    guard !unprocessed.isEmpty else {
        print(processed)
        return
    }
    
    let processedString = processed
    let digit = Array(unprocessed)[0]
    
    var unp = unprocessed
    unp.removeFirst()
    
    guard let intDigit = digit.wholeNumberValue else { return }
    
    let from = (intDigit - 1) * 3
    let to = intDigit * 3
 
    for index in from..<to {
        
        let character: Character = "a"
        let charUnicodeValue = character.wholeNumberValue! + index
        let charValue = Character(UnicodeScalar(charUnicodeValue)!)
        
        pad(processed: processedString.appending(String(charValue)), unprocessed: unp)
    }
}

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }
    return helper(digits)
}

