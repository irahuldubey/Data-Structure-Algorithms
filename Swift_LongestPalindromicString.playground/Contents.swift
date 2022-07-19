class Solution {
   func longestPalindrome(_ s: String) -> String {
        if s.count < 2 { return s }
        
        let charArray = Array(s)
        var start = 0
        var end = 0

        for i in 0..<charArray.count {
            let l1 = expandFromMiddle(charArray: charArray, left: i, right: i)
            let l2 = expandFromMiddle(charArray: charArray, left: i, right: i + 1)
            let length = max(l1, l2)
            if length > end - start {
                start = i - ((length - 1) / 2)
                end = i + (length / 2)
            }
        }

        return String(charArray[start..<end + 1])
    }
    
    func expandFromMiddle(charArray: [Character], left: Int, right: Int) -> Int {
        var leftPointer: Int = left
        var rightPointer: Int = right
        
        while (leftPointer >= 0 &&
                rightPointer < charArray.count &&
              charArray[leftPointer] == charArray[rightPointer]) {
            
            leftPointer = leftPointer - 1
            rightPointer = rightPointer + 1
        }
        
        return rightPointer - leftPointer - 1
    }
}
