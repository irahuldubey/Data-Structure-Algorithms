import UIKit

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var hashMap: [Character: Int] = [Character: Int]()
    for value in S {
        if J.contains(value) {
            if let hashValue = hashMap[value] {
                hashMap[value] = hashValue + 1
            } else {
                hashMap[value] = 1
            }
        }
    }
    return hashMap.values.reduce(0, +)
}

func numJewelsInStones2(_ J: String, _ S: String) -> Int {
    guard J.count > 0 && S.count > 0 else { return 0 }
    var count = 0
    for value in S {
        if J.contains(value) {
            count = count + 1
        }
    }
    return count
}

print(numJewelsInStones("aAA", "aAAbbbb"))
print(numJewelsInStones("z", "aAAbbbb"))

