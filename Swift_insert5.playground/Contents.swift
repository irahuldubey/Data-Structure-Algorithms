import UIKit

public func solution(_ N: Int) -> Int {

    if N == 0 { return 0 }
    
    var indexOfminNumber: Int?
    var arrayOfIntegers = N.digits
    let element = N > 0 ? arrayOfIntegers.min() : arrayOfIntegers.max()
    
    for (index, value) in arrayOfIntegers.enumerated() {
        if value == element {
            indexOfminNumber = index
            break
        }
    }
    
    if let indexOfminNumber = indexOfminNumber {
        arrayOfIntegers.insert(5, at: indexOfminNumber)
        let value = arrayOfIntegers.reduce(0) { return $0*10 + $1 }
        return N > 0 ? value : -value
    }
    
    return 0
}

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}

print(solution(127))
print(solution(5))
print(solution(50))
print(solution(05))

