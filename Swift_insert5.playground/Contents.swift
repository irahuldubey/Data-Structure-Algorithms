import UIKit

public func solution(_ N: Int) -> Int {

    if N == 0 { return 0 }
    
    var indexOfminNumber: Int?
    var arrayOfIntegers = String(N).compactMap({Int(String($0))})

    let element = N > 0 ? arrayOfIntegers.min() : arrayOfIntegers.max()
    
    for (index, value) in arrayOfIntegers.enumerated() {
        if value == element {
            indexOfminNumber = index
            break
        }
    }
    
    if let indexOfminNumber = indexOfminNumber {
        arrayOfIntegers.insert(5, at: indexOfminNumber)
        if let value = Int(arrayOfIntegers.compactMap { $0.description }
            .joined(separator: "")) {
            return N > 0 ? value : -value
        }
    }
    return 0
}

print(solution(505))
print(solution(5))
print(solution(50))
print(solution(05))

