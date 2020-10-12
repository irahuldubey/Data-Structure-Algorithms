func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
  // O(n) time | O(1) space
      var sequenceIndex = 0
      for value in array {
          if sequenceIndex == sequence.count {
              break
          }
          if value == sequence[sequenceIndex] {
              sequenceIndex += 1
          }
      }
      return sequenceIndex == sequence.count
}

print(isValidSubsequence([1,3,5,7,9,11], [1, 5, 11]))
