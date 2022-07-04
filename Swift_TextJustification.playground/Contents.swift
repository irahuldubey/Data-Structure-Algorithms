import UIKit

// Text Justification

var totalVal = 0

["This", "is", "an", "example", "of", "text", "justification."].forEach { val in
    totalVal = totalVal + val.count
}

print(totalVal)

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {

    guard !words.isEmpty && words.count >= 1 else { return [] }
    
    var inputArrayWords: [Int] = [Int]()
    words.forEach { value in
        inputArrayWords.append(value.count)
    }
    let inputArrayCount: Int = inputArrayWords.count
    let outputArrayCount: Int = Int(ceil(Double((inputArrayCount / 16))))
    
    var outputArray = Array.init(repeating: "", count: 3)
    
    
    
    return []
}


