import UIKit

// LeetCode: 3. Longest Substring Without Repeating Characters

/*
 
 Example 1:
 
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    guard !s.isEmpty else { return 0 }
    
    let arrayOfCharacters = Array(s)
    var charSet = Set<Character>()
    
    var leftPointer = 0
    var result = 0
    
    for (index, val) in arrayOfCharacters.enumerated() {
        while charSet.contains(val) {
            charSet.remove(arrayOfCharacters[leftPointer])
            leftPointer = leftPointer + 1
        }
        charSet.insert(val)
        result = max(result, (index - leftPointer) + 1)
    }
    return result
}

lengthOfLongestSubstringHashMap("abcabcbb")


// Using hashmap
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count < 2 { return s.count }
    var dict = [Character: Int](), start = 0, result = 0
    for (currentIndex, char) in s.enumerated() {
        if let val = dict[char], val >= start {
            start = val + 1
        }
        dict[char] = currentIndex
        result = max(result, currentIndex - start + 1)
    }
    return result
}
