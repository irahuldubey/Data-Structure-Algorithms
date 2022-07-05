import UIKit

/*
 
 Complexity Analysis - Copied from Leet Code

 Time complexity : \mathcal{O}(\sum_{k = 1}^{N}{P(N, k)})O(∑
 k=1
 N
 ​
  P(N,k)) where P(N, k) = \frac{N!}{(N - k)!} = N (N - 1) ... (N - k + 1)P(N,k)=
 (N−k)!
 N!
 ​
  =N(N−1)...(N−k+1) is so-called k-permutations_of_n, or partial permutation.
 Here first + 1 = kfirst+1=k for the expression simplicity. The formula is easy to understand : for each kk (each firstfirst) one performs N(N - 1) ... (N - k + 1)N(N−1)...(N−k+1) operations, and kk is going through the range of values from 11 to NN (and firstfirst from 00 to N - 1N−1).

 Let's do a rough estimation of the result : N! \le \sum_{k = 1}^{N}{\frac{N!}{(N - k)!}} = \sum_{k = 1}^{N}{P(N, k)} \le N \times N!N!≤∑
 k=1
 N
 ​
   
 (N−k)!
 N!
 ​
  =∑
 k=1
 N
 ​
  P(N,k)≤N×N!, i.e. the algorithm performs better than \mathcal{O}(N \times N!)O(N×N!) and a bit slower than \mathcal{O}(N!)O(N!).

 Space complexity : \mathcal{O}(N!)O(N!) since one has to keep N! solutions.
 
 */

func permute(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = [[Int]]()
    if nums.count == 1 {
        return [nums]
    }
    var nums = nums
    var index = 0
    
    while index < nums.count {
        let firstVal = nums[0]
        let remainder = nums.remove(at: 0)
        let permuted = permute(nums)
        var permResult = [[Int]]()
        for var pVal in permuted {
            pVal.append(remainder)
            permResult.append(pVal)
        }
        result.append(contentsOf: permResult)
        nums.append(firstVal)
        index = index + 1
    }
    return result
}

permute([1,2,3])
