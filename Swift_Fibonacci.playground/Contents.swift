import UIKit

func fib(_ n: Int) -> Int { return n < 2 ? n : (fib(n-1) + fib(n-2)) }



print(fib(4))
