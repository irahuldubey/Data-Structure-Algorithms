import UIKit

class LRUCache {

    var cacheArray: [Int] = [Int]()
    
    init(_ capacity: Int) {
        cacheArray = Array.init(repeating: 0, count: capacity)
    }
    
    func get(_ key: Int) -> Int {
        if cacheArray[key] > 0 {
            return cacheArray[key]
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if cacheArray[key] > 0 {
            cacheArray[key] = value
        } else if (cacheArray[key] == 0 && key < cacheArray.count) {
            cacheArray[key] = value
        } else {
            if cacheArray.count > 0 {
                cacheArray[0] = value
            }
        }
    }
}


/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
let object = LRUCache.init(3)
object.put(0, 1)
object.put(1, 2)
object.put(2, 3)

print(object.cacheArray)

object.put(2, 3)
