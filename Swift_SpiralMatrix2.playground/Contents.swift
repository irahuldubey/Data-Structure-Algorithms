import UIKit

func generateMatrix(_ n: Int) -> [[Int]] {

    enum Direction {
        case right
        case bottom
        case left
        case top
    }

    var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
    var row = 0
    var column = 0
    var direction: Direction = .right
    for i in 1...n*n {
        matrix[row][column] = i
        switch direction {
        case .right:
            if column + 1 < n && matrix[row][column + 1] == 0 {
                column += 1
            } else {
                direction = .bottom
                row += 1
            }
        case .bottom:
            if row+1 < n && matrix[row + 1][column] == 0 {
                row += 1
            }else{
                direction = .left
                column -= 1
            }
        case .left:
            if column-1 >= 0 && matrix[row][column-1] == 0 {
                column -= 1
            }else{
                direction = .top
                row -= 1
            }
        case .top:
            if row-1 >= 0 && matrix[row-1][column] == 0 {
                row -= 1
            }else{
                direction = .right
                column += 1
            }
        }
    }
    return matrix
}
