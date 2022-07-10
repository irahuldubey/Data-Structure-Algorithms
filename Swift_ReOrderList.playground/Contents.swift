import UIKit

// LC : 143. Reorder List

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reorderList(_ head: ListNode?) {
    if head == nil || head?.next == nil {
        return
    }
    
    let midNode = middleNode(head)
    var hs = reverseNode(midNode)
    var hf = head
    
    while hs != nil && hf != nil {
        let temp = hf?.next
        hf?.next = hs
        hf = temp
        
        let temp1 = hs?.next
        hs?.next = hf
        hs = temp1
    }
    
    if hf != nil {
        hf?.next = nil
    }
}

func middleNode(_ head: ListNode?) -> ListNode? {
    var sNode = head
    var fNode = head
    while fNode != nil && fNode?.next != nil {
        sNode = sNode?.next
        fNode = fNode?.next?.next
    }
    return sNode
}

func reverseNode(_ head: ListNode?) -> ListNode? {
    guard let head = head else { return nil }
    guard head.next != nil else { return head }
    
    var currentNode: ListNode? = head
    var nextNode: ListNode?
    var previousNode: ListNode?
    
    while(currentNode != nil) {
        nextNode = currentNode?.next
        currentNode?.next = previousNode
        previousNode = currentNode
        currentNode = nextNode
    }
    return previousNode
}
