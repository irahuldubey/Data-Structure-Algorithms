import UIKit

func numberOfPaths(r: Int, c: Int) -> Int {
    if r == 1 || c == 1 {
        return 1
    }
    
    let left = numberOfPaths(r: r - 1, c: c)
    let right = numberOfPaths(r: r, c: c - 1)
    
    return left + right
}

print(numberOfPaths(r: 3, c: 3))

func printPaths(path: String, r: Int, c: Int) {
    if r == 1 && c == 1 {
        print("PATH: -> \(path)")
        return
    }
    if r > 1 {
        printPaths(path: path + "D", r: r - 1, c: c)
    }
    if c > 1 {
        printPaths(path: path + "R", r: r, c: c - 1)
    }
}

printPathsDiagonal(path: "", r: 3, c: 3)

func printPathsDiagonal(path: String, r: Int, c: Int) {
    if r == 1 && c == 1 {
        print("PATH :", path)
        return
    }
    
    if r > 1 && c > 1 {
        printPathsDiagonal(path: path + "D", r: r - 1, c: c - 1)
    }
    
    if r > 1 {
        printPathsDiagonal(path: path + "V", r: r - 1, c: c)
    }
    
    if c > 1 {
        printPathsDiagonal(path: path + "H", r: r, c: c - 1)
    }
}

func printPathWRestrictions(path: String, maze: [[Bool]], r: Int, c: Int) {
    if r == maze.count - 1 && c == maze[0].count - 1 {
        print("PATH: -> \(path)")
        return
    }
    
    if maze[r][c] == false {
        return
    }
    
    if r < maze.count - 1 {
        printPathWRestrictions(path: path + "D", maze: maze, r: r + 1, c: c)
    }
    
    if c < maze[0].count - 1 {
        printPathWRestrictions(path: path + "R", maze: maze, r: r, c: c + 1)
    }
}

let board: [[Bool]] = [
                       [true, true, true],
                       [true, false, true],
                       [true, true, true]
                      ]

var path: String = ""
printPathWRestrictions(path: path, maze: board, r: 0, c: 0)
