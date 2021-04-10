import UIKit

func countCharacters(inputString: String) {
    
    guard !inputString.isEmpty else {
        return
    }
    
    let inputArray: [Character] = Array.init(inputString)
    
    var counter: Int = 1
    var outputString: String = ""
    
    for (index, val) in inputArray.enumerated() {
        if index + 1 < inputArray.count {
            if inputArray[index] == inputArray[index + 1] {
                counter += 1
            }
        }
        let val = "\(counter)\(val)"
        outputString.append(val)
    }
    print(outputString)
}

countCharacters(inputString: "aaab")
