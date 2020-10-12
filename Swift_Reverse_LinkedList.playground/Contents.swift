//: Playground - noun: a place where people can play

import UIKit

public enum LinkedList<Element> {
  case empty
  indirect case list(Element, LinkedList<Element>)
}

public func reversed() -> LinkedList<Element> {
  func reversed(input: LinkedList<Element>, output: LinkedList<Element>) -> LinkedList<Element> {
    switch input {
    case .empty:
      return output
    case let .list(head, tail):
      return reversed(input: tail, output: .list(head, output))
    }
  }
  return reversed(input: self, output: .empty)
}
