import UIKit

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {
        return 0
    }
    
    var leftPointer = 0, rightPointer = 1, maxProfit = 0
    
    while rightPointer < prices.count {
        if prices[leftPointer] < prices[rightPointer] {
            let profit = prices[rightPointer] - prices[leftPointer]
            maxProfit = max(profit, maxProfit)
        } else {
            leftPointer = rightPointer
        }
        rightPointer += 1
    }
    
    return maxProfit
}

print(maxProfit([7,1,5,3,6,4]))
