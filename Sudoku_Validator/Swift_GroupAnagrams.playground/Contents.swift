import UIKit

/*
 
 Complexity Analysis

 Time Complexity: O(NK \log K)O(NKlogK), where NN is the length of strs, and KK is the maximum length of a string in strs. The outer loop has complexity O(N)O(N) as we iterate through each string. Then, we sort each string in O(K \log K)O(KlogK) time.

 Space Complexity: O(NK)O(NK), the total information content stored in ans.
 
*/

func groupAnagramsWithSorting(_ strs: [String]) -> [[String]] {
    
    guard !(strs.isEmpty) || !(strs.first == "") else {
        return [[""]]
    }
    
    var dictionaryMap = [String: [String]]();
    
    for stringValue in strs {
        let key = String(stringValue.sorted())
        
        if let _ = dictionaryMap[key] {
            dictionaryMap[key]?.append(stringValue)
        } else {
            dictionaryMap[key] = [stringValue]
        }
    }
    
    return dictionaryMap.map { return $0.value }
}

let anagramArray = ["eat","tea","tan","ate","nat","bat"]

/*
Complexity Analysis

Time Complexity: O(NK)O(NK), where NN is the length of strs, and KK is the maximum length of a string in strs. Counting each string is linear in the size of the string, and we count every string.

Space Complexity: O(NK)O(NK), the total information content stored in ans.
*/

func groupAnagramsWithoutSorting(_ strs: [String]) -> [[String]] {
    
    func hashValue(_ str: String) -> UInt64 {
        var hash: UInt64 = 0
        for code in str.unicodeScalars {
            print(code.value)
            let value = code.value - 97
            hash += UInt64(pow(5.0, Double(value)))
        }
        return hash
    }
    
    var dic = [UInt64: [String]]()
    for str in strs {
        let hash = hashValue(str)
        if let strings = dic[hash] {
            dic[hash] = strings + [str]
        } else {
            dic[hash] = [str]
        }
    }
    return Array(dic.values)
}


print(groupAnagramsWithSorting(anagramArray))
