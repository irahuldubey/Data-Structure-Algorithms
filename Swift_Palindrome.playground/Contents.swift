import UIKit

func isPalindrome(_ s: String) -> Bool {

    let lowerCasedString = s.lowercased().map({ return $0 })
    
    var leftPointer = 0
    var rightPointer = s.count - 1
        
    while leftPointer < rightPointer {
        
        let leftValue = lowerCasedString[leftPointer]
        let rightValue = lowerCasedString[rightPointer]
        
        if let leftAsciivalue = leftValue.asciiValue, leftAsciivalue < 97 || leftAsciivalue > 122, !(leftAsciivalue >= 48 && leftAsciivalue <= 57) {
            leftPointer = leftPointer + 1
            continue
        }
        
        if let rightAsciiValue = rightValue.asciiValue, rightAsciiValue < 97 || rightAsciiValue > 122, !(rightAsciiValue >= 48 && rightAsciiValue <= 57) {
            rightPointer = rightPointer - 1
            continue
        }
        
        if lowerCasedString[leftPointer] != lowerCasedString[rightPointer] {
            return false
        }
        
        leftPointer = leftPointer + 1
        rightPointer = rightPointer - 1
    }
    
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("madam"))
print(isPalindrome("madam>...."))


