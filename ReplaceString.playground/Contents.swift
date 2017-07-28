

//************************************************************************************************/
//                        Functional Programming
//************************************************************************************************/
var str = "Hello, playground"
extension String {
  func replaceSpaces() -> String {
    return self.characters.reduce("") {
      if $1 == " " { return $0 + "%20"
      } else { return $0 + String($1) }
    }
  }
}

str.replaceSpaces()
//************************************************************************************************/
//                          Swift Way
//************************************************************************************************/
func replaceCharaceters(stringCharacters: String) -> [String] {
  var stringBuffer: [String] = []
  for char in stringCharacters.characters {
    if char == " " {
      stringBuffer.append("%20")
    }
    else{
      stringBuffer.append("\(char)")
    }
  }
  return stringBuffer
}
let c = replaceCharaceters(stringCharacters: "H H").joined()

//************************************************************************************************/
//                  Replace with %20 using a new char array 
//************************************************************************************************/

func replacePercent20InString(string: String) -> [Character]{
  
  let stringLength = string.characters.count
  let char = Array(string.characters)
  var spaceCount: Int = 0
  
  for (index, value) in string.characters.enumerated(){
    if value == " " {
      spaceCount += 1
    }
  }
  
  var newItemsCount = stringLength + spaceCount * 2
  var charArray = [Character?].init(repeating: nil, count: newItemsCount)
  for (index, value) in string.characters.enumerated().reversed() {
    if char[index] == " " {
        charArray[newItemsCount - 1] = "0"
        charArray[newItemsCount - 2] = "2"
        charArray[newItemsCount - 3] = "%"
        newItemsCount = newItemsCount - 3
    }
    else{
      charArray[newItemsCount - 1] = char[index]
      newItemsCount = newItemsCount - 1
    }
  }
  return charArray as! [Character]
}

print(replaceCharaceters(stringCharacters: "H e l l o").joined())













