import Foundation

public class StringQRecursion {
    
    public init() { }

    public func skipCharacter(in string: inout String, target: Character) -> String {
        var totalString: String = ""
        skip(pString: &totalString, upString: &string, target: target)
        return totalString
    }
    
    private func skip(pString: inout String, upString: inout String, target: Character) {
        
        if upString.isEmpty { return }
        
        let firstCharacter = Array(upString)[0]
        upString.remove(at: upString.startIndex)

        if firstCharacter == target {
            skip(pString: &pString, upString: &upString, target: target)
        } else {
            pString.append(String(firstCharacter))
            skip(pString: &pString, upString: &upString, target: target)
        }
    }
    
    public func subSequence(from input: String, output: inout String) {
        
        var inputString = input
        
        guard !inputString.isEmpty else {
            print("\(output)")
            return
        }
        
        let first = Array(inputString)[0]
        inputString.removeFirst()
        
        var newOutput = output + String(first)
        
        subSequence(from: inputString, output: &newOutput)
        
        subSequence(from: inputString, output: &output)
    }
    
    // T: O(N*2^n) S: O(2^N * N)
    public func subsequenceIteration(from input: [Int]) -> [[Int]] {
        var outerList: [[Int]] = [[Int]]()
        outerList.append([Int]())
        for val in input {
            for index in 0..<outerList.count {
                var internalList = outerList[index]
                internalList.append(val)
                outerList.append(internalList)
            }
        }
        return outerList
    }
}
