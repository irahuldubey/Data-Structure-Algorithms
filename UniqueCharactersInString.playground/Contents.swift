








import UIKit

//******************************************************************************************//
// Question 1:    Find if the string has all unique characters O(n log n)
//******************************************************************************************//

func stringHasUniqueCharacters(inString enteredString : String) -> Bool {
  
  let charArray = Array(enteredString.characters)
  let sortedArray = charArray.sorted {  $1 > $0 }
  for index in 0...sortedArray.count {
    if (index + 1) < sortedArray.count {
      if sortedArray[index] != sortedArray[index + 1] {
        continue
      }
      else {
        return false
      }
    }
  }
  return true
}

if stringHasUniqueCharacters(inString: "abcsgc") {
  print("has all unique characters")
}
else {
  print("does not have unique characters")
}

/********************************************************************************************/
