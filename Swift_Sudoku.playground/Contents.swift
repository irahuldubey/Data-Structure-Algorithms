import UIKit

func sudokuSolver() {
    
}

func isSafe(board: [[Bool]], row: Int, column: Int, num: Int) -> Bool {
    
    for i in 0..<board.count {
        if board[row][column] == num {
            return false
        }
    }
    
    for board in board {
        if board[column] == num {
            return false
        }
    }
    
    let sqrt = sqrt(board.count)
    let start = row % sqrt
    let end = column - column % sqrt
    
    for 
    
    
}
