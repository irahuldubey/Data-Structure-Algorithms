import UIKit

class Sol {
    func numberOfPathInMaze(l: Int, r: Int) -> Int {

        if l == 1 || r == 1 { return 1 }
        
        let left = numberOfPathInMaze(l: l - 1, r: r)
        let right = numberOfPathInMaze(l: l, r: r - 1)
        
        return left + right
    }
    
    func totalPath(path: inout String, row: Int, column: Int) {
        if row == 1 && column == 1 {
            print("PATH: \(path)")
        }
        
        if row > 1 {
            var updatedR = path.appending("D")
            totalPath(path: &updatedR, row: row - 1, column: column)
        }
        
        if column > 1 {
            var updatedD = path.appending("R")
            totalPath(path: &updatedD, row: row, column: column - 1)
        }
   
    }
}

let sol = Sol()
var path = ""
sol.totalPathDiagonal(path: &path, row: 3, column: 3)
