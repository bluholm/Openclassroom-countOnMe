//
//  calculs.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-18.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
// 8/2*4-3

import UIKit



func calculate(elements: [String]) -> [String] {
    
    var copyOfElements = elements
    copyOfElements = reduceMultiplierDiviser(elements, "*")
    copyOfElements = reduceMultiplierDiviser(copyOfElements, "/")
    copyOfElements = reduceplusMinus(operations: copyOfElements)
    return copyOfElements
    
}


//execution of division & multiplier first ! (math :)
func reduceMultiplierDiviser(_ operations: [String],_ operatorSign: String) -> [String]{
    
    var operationsTemp = operations
    while operationsTemp.contains(operatorSign){
        var  temporaryResult: Double
        guard let indexOfMultiplier = operationsTemp.firstIndex(of: operatorSign) else { return operationsTemp }
        guard let left = Double(operationsTemp[indexOfMultiplier-1]) else { return operationsTemp }
        guard let right = Double(operationsTemp[indexOfMultiplier+1]) else { return operationsTemp }
        
        if operatorSign == "*" {
            temporaryResult = left * right
        } else {
            temporaryResult = left / right
            temporaryResult = round(temporaryResult * 100) / 100
        }
        
        // ⚠️ delete le avant et après
        operationsTemp.remove(at: indexOfMultiplier)
        operationsTemp.insert("\(temporaryResult)", at: indexOfMultiplier)
        operationsTemp.remove(at: indexOfMultiplier+1)
        operationsTemp.remove(at: indexOfMultiplier-1)
    }
    return operationsTemp
    }

func reduceplusMinus(operations: [String]) -> [String]{
    
    var operationsTemp = operations
    // Iterate over operations while an operand still here
    while operationsTemp.count > 1 {
        let left = Double(operationsTemp[0])!
        let operand = operationsTemp[1]
        let right = Double(operationsTemp[2])!
        
        let result: Double
        switch operand {
        case "+": result = left + right
        case "-": result = left - right
        default: result = 0
        }
        
        operationsTemp = Array(operationsTemp.dropFirst(3))
        operationsTemp.insert("\(result)", at: 0)
        
    }
    return operationsTemp
}
