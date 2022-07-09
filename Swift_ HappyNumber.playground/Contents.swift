import UIKit

func isHappy(_ n: Int) -> Bool {
    var slow = n
    var fast = findSquare(n)
    while (fast != 1 && slow != fast) {
        slow = findSquare(slow)
        fast = findSquare(findSquare(fast))
    }
    return fast == 1
}

private func findSquare(_ n: Int) -> Int {
    var totalSum: Int = 0
    var number = n
    while number > 0 {
        let remainder = number % 10
        totalSum = totalSum + (remainder * remainder)
        number = number / 10
    }
    return totalSum
}
