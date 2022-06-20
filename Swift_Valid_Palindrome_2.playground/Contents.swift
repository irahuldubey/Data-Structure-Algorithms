import UIKit

// Brute force algorithm
// Note - Time limit exceeded in this solution in LeetCode
func isValidPalindrome(_ s: String) -> Bool {

    guard !s.isEmpty else {
        return false
    }
    
    let charArray = Array(s)
    
    for (index, _) in s.enumerated() {
        var newArray = charArray
        newArray.remove(at: index)
        if newArray.reversed() == newArray {
            return true
        }
    }
    
    return false
}

print(isValidPalindrome("abca"))

// Using characters unicodeScalars

func isValidPalindrome2(_ s: String) -> Bool {

    guard !s.isEmpty else {
        return false
    }
    
    var startIndex = 0
    var endIndex = s.count - 1
    
    while startIndex < endIndex {
        
        startIndex += 1
        endIndex -= 1
    }
    
    return false
}
