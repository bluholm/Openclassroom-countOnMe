//
//  calculs.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-18.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import UIKit

func calculate(elements: [String]) -> [String] {
    
    print("\(elements)")
    // Create local copy of operations
    var operationsToReduce = elements
    
    // Iterate over operations while an operand still here
    while operationsToReduce.count > 1 {
        let left = Int(operationsToReduce[0])!
        let operand = operationsToReduce[1]
        let right = Int(operationsToReduce[2])!
        
        let result: Int
        switch operand {
        case "+": result = left + right
        case "-": result = left - right
        default: fatalError("Unknown operator !")
        }
        
        operationsToReduce = Array(operationsToReduce.dropFirst(3))
        operationsToReduce.insert("\(result)", at: 0)
    }
    return operationsToReduce
}
