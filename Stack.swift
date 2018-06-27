//
//  Queue.swift
//  AgentApp
//
//  Created by Vsevolod Sevostyanov on 27/06/2018.
//  Copyright © 2018 Vsevolod Sevostyanov. All rights reserved.
//

struct Stack<T> {
    var array: [T] = []

    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        if !array.isEmpty {
            let index = array.count - 1
            let poppedValue = array.remove(at: index)
            return poppedValue
        } else {
            return nil
        }
    }
    
    mutating func clear() {
        array = []
    }
    
    func peek() -> T? {
        if !array.isEmpty {
            return array.last
        } else {
            return nil
        }
    }
    
    
    var isEmpty: Bool {
        return array.isEmpty
    }
}
