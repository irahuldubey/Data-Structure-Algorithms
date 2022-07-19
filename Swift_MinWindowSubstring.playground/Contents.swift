import UIKit

func minWindow(_ s: String, _ t: String) -> String {
    
    guard !t.isEmpty else { return "" }
    
    var windowMap: [Character: Int] = [:]
    var needMap: [Character: Int] = [:]
    
    var have: Int = 0
    var need: Int = 0
    
    for (_, value) in Array(t).enumerated() {
        if let val = needMap[value] {
            needMap[value] = val + 1
        } else {
            needMap[value] = 1
        }
    }
                
    need = needMap.count
                
    var l: Int = 0
    
    var res = [-1, -1]
    var resLength = Int.max
    
    let arrayOfCharacters: [Character] = Array(s)

    for r in 0..<arrayOfCharacters.count  {
        
        let c = arrayOfCharacters[r]
        
        if let windowVal = windowMap[c] {
            windowMap[c] = windowVal + 1
        } else {
            windowMap[c] = 1
        }
        
        if needMap.keys.contains(c) && windowMap[c] == needMap[c] {
            have = have + 1
        }
        
        while have == need {
            if (r - l + 1) < resLength {
                res = [l, r]
                resLength = r - l + 1
            }
            let chatAtLeftPointer = arrayOfCharacters[l]
            windowMap[chatAtLeftPointer] = windowMap[chatAtLeftPointer]! - 1
            if needMap.keys.contains(chatAtLeftPointer) && windowMap[chatAtLeftPointer]! < needMap[chatAtLeftPointer]! {
                have = have - 1
            }
            l = l + 1
        }
    }
    
    let l1 = res[0]
    let r1 = res[1]
    
    if resLength != Int.max {
        let subString = String(arrayOfCharacters[l1..<r1 + 1])
        return subString
    } else {
        return ""
    }
}

print(minWindow("ADOBECODEBANC", "ABC"))
