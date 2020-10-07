
func collatzConjecture(inputNumber: Int) -> Int {
    var value = inputNumber
    var steps = 0
    
    while value != 1 {
        if value % 2 == 0 {
            value = value / 2
        } else {
            value = (3 * value) + 1
        }
        steps = steps + 1
    }
    return steps
}


func recursiveCollatz(inputNumber: Int) -> Int {
    if inputNumber == 1 { return 0 }
    if inputNumber % 2 == 0 {
        return 1 + recursiveCollatz(inputNumber: Int(inputNumber/2))
    } else {
        return  1 + recursiveCollatz(inputNumber: Int(3 * inputNumber) + 1)
    }
}

print(collatzConjecture(inputNumber: 5))
print(recursiveCollatz(inputNumber: 5))

