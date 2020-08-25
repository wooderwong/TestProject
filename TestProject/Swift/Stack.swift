//
//  Stack.swift
//  TestProject
//
//  Created by BDKid on 2020/8/25.
//  Copyright © 2020 BDKid. All rights reserved.
//

import UIKit

class Stack {
    var statck: [AnyObject]
    var isEmpty: Bool { return statck.isEmpty }
    var peek: AnyObject? { return statck.last }
    
    init() {
        statck = [AnyObject]()
    }
    
    func push(object: AnyObject) {
        statck.append(object)
    }
    
    func pop() -> AnyObject? {
        if !isEmpty {
            return statck.removeLast()
        }else{
            return nil
        }
    }
   
}
