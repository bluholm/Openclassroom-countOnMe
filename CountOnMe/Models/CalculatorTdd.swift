//
//  CalculatorTdd.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-22.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation


class CalculatorTdd {
  
    func additionByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = firstNumber+secondNumber
        result = ["\(calcul)"]
        return result
    }
    
    func substractByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = firstNumber-secondNumber
        result = ["\(calcul)"]
        return result
    }
    
    func multiplyByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = firstNumber*secondNumber
        result = ["\(calcul)"]
        return result
    }
    
    func divideByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = firstNumber/secondNumber
        result = ["\(calcul)"]
        return result
    }
    
    func findOperatorToExecute(_ inputs: [String], _ inputOperator: String) -> Int? {
        return inputs.firstIndex(of: inputOperator)
    }
    
    func extractByArray (_ inputs:[String], at index: Int) -> [String] {
        var result:[String] = []
        
        result.append(inputs[index-1])
        result.append(inputs[index])
        result.append(inputs[index+1])
        
        return result
    }
    
    func reduce(_ inputs:[String]) -> [String] {
        var result:[String] = []
        
        switch inputs[1] {
        case "+":
            result = additionByArray(inputs)
        case "-":
            result = substractByArray(inputs)
        case "*":
            result = multiplyByArray(inputs)
        case "/":
            result = divideByArray(inputs)
        default:
            break
        }
        
        return result
    }
    
    func remove(_ inputs:[String],at index: Int) -> [String] {
        var copyOfInput = inputs
        
        copyOfInput.remove(at: index+1)
        copyOfInput.remove(at: index)
        copyOfInput.remove(at: index-1)
        
        return copyOfInput
        
    }
    
    func calculateOneOperation(_ inputs:[String],at index: Int) -> [String] {
        var copyOfInput = inputs
        var result = extractByArray(copyOfInput,at: index)
        
        result = reduce(result)
        copyOfInput = remove(copyOfInput,at: index)
        copyOfInput.insert(contentsOf: result, at: index-1)
        
        return copyOfInput
    }
    
    func calculatorWithOnePriorityOperator(_ inputs:[String],with myOperator: String) -> [String] {
        var copy = inputs
        while findOperatorToExecute(copy, myOperator) != 0 {
            guard let  wheretoInsert = findOperatorToExecute(copy, myOperator) else { return copy }
            copy = calculateOneOperation(copy, at: wheretoInsert)
        }
        return copy
    }
    
    func calculatorWithOneMinorOperator(_ inputs:[String]) -> [String] {
        var copy = inputs
        while copy.count != 1 {
            
            copy = calculateOneOperation(copy, at: 1)
        }
        return copy
    }
    
    func calculateAll(_ inputs:[String]) -> [String] {
        var copyInputs = inputs
        
        copyInputs = calculatorWithOnePriorityOperator(copyInputs, with: "*")
        copyInputs = calculatorWithOnePriorityOperator(copyInputs, with: "/")
        copyInputs = calculatorWithOneMinorOperator(copyInputs)
        
        return copyInputs
    }
}

