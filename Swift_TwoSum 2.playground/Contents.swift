import UIKit

func twoNumberSum(array: [Int], targetSum: Int) -> [Int] {
    guard array.count > 0 else { return []}
    var hashMap = Dictionary<Int, Int>()
    for (index, value) in array.enumerated() {
        let complementValue = targetSum - value
        if let _ = hashMap[complementValue] {
            return [complementValue, value]
        }
        hashMap[value] = index
    }
    return []
}

print(twoNumberSum(array: [3,5,-4,8,11,1,-1,6], targetSum: 10))


func twoNumberSum2(array: [Int], targetSum: Int) -> [Int] {
   for i in 0 ..< array.count - 1 {
           let firstNumber = array[i]
           for j in i + 1 ..< array.count {
               let secondNumber = array[j]
               let numberSum = firstNumber + secondNumber
               if numberSum == targetSum {
                   return [firstNumber, secondNumber]
               }
           }
       }
   return []
 }

func twoNumberSum3(array: [Int], targetSum: Int) -> [Int] {
      // Two pointer solution sorting the array takes O(log n) and then we can find the sum
      // time O(nlogn) | space O(1) for this solution
      let sortedArray = array.sorted()
      var i = 0
      var j = sortedArray.count - 1
      
      while i < j {
          let firstNumber = sortedArray[i]
          let secondNumber = sortedArray[j]
          
          let sumNumber = firstNumber + secondNumber
          
          if targetSum == sumNumber {
              return [firstNumber, secondNumber]
          } else if (targetSum > sumNumber)  {
              i = i + 1
          } else if (targetSum < sumNumber) {
              j = j - 1
          }
      }
  return []
}
