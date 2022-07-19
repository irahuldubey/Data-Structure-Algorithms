import UIKit

func palindromSubset(_ s: String) -> Int {
     if s.count == 0 { return 0 }
     
     let charArray = Array(s)
     var total: Int = 0
     
     for i in 0..<charArray.count {
         let l1 = expandFromMiddle(charArray: charArray, left: i, right: i)
         let l2 = expandFromMiddle(charArray: charArray, left: i, right: i + 1)
         total = total + l1 + l2
     }

     return total
 }
 
 func expandFromMiddle(charArray: [Character], left: Int, right: Int) -> Int {
     var leftPointer: Int = left
     var rightPointer: Int = right
     
     var subTotal: Int = 0
     
     while (leftPointer >= 0 &&
             rightPointer < charArray.count &&
           charArray[leftPointer] == charArray[rightPointer]) {
         
         leftPointer = leftPointer - 1
         rightPointer = rightPointer + 1
         
         subTotal = subTotal + 1
     }
     
     return subTotal
 }
