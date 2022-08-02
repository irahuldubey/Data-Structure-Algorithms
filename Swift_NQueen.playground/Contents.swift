import UIKit

// Time Complexity - N!


print(solveNQueens(5))

func solveNQueens(_ n: Int) -> [[String]] {
    guard n > 0 else { return [[]] }
    let board = Array(repeating: Array(repeating: false, count: n), count: n)
    return nQueen(board: board, row: 0)
}

func nQueen(board: [[Bool]], row: Int) -> [[String]] {

    if row == board.count {
        var list: [[String]] = [[String]]()
        let boardString = displayBoard(board)
        list.append(boardString)
        return list
    }
    
    var countVal: [[String]] = [[String]]()
    var tempBoard = board
    
    // Placing the queen and checking for every row and column
    for column in 0..<board.count {
        // Place the queen if it is safe?
        if (isSafe(board: board, row: row, column: column)) {
            tempBoard[row][column] = true
            let val = nQueen(board: tempBoard, row: row + 1)
            countVal.append(contentsOf: val)
            tempBoard[row][column] = false
        }
    }
    
    return countVal
}

func isSafe(board: [[Bool]], row: Int, column: Int) -> Bool {
    // Check Vertical
    for i in 0..<row {
        if board[i][column] {
            return false
        }
    }
    
    // Diagonal Left
    let maxLeft = min(row, column)
    if maxLeft > 0  {
        for i in 1...maxLeft {
            if board[row - i][column - i] {
                return false
            }
        }
    }
    
    // Diagonal Right
    let maxRight = min(row, board.count - column - 1)
    if maxRight > 0 {
        for i in 1...maxRight {
            if board[row-i][column + i] {
                return false
            }
        }
    }
    
    return true
}

func displayBoard(_ board: [[Bool]]) -> [String] {
    var finalResult: [String] = [String]()
    for row in board {
        var result: String = ""
        for element in row {
            if element == true {
                result = result + "Q"
            } else {
                result = result + "."
            }
        }
        finalResult.append(result)
    }
    return finalResult
}
