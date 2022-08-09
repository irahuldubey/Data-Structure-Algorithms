import UIKit

class Solution {
    
    func tictactoe(_ moves: [[Int]]) -> String {
        
        guard moves.count > 0 else { return "" }
        
        var player: Int = 1
        
        var n = 3
        
        var rows: [Int] = Array(repeatElement(0, count: n))
        var columns: [Int] = Array(repeatElement(0, count: n))
        var diagonal: Int = 0
        var antiDiagonal: Int = 0
        
        for move in moves {
            
            let row = move[0]
            let column = move[1]
            
            rows[row] += player
            columns[column] += player
            
            if row == column {
                diagonal += player
            }
            
            if row + column = n - 1 {
                antiDiagonal += player
            }
            
            if abs(rows[row] == n) || abs(columns[column] == n) || abs(diagonal) == n || abs(antiDiagonal) == n {
                return player == 1 ? "A" : "B"
            }
            
            player = player * -1
        }
        
        return moves.count == n * n ? "Draw" : "Pending"
    }
}
