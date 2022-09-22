//
//  CalculatorTdd.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-22.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorTdd {

    func additionByArray(_ newElement: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(newElement[0])!
        let secondNumber = Double(newElement[2])!
        let calcul = firstNumber+secondNumber
        result = ["\(calcul)"]
        return result
    }

    func substractByArray(_ newElement: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(newElement[0])!
        let secondNumber = Double(newElement[2])!
        let calcul = firstNumber-secondNumber
        result = ["\(calcul)"]
        return result
    }

    func multiplyByArray(_ newElement: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(newElement[0])!
        let secondNumber = Double(newElement[2])!
        let calcul = firstNumber*secondNumber
        result = ["\(calcul)"]
        return result
    }

    func divideByArray(_ newElement: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(newElement[0])!
        let secondNumber = Double(newElement[2])!
        let calcul = firstNumber/secondNumber
        result = ["\(calcul)"]
        return result
    }

    func findPositionOfOperation(_ newElement: [String], with operation: String) -> Int? {
        return newElement.firstIndex(of: operation)
    }

    func extractByArray(_ newElement: [String], at index: Int) -> [String] {
        var result: [String] = []
        result.append(newElement[index-1])
        result.append(newElement[index])
        result.append(newElement[index+1])
        return result
    }

    func reduce(_ newElement: [String]) -> [String] {
        var result: [String] = []
        let operation = newElement[1]
        switch operation {
        case "+":
            result = additionByArray(newElement)
        case "-":
            result = substractByArray(newElement)
        case "*":
            result = multiplyByArray(newElement)
        case "/":
            result = divideByArray(newElement)
        default:
            break
        }
        return result
    }

    func remove(_ newElement: [String], at index: Int) -> [String] {
        var copyOfInput = newElement
        copyOfInput.remove(at: index+1)
        copyOfInput.remove(at: index)
        copyOfInput.remove(at: index-1)
        return copyOfInput
    }
    
    func calculateOneOperation(_ newElement: [String], at index: Int) -> [String] {
        var copyOfInput = newElement
        var result = extractByArray(copyOfInput, at: index)
        result = reduce(result)
        copyOfInput = remove(copyOfInput, at: index)
        copyOfInput.insert(contentsOf: result, at: index-1)
        return copyOfInput
    }
    
    func calculatorWithOnePriorityOperator(_ newElement: [String], with operation: String) -> [String] {
        var copyOfInput = newElement
        while findPositionOfOperation(copyOfInput, with: operation) != 0 {
            guard let  wheretoCalculate = findPositionOfOperation(copyOfInput, with: operation)
                else { return copyOfInput }
            copyOfInput = calculateOneOperation(copyOfInput, at: wheretoCalculate)
        }
        return copyOfInput
    }

    func calculatorWithOneMinorOperator(_ newElement: [String]) -> [String] {
        var copyOfInput = newElement
        while copyOfInput.count != 1 {
            copyOfInput = calculateOneOperation(copyOfInput, at: 1)
        }
        return copyOfInput
    }

    func calculateAll(_ newElement: [String]) -> [String] {
        var copyInputs = newElement
        copyInputs = calculatorWithOnePriorityOperator(copyInputs, with: "*")
        copyInputs = calculatorWithOnePriorityOperator(copyInputs, with: "/")
        copyInputs = calculatorWithOneMinorOperator(copyInputs)
        return copyInputs
    }
}
