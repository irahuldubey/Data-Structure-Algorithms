import UIKit

var greeting = "Hello, playground"

func middleNode(_ head: ListNode?) -> ListNode? {
      var slow: ListNode? = head
      var fast: ListNode? = head
      
      while fast != nil && fast?.next != nil {
          slow = slow?.next
          fast = fast?.next?.next
      }
      
      return slow
  }
