//
//  calculs.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-18.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
// 8/2*4-3

import UIKit

class Calcul {
    
    ///function  calculate the result
    func getResultTotalOperation(_ elements: [String]) -> [String] {
        
        var copyOfElements = elements
        copyOfElements = getResultOfPriorityOperations(elements, "*")
        copyOfElements = getResultOfPriorityOperations(copyOfElements, "/")
        copyOfElements = getResultsOfMinorOperations(operations: copyOfElements)
        return copyOfElements
    }
    
    //execution of division & multiplier first
    private  func getResultOfPriorityOperations(_ operations: [String],_ operatorSign: String) -> [String]{
        
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
            operationsTemp = returnResultOfOperation(operations: operationsTemp,result: temporaryResult,index: indexOfMultiplier)
        }
        return operationsTemp
    }
    
    //reduce minus to let elements with only the good information ( plus and minus )
    private func getResultsOfMinorOperations(operations: [String]) -> [String]{
        
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
    
    /// delete 3 cols A-B-C and replace by the result of operations a A op C
    private func returnResultOfOperation(operations: [String],result: Double,index: Int)->[String]{
        
        var operationsResult = operations
        operationsResult.remove(at: index)
        operationsResult.insert("\(result)", at: index)
        operationsResult.remove(at: index+1)
        operationsResult.remove(at: index-1)
        return operationsResult
    }
    
    
}
