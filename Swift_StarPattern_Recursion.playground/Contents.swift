import UIKit

func createTraingle(row: Int, column: Int) {
    
    if row == 0 { return }
    
    if row > column {
        print("*")
        createTraingle(row: row, column: column + 1)
    } else {
        print("\n")
        createTraingle(row: row - 1, column: 0)
    }
}

createTraingle(row: 4, column: 0)
