//
//  CalculatorTdd.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-22.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation


class CalculatorTdd {
  
    func substract(_ firstNumber: Double,_ secondNumber: Double) -> Double{
        let result = firstNumber - secondNumber
        return result
    }

    func add(_ firstNumber: Double,_ secondNumber: Double) -> Double{
        let result = firstNumber + secondNumber
        return result
    }
    
    func multiply(_ firstNumber: Double,_ secondNumber: Double) -> Double{
        let result = firstNumber * secondNumber
        return result
    }
    
    func divide(_ firstNumber: Double,_ secondNumber: Double) -> Double{
        let result = firstNumber / secondNumber
        return result
    }
    

    func additionByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = add(firstNumber, secondNumber)
        result = ["\(calcul)"]
        return result
    }
    
    func substractByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = substract(firstNumber, secondNumber)
        result = ["\(calcul)"]
        return result
    }
    
    func multiplyByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = multiply(firstNumber, secondNumber)
        result = ["\(calcul)"]
        return result
    }
    
    func divideByArray(_ toBeAdded: [String]) -> [String] {
        let result: [String]
        let firstNumber = Double(toBeAdded[0])!
        let secondNumber = Double(toBeAdded[2])!
        let calcul = divide(firstNumber, secondNumber)
        result = ["\(calcul)"]
        return result
    }
    
    func findOperatorToExecute(_ inputs: [String], _ inputOperator: String) -> Int? {
        return inputs.firstIndex(of: inputOperator)
    }
    
    func ExtractByArray (_ inputs:[String], _ index: Int) -> [String] {
        var result:[String] = []
        result.append(inputs[index-1])
        result.append(inputs[index])
        result.append(inputs[index+1])
        
        return result
    }

}

