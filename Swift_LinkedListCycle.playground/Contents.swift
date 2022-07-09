import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode:Equatable{
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil {
        return false
    }
    
    var slowNode = head
    var fastNode = head?.next
    
    while fastNode != slowNode {
        if fastNode == nil || fastNode?.next == nil {
            return false
        }
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
    }
    
    return true
}

func findLengthOfTheCycle(_ head: ListNode?) -> Int {
    
    var length: Int = 0
    
    if head == nil || head?.next == nil {
        return length
    }
    
    var slowNode = head
    var fastNode = head?.next
    
    while fastNode != slowNode {
        if fastNode == nil || fastNode?.next == nil {
            return length
        }
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
    }
    
    var tempNode = slowNode?.next
    repeat {
        length += 1
        tempNode = tempNode?.next
    } while (slowNode != tempNode)
    
    return length
}


let listNode1 = ListNode(1)
let listNode2 = ListNode(2)

listNode1.next = listNode2


findLengthOfTheCycle(listNode1)
