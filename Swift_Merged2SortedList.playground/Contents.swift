import UIKit

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

let one = ListNode(1)
let four = ListNode(4)
let five = ListNode(5)
let one1 = ListNode(1)
let three = ListNode(3)
let four1 = ListNode(4)
let two = ListNode(2)
let six = ListNode(6)


func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else {
        return nil
    }
    
    var left = 0
    var right = lists.count - 1
    var lists = lists
    
    while right > 0 {
        left = 0
        while left < right {
            lists[left] = mergeList(l1: lists[left], l2: lists[right])
            left += 1
            right -= 1
        }
    }
    return lists[0]
}

func mergeList(l1: ListNode?, l2: ListNode?) -> ListNode? {
    var list1 = l1
    var list2 = l2
    
    let head: ListNode = ListNode(0)
    var tmp = head
    while list1 != nil && list2 != nil {
        let v1 = list1!.val
        let v2 = list2!.val
        
        if v1 > v2 {
            tmp.next = list2!
            list2 = list2?.next
        } else {
            tmp.next = list1!
            list1 = list1?.next
        }
        tmp = tmp.next!
    }
    tmp.next = list1 ?? list2
    return head.next
}

    /*
     Divide and conquer
     
     func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
             //base checks
             var input = lists
             if(input.count == 0) {
                 return nil
             }
             if(input.count == 1) {
                 return input[0]
             }
             
             return partition(lists,0,input.count - 1)
         }
         
         
         func partition(_ list:[ListNode?], _ start:Int, _ end:Int) -> ListNode?{
             if(start == end) {
                 return list[start]
             }
             if(start < end) {
                 let middle = (start + end)/2
                 let l1 = partition(list, start,middle)
                 let l2 = partition(list, middle + 1,end)
                 return mergeTwoList(l1,l2)
             }
             return nil
         }
         
         func mergeTwoList(_ l1:ListNode?, _ l2:ListNode?) ->ListNode? {
             if(l1 == nil) {return l2}
             if(l2 == nil) {return l1}
             var result:ListNode?
             
             if(l1!.val <= l2!.val) {
                 result = l1
                 result!.next = mergeTwoList(l1!.next,l2)
             }
             else {
                 result = l2
                 result!.next = mergeTwoList(l1,l2!.next)
             }
             return result
         }
     */
