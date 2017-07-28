

import UIKit

//Check if one string is permutation of other

//Need to check 2 things 
//->>>>>>>>>>>>>1. String should be equal
//->>>>>>>>>>>>>2. Any character in one string matched in other String
// Good Solution is: A Simple Solution is sort both arrays and compare sorted arrays. Time complexity of this solution is O(nLogn)
// Recommended Solution is using Hashing


func checkPermutation(ofString: String, toString: String) -> Bool{
  
  if ofString.isEmpty || toString.isEmpty {
    return false
  }
  
  if ofString.characters.count != toString.characters.count {
    return false
  }
  
  var hashMap = [Character: Int]()
  
  for characters in ofString.characters {
    if let value = hashMap[characters] {
        hashMap[characters] = value + 1
    }
    else{
        hashMap[characters] = 1
    }
  }
  
  for characters in toString.characters {
    if let value = hashMap[characters] {
      hashMap[characters] = value - 1
    } else {
      return false
    }
  }

  for (_, value) in hashMap {
    if value != 0 {
      return false
    }
  }
  
  return true
}

print(checkPermutation(ofString: "abc", toString: "acb"))
