import UIKit

//func printRectangularBox(with x: Int = 0, y: Int = 0, width: Int = 10, height: Int = 10, inputString: String) {
//
//    guard !inputString.isEmpty else {
//        return
//    }
//
//    for valHeight in 1...height {
//        for valWidth in 1...width {
//            if valHeight == 1 || valHeight == height || valWidth == 1 || valWidth == valWidth {
//             print("+")
//            } else {
//             print("*")
//            }
//        }
//    }
//}
//
//printRectangularBox(inputString: "Hello")

func printHollowRectangle(height height: Int, width width: Int) {
    for i in 0..<height {
        for j in 0..<width {
            print("*")
//            if i == 1 || i == n || j == 1 || j == n {
//                print("*")
//            } else {
//                print(" ")
//            }
//            if j == n {
//                print("\n")
//            }
        }
    }
}

printHollowRectangle(height: 5, width: 3)
