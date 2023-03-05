import UIKit

func findTwoscomplement(_ val : String) -> String? {
	var str = Array(val)
	let n : Int = str.count
	// Traverse the string to get first '1' from
	// the last of string
	var i : Int;
	do
	{
		i = n - 1;
		while (i >= 0)
		{
			if (str[i] == "1")
			{
				break;
			}
			i -= 1;
		}
	}
	// If there exists no '1' concat 1 at the
	// starting of string
	if (i == -1) {
		return "1" + String(str);
	}

	do {
		var k : Int = i - 1;
		// Continue traversal after the position of
		// first '1'
		while (k >= 0) {
			if str[k] == "1" {
				str[k] = "0"
			} else {
				str[k] = "1"
			}
			k -= 1
		}
	}
	// return the modified string
	return String(str)
}
