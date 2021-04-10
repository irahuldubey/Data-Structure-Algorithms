import UIKit

func stringCompression(_ inputString: String) -> String {
    
    guard !inputString.isEmpty else {
        return ""
    }
    
    let charactersArray = Array(inputString)
    let charactersArrayLength:Int = charactersArray.count
    var encodedString:String = ""
    var index: Int = 0
        
    while index < charactersArrayLength {
        let initialCharacter = charactersArray[index]
        var characterCounter: Int = 1
        
        while index+1 < charactersArrayLength && charactersArray[index] == charactersArray[index+1] {
            characterCounter += 1
            index += 1
        }
        
        let result = "\(characterCounter)\(initialCharacter)"
        encodedString.append(result)
        index += 1
    }
    return encodedString
}

print(stringCompression("aaaajjjjjjja"))
