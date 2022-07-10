import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    let dummy = ListNode(0)
    dummy.next = head
    
    var firstPointer: ListNode? = dummy
    var secondPointer: ListNode? = dummy
    
    for _ in 0...n {
        firstPointer = firstPointer?.next
    }
    
    while firstPointer != nil {
        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next
    }
    
    secondPointer?.next = secondPointer?.next?.next
    
    return dummy.next
}
