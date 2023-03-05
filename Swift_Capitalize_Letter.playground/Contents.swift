import UIKit

// Leet Code: 2129. Capitalize the Title

func capitalizeTitle(_ title: String) -> String {
	let temp = title.lowercased()
	var tokens = temp.components(separatedBy:" ")
	for i in 0..<tokens.count {
		if(tokens[i].count > 2) {
			print(i)
			tokens[i] = tokens[i].capitalized
		}
	}
	return tokens.joined(separator: " ")
}

print(capitalizeTitle("capiTalIze tHe titLe"))
