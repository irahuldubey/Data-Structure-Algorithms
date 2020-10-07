import UIKit

var str = "Hello, playground"


func removeVowels(_ S: String) -> String {
    let vowelArray: [Character] = ["a","e","i","o","u"]
    var newString: String = ""
    for value in S {
        if !vowelArray.contains(value) {
          newString.append(value)
        }
    }
    return newString
}

print(removeVowels("aeiour"))
