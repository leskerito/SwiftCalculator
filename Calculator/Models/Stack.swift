//
//  Stack.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation

struct Stack{
    private var items: [String] = []
    
    public func peek() -> String {
        isStackEmpty() ? "Empty Stack" : items.first!
    }
    
    func isStackEmpty() -> Bool {
        items.isEmpty
    }
    
    mutating func emptyStack(){
        while !isStackEmpty(){
            print(pop())
        }
    }
    
    mutating func drop() -> Void{
        items.removeFirst()
    }
    
    func count() -> Int {
        items.count
    }
    
    public mutating func pop() -> String{
        return items.removeFirst()
    }
    
    public mutating func push(_ el: String){
        return items.insert(el, at: 0)
    }
}

extension Stack: Equatable{
    static func == (left: Stack, right: Stack) -> Bool { return left.items == right.items }
}

extension Stack: CustomStringConvertible {
    var description: String{
        if self.isStackEmpty(){
            return "Empty stack"
        }
        let itemsCopy = items.map{"| \($0) |"}
        return itemsCopy.joined()
    }
}
