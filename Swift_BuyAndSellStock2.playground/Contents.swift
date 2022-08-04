import UIKit

func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }
    var profitVal: Int = 0
    for index in 1..<prices.count - 1 {
        if prices[index] > prices[index - 1] {
            profitVal = profitVal + (prices[index] - prices[index - 1])
        }
    }
    return profitVal
}
