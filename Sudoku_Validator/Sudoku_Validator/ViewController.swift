//
//  ViewController.swift
//  Sudoku_Validator
//
//  Created by Rahul Dubey on 10/29/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let grid1 =   [[1,2,3, 4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9],
                 [1,2,3,  4,5,6,  7,8,9]]
  
  let grid2 =   [[4,3,5,  2,6,9,  7,8,1],
                 [6,8,2,  5,7,1,  4,9,3],
                 [1,9,7,  8,3,4,  5,6,2],
                 [8,2,6,  1,9,5,  3,4,7],
                 [3,7,4,  6,8,2,  9,1,5],
                 [9,5,1,  7,4,3,  6,2,8],
                 [5,1,9,  3,2,6,  8,7,4],
                 [2,4,8,  9,5,7,  1,3,6],
                 [7,6,3,  4,1,8,  2,5,9]]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let sudokuObj = Sudoku(withGrid: grid2)
    
    print("Sudoku is \(sudokuObj.isValidSudokuBoard.rawValue)")
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

