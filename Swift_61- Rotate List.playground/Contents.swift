import UIKit

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if k <= 0 || head == nil, head?.next == nil {
        return head
    }
    
    var head = head
    var last = head
    var length: Int = 1
    
    while last?.next != nil {
        last = last?.next
        length = length + 1
    }
    
    last?.next = head
    
    let rotations = k % length
    
    let skip = length - rotations
    var newLast = head
    for index in 0..<skip - 1 {
        newLast = newLast?.next
    }
    
    head = newLast?.next
    newLast?.next = nil
    
    return head
}

