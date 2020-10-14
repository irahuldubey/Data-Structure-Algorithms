import UIKit

// O(1
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


func isPalindrome1(string: String) -> Bool {
  
      var leftPointer = 0
      var rightPointer = string.count - 1
      
      var leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
      var rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
      
      while leftIndex < rightIndex {
          if string[leftIndex] != string[rightIndex] {
              return false
          }
          
          leftPointer = leftPointer + 1
          rightPointer = rightPointer - 1
          
          leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
          rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
      }
      
  return true
}

func isPalindrome2(string: String, firstIndex: Int = 0) -> Bool {
      
      let lastIndex = string.count - 1 - firstIndex
      
      if firstIndex >= lastIndex {
          return true
      }
      
      let startIndex = string.index(string.startIndex, offsetBy: firstIndex)
      let endIndex = string.index(string.startIndex, offsetBy: lastIndex)
      
      return string[startIndex] == string[endIndex] && isPalindrome2(string: string, firstIndex: firstIndex + 1)
}

// Recursive
func isPalindrome3(string: String) -> Bool {
  var reversedCharacters = [Character]()
      for char in string.reversed() {
          reversedCharacters.append(char)
      }
  return string == String(reversedCharacters)
}


let movieString = "MOVIE"
let offsetStringIndex = movieString.index(movieString.startIndex, offsetBy: 2)
print(movieString[offsetStringIndex])
