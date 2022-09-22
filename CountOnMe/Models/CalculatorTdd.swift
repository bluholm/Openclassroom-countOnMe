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
    
    func extractByArray (_ inputs:[String], _ index: Int) -> [String] {
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

}

