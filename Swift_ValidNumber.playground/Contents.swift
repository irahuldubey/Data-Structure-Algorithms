import UIKit

//65. Valid Number

func isNumber(_ s: String) -> Bool {
    
    guard !s.isEmpty else { return false }
    
    let trimmedString: String = s.trimmingCharacters(in: .whitespaces)
    
    let arrayOfChracters: [Character] = Array(trimmedString)
    
    var isNumberSeen: Bool = false
    var isESeen: Bool = false
    var isDecimalSeen: Bool = false
    
    func isCharDigits(char: Character) -> Bool {
        if let wholeNumberValue = char.wholeNumberValue {
            return wholeNumberValue >= 0 && wholeNumberValue <= 9
        } else {
            return false
        }
    }
    
    for (index, char) in arrayOfChracters.enumerated() {
        
        debugPrint("VAL: \(char)")
        
        switch char {
            
        case ".":
            if isDecimalSeen || isESeen {
                return false
            }
            
            isDecimalSeen = true
            
        case "e", "E":
            
            if !isNumberSeen || isESeen {
                return false
            }
            
            isESeen = true
            isNumberSeen = false
            
        case "-", "+":
            
            if index != 0 && arrayOfChracters[index - 1] != "e" {
                return false
            }
            
            isNumberSeen = false
            
        default:
            if !isCharDigits(char: char) {
                return false
            }
            isNumberSeen = true
        }
    }
    
    return isNumberSeen
}

