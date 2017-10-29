//
//  Sudoku.swift
//  Sudoku_Validator
//
//  Created by Rahul Dubey on 10/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

final class Sudoku {
  
  enum SudokuType: String {
    case valid
    case invalid
  }
  
  private var grid: [[Int]] = [[]]
  
  public var isValidSudokuBoard: SudokuType {
    if isValidSudoku() {
      return .valid
    }
    return .invalid
  }
  
  init(withGrid grid: [[Int]]) {
    self.grid = grid
  }
  
  private func isValidSudoku() -> Bool {
    
    guard isValidBoard() else {
      return false
    }
    
    if isValidRows() && isValidColumns() && isValidSquare(){
      return true
    }
    
    return false
  }
  
  private func isValidBoard() -> Bool {
    
    if grid.count < 9 {
      return false
    }
    
    for (_, value) in grid.enumerated() {
      if value.count < 9 {
        return false
      }
    }
    
    return true
  }
  
  private func isValidRows() -> Bool {
    
    for row in 0..<grid.count {
      
      var uniqueDictionary:Dictionary = [Int : Int]()
      var count: Int = 1
      
      for column in 0..<grid[row].count {
        
        let boxValue =  grid[row][column]
        
        if boxValue == 0 {
          return false
        }
        
        if let count = uniqueDictionary[boxValue] {
          if count > 1 {
            return false
          }
        }
        
        if uniqueDictionary[boxValue] == nil {
          uniqueDictionary[boxValue] = 1
        }
        else{
          count = count + 1
          uniqueDictionary[boxValue] = count
        }
      }
      
      if count > 1 {
        return false
      }
      
    }
    return true
  }
  
  private func isValidColumns() -> Bool {
    
    for row in 0..<grid.count {
      
      var uniqueDictionary = [Int : Int]()
      var count: Int = 1
      
      for column in 0..<grid[row].count {
        
        let boxValue =  grid[column][row]
        
        if boxValue == 0 {
          return false
        }
        
        if let count = uniqueDictionary[boxValue] {
          if count > 1 {
            return false
          }
        }
        
        if uniqueDictionary[boxValue] == nil {
          uniqueDictionary[boxValue] = 1
        }
        else{
          count = count + 1
          uniqueDictionary[boxValue] = count
        }
      }
      
      if count > 1 {
        return false
      }
      
    }
    return true
  }
  
  private func isValidSquare() -> Bool {
    
    //Subgrids
    
    for i in 0..<3 {
      for j in 0..<3 {
        
        var uniqueDictionary = [Int : Int]()
        var count = 1
        
        for rowItem in 0..<3 {
          for columnItem in 0..<3 {
            
            let row = (3 * i) + rowItem
            let column = (3 * j) + columnItem
            
            let boxValue =  grid[column][row]
            
            if boxValue == 0 {
              return false
            }
            
            if let count = uniqueDictionary[boxValue] {
              if count > 1 {
                return false
              }
            }
            
            if uniqueDictionary[boxValue] == nil {
              uniqueDictionary[boxValue] = 1
            }
            else{
              count = count + 1
              uniqueDictionary[boxValue] = count
            }
          }
        }
      }
    }
    return true
  }
}
