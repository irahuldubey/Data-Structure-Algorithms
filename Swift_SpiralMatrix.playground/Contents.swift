import UIKit

// LC : 54. Spiral Matrix

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
       
       guard matrix.count > 0 else { return [] }
     
       var result: [Int] = [Int]()
       
       var top: Int = 0
       var right: Int = matrix[0].count
       var left: Int = 0
       var bottom: Int = matrix.count
       
       while bottom > top && right > left {
           // Move right
           for i in stride(from: left, to: right, by: 1) {
               result.append(matrix[top][i])
           }
           top = top + 1
           
           // Move down
           for i in stride(from: top, to: bottom, by: 1) {
               result.append(matrix[i][right - 1])
           }
           right = right - 1
           
           if !(right > left && bottom > top) {
               break
           }
           
           // Move left
           for i in stride(from: right - 1, to: left - 1, by: -1) {
               result.append(matrix[bottom - 1][i])
           }
           bottom = bottom - 1
           
           // Move up
           for i in stride(from: bottom - 1, to: top - 1, by: -1) {
               result.append(matrix[i][left])
           }
           left = left + 1
       }
       
       return result
   }
