import UIKit

func setZeroes(_ matrix: inout [[Int]]) {
        
        guard matrix.count > 0 else { return }
        
        var isCol: Bool = false
    var rows: Int = matrix.count
        var columns: Int = matrix[0].count
        
        for i in 0..<rows {
            for j in 0..<columns {
               if matrix[i][j] == 0 {
                   matrix[0][j] = 0
                   if i > 0 {
                       matrix[i][0] = 0
                   } else {
                      isCol = true
                   }
               }
            }
        }
         
        for i in 1..<rows {
            for j in 1..<columns {
                if matrix[0][j] == 0 || matrix[i][0]  == 0 {
                    matrix[i][j] = 0
                }
            }
        }
         
        if matrix[0][0] == 0 {
            for row in 0..<rows {
                matrix[row][0] = 0
            }
        }
         
        if isCol {
           for column in 0..<columns {
                matrix[0][column] = 0
            }
        }
     }
