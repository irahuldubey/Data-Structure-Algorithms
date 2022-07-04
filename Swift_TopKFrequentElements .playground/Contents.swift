import UIKit

struct Sol {
    
    // O nlogn // Hash Map
    static func topKFrequentHashMap(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 else { return [] }
        
        guard nums.count > 1 else { return [nums[0]] }
        
        var hashTable: [Int: Int] = [:]
        
        var totalElememts: [Int] = [Int]()
        
        for val in nums {
            if let value = hashTable[val] {
                hashTable[val] = value + 1
            } else {
                hashTable[val] = 1
            }
        }
        
        let sortedHashTable = hashTable.sorted { (first, second) -> Bool in
            return first.value > second.value
        }
            
        for i in 0..<k {
            let dict = sortedHashTable[i]
            totalElememts.append(dict.key)
        }
        
        return totalElememts
    }
    
    
    static func topKFrequentBucketSort(_ nums: [Int], _ k: Int) -> [Int] {
        
        guard nums.count > 0 else { return [] }
        
        guard nums.count > 1 else { return [nums[0]] }
        
        var hashTable: [Int: Int] = [:]
                
        for val in nums {
            if let value = hashTable[val] {
                hashTable[val] = value + 1
            } else {
                hashTable[val] = 1
            }
        }
        
        var arrayList: [[Int]] = Array.init(repeating: [0], count: nums.count)
        
        for hashKey in hashTable.keys {
            if let valueInHash = hashTable[hashKey] {
                if arrayList[valueInHash].count == 0 {
                    arrayList[valueInHash] = []
                }
                arrayList[valueInHash].insert(valueInHash, at: arrayList[valueInHash].count + 1)
            }
        }
        
        var bucketList: [Int] = [Int]()
        
        for value in arrayList.reversed() {
            if value.count == 1 && value.contains(0) {
                print("SKIP BUCKET")
            } else {
                bucketList.append(contentsOf: value)
            }
        }
        
        return bucketList
    }
}

let kValue = Sol.topKFrequentBucketSort([1,1,1,2,2,3], 2)
print(kValue)
