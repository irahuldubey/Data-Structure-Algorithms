import UIKit

var arrray: [Int] = [0, 10, 20, 30, 25, 5, 40, 35]

class Sol {
    func insert(elements: inout [Int], n: Int) {
        var i = n
        let temp = elements[i]
        while i > 1 && temp > elements[i/2] {
            elements[i] = elements[i/2]
            i = i / 2
        }
        elements[i] = temp
    }
    
    func delete(elements: inout [Int], n: Int) -> Int {
        var i, j, x, val: Int
        x = elements[n]
        val = elements[1]
        elements[1] = elements[n]
        i = 1
        j = 2*i
        
        elements[n] = val
        
        while (j < n - 1) {
            if elements[j+1] > elements[j] {
                j = j + 1
            }
            if elements[i] < elements[j] {
                let temp = elements[i]
                elements[i] = elements[j]
                elements[j] = temp
                
                i = j
                j = 2 * j
            }
        }
        return val
    }
}

let sol = Sol()
for i in 2...7 {
    sol.insert(elements: &arrray, n: i)
}
print(arrray)

for index in stride(from: 7, through: 2, by: -1) {
    sol.delete(elements: &arrray, n: index)
}
print(arrray)
