import UIKit

func climbStairs(_ n: Int) -> Int {
    
    var numberOfWays = [0,1,2]
    
    if n < 3 { return numberOfWays[n] }
    
    for value in 3...n {
        numberOfWays.append(numberOfWays[value - 1] + numberOfWays[value - 2])
    }
    
    return numberOfWays[n]
}

print(climbStairs(4))
