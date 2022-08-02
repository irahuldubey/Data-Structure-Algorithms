import UIKit

var myboard = Array(repeating: Array(repeating: false, count: 4), count: 4)

solveNKnights(board: myboard, row: 0, column: 0, knights: 4)

func solveNKnights(board: [[Bool]], row: Int, column: Int, knights: Int) {

    if knights == 0 {
        let result = displayBoard(board)
//            print(result)
        print(" ")
        return
    }
    
    if row == board.count - 1 && column == board.count {
        return
    }
    
    var myBoard = board
    
    if column == myBoard.count {
        solveNKnights(board: myBoard, row: row + 1, column: 0, knights: knights)
        return
    }
    
    if isSafe(myBoard, row, column) {
        myBoard[row][column] = true
        solveNKnights(board: myBoard, row: row, column: column + 1, knights: knights - 1)
        myBoard[row][column] = false
    }
    
    solveNKnights(board: myBoard, row: row, column: column + 1, knights: knights)

}

func isSafe(_ board: [[Bool]], _ row: Int, _ column: Int) -> Bool {
    if isValid(board, row - 2, column - 1), row >= 2, column >= 1 {
        if board[row - 2][column - 1] {
            return false
        }
    }
    
    if isValid(board, row - 1, column - 2) && row >= 1 && column >= 2{
        if board[row - 1][column - 2] {
            return false
        }
    }
    
    if isValid(board, row, column), row >= 2, column < board.count - 1 {
        if board[row - 2][column + 1] {
            return false
        }
    }
    
    if isValid(board, row - 1, column + 2), row >= 1 {
        if board[row - 1][column + 2] {
            return false
        }
    }
    return true
}

func isValid(_ board: [[Bool]], _ row: Int, _ column: Int) -> Bool {
    if row >= 0 && row < board.count && column >= 0 && column < board.count {
        return true
    }
    return false
}


func displayBoard(_ board: [[Bool]]) -> [String] {
    var finalResult: [String] = [String]()
    for row in board {
        var result: String = ""
        for element in row {
            if element == true {
                result = result + "K"
            } else {
                result = result + "."
            }
        }
        finalResult.append(result)
        print(finalResult)
        finalResult.removeAll()
    }
    return finalResult
}


