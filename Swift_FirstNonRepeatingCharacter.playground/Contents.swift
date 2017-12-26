//: Playground - noun: a place where people can play

import UIKit

/*
 Given a string s, find and return the first instance of a non-repeating character in it. If there is no such character, return '_'.
 
 Example
 
 For s = "abacabad", the output should be
 firstNotRepeatingCharacter(s) = 'c'.
 
 There are 2 non-repeating characters in the string: 'c' and 'd'. Return c since it appears in the string first.
 
 For s = "abacabaabacaba", the output should be
 firstNotRepeatingCharacter(s) = '_'.
 
 There are no characters in this string that do not repeat.
 
*/

func firstNotRepeatingCharacter(s: String) -> Character {
  var occurrences: [Character:Int] = [:]
  s.forEach{ occurrences[$0] = (occurrences[$0] ?? 0) + 1}
  return s.first{ occurrences[$0] == 1 } ?? "_"
}
