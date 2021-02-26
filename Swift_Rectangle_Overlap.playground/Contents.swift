import UIKit

func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    // O(1) space and O(1) time
    return !(rec2[0] >= rec1[2] || rec2[1] >= rec1[3] ||
             rec2[3] <= rec1[1] || rec2[2] <= rec1[0] )
}

print(isRectangleOverlap([0,0,2,2], [1,1,3,3]))
