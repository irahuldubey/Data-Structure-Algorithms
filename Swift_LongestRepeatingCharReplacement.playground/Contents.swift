import UIKit

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        
        var hashMap: [Character: Int] = [:]
        
        var result: Int = 0
        
        var leftPointer: Int = 0
        
        let arrayOfCharacters: [Character] = Array(s)
        
        for (rightPointer, value) in arrayOfCharacters.enumerated() {
            if let arrVal = hashMap[value] {
                hashMap[value] = arrVal + 1
            } else {
                hashMap[value] = 1
            }
            
            let mValue = hashMap.values.max()
            
            if let maxValue = mValue, (rightPointer - leftPointer + 1 - maxValue) > k {
                if let arrValue = hashMap[arrayOfCharacters[leftPointer]] {
                    hashMap[arrayOfCharacters[leftPointer]] = arrValue - 1
                }
                leftPointer = leftPointer + 1
            }
            result = max(result, rightPointer - leftPointer + 1)
        }
        return result
    }
}

let sol = Solution().characterReplacement("AABABBA", 1)
print(sol)
