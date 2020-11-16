

func minReplacementOf(A: [Int]) -> Int {
    var flipCount = 0

    for (index, value) in A.enumerated() {

        // If there is 1 at even index positions
        if index % 2 == 0 && value == 1 {
            flipCount += 1
        }

        // If there is 0 at odd index positions
        if index % 2 == 1 && value == 0 {
            flipCount += 1
        }
    }
    return min(flipCount, A.count - flipCount)
}

print(minReplacementOf(A: [1,0,1,0,1,1]))


