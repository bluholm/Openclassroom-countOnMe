//
//  CalculatorTests.swift
//  CountOnMeTests
//
//  Created by Marc-Antoine BAR on 2022-09-20.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

//Liste de mes comportement (test cases) pour réaliser le modèle en TDD :
// TestCase 01: ✅ Class de calcul
// TestCase 02: ✅ faire une addition
// TestCase 03: ✅ remplace 3 par 1 pour addition
// TestCase 04: ✅ faire une soustraction
// TestCase 05: ✅ faire une division
// TestCase 06: ✅ faire une multiplication
// TestCase 07: ✅ trouve un operateurs prioritaires
// TestCase 08: operateurs prioritaire existe
// TestCase 09: clique sur = : renvoi un resultat
// TestCase 10: arrondir une valeur
// TestCase 11: division par zero
// TestCase 12: change a string into Int
// TestCase 13: change a Int into string


@testable import CountOnMe

import XCTest


final class CountOnMeTests: XCTestCase {
    
    var calculator: CalculatorTdd!
    
    override func setUp() {
        super.setUp()
        calculator = CalculatorTdd()
    }
    
    func testGivenInstanceWhenAccessItThenItExist() {
        XCTAssertNotNil(calculator)
    }
    
    func testGiven2And2WhenAddTheResultIs4() {
        
        let numberOne = 2.0
        let numberTwo = 2.0
        
        let result = calculator.add(numberOne, numberTwo)
        
        XCTAssertEqual(numberOne+numberTwo, result)
    }
    
    func testGiven2And2WhenSubstractTheResultIs0() {
        
        let numberOne = 2.0
        let numberTwo = 2.0
        
        let result = calculator.substract(numberOne, numberTwo)
        
        XCTAssertEqual(numberOne-numberTwo, result)
    }
    
    func testGiven2And3WhenMultiplyTheResultIs6() {
        
        let numberOne = 2.0
        let numberTwo = 3.0
        
        let result = calculator.multiply(numberOne, numberTwo)
        
        XCTAssertEqual(numberOne*numberTwo, result)
    }
    
    func testGiven8And2WhenDivideTheResultIs4() {
        
        let numberOne = 8.0
        let numberTwo = 2.0
        
        let result = calculator.divide(numberOne, numberTwo)
        
        XCTAssertEqual(numberOne/numberTwo, result)
    }
    
    func testGivenArray2Plus2WhenAdditionResultIsArray4() {
        let toBeAdded = ["2.0","+","2.0"]
        
        let result = calculator.additionByArray(toBeAdded)
        
        XCTAssertEqual(result, ["4.0"])
    }
    
    func testGivenArray2Minus2WhenSubstractResultIsArray0() {
        let toBeAdded = ["2.0","-","2.0"]
        
        let result = calculator.substractByArray(toBeAdded)
        
        XCTAssertEqual(result, ["0.0"])
    }
    
    func testGivenArray2Multiply3WhenMultiplyResultIsArray6() {
        let toBeAdded = ["2.0","*","3.0"]
        
        let result = calculator.multiplyByArray(toBeAdded)
        
        XCTAssertEqual(result, ["6.0"])
    }

    func testGivenArray8Divide2WhenDivideResultIsArray4() {
        let toBeAdded = ["8.0","/","2.0"]
        
        let result = calculator.divideByArray(toBeAdded)
        
        XCTAssertEqual(result, ["4.0"])
    }
    
    // TestCase 07: trouver 1 operateur
    func testGivenArrayOfStringWhenGetIndexFirstOperatorThenINdexis5 () {
        let given = ["1","+","1","*","2" ]
        let inputOperator = "*"
        let then = calculator.findOperatorToExecute(given,inputOperator)
        XCTAssertEqual(then, 3)
    }
    
    //extract calcul size 3 and result should equal
    func testGivenArrayOfStringWhenexctractWithIndexThenArraySize3 () {
        let given = ["1","+","1","*","2","+","6","/","1"]
        let index = 3
        
        let result = calculator.ExtractByArray(given,index)
        
        XCTAssertEqual(result, ["1","*","2"])
        XCTAssertTrue(result.count == 3)
    }
    
    
    
}
