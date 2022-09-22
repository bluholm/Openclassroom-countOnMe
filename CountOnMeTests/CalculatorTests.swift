//
//  CalculatorTests.swift
//  CountOnMeTests
//
//  Created by Marc-Antoine BAR on 2022-09-20.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

//Liste de mes comportement (test cases) pour réaliser le modèle en TDD :


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
    func testGivenArrayOfStringWhenGetIndexFirstOperatorThenINdexis5() {
        let given = ["1.0","+","1.0","*","2.0" ]
        let inputOperator = "*"
        let then = calculator.findOperatorToExecute(given,inputOperator)
        XCTAssertEqual(then, 3)
    }
    
    //extract calcul size 3 and result should equal
    func testGivenArrayOfStringWhenexctractWithIndexThenArraySize3() {
        let given = ["1.0","+","1.0","*","2.0","+","6.0","/","1.0"]
        let index = 3
        
        let result = calculator.extractByArray(given,at: index)
        
        XCTAssertEqual(result, ["1.0","*","2.0"])
        XCTAssertTrue(result.count == 3)
    }
    
    //reduce calcul size 3 to 1 and do the calcul
    func testGivenArrayOfcalculWhenReduceMultiplierThenResultIs3() {
        let given = ["3.0","*","2.0"]
        
        let result = calculator.reduce(given)
        
        XCTAssertEqual(result, ["6.0"])
        XCTAssertTrue(result.count == 1)
    }
    
    func testGivenArrayOfcalculWhenReduceSommeThenResultIs5() {
        let given = ["3.0","+","2.0"]
        
        let result = calculator.reduce(given)
        
        XCTAssertEqual(result, ["5.0"])
        XCTAssertTrue(result.count == 1)
    }
    
    func testGivenArrayOfcalculWhenReduceDiviserThenResultIs2() {
        let given = ["4.0","/","2.0"]
        
        let result = calculator.reduce(given)
        
        XCTAssertEqual(result, ["2.0"])
        XCTAssertTrue(result.count == 1)
    }
    
    func testGivenArrayOfcalculWhenReduceSubstractThenResultIs1() {
        let given = ["3.0","-","2.0"]
        
        let result = calculator.reduce(given)
        
        XCTAssertEqual(result, ["1.0"])
        XCTAssertTrue(result.count == 1)
    }
    
    func testGivenArrayOFStringWhenInsertBackThenResultIsArrayOfString() {
        let given = ["1.0","+","1.0","*","2.0","+","6.0","/","1.0"]
        let index = 3
        
        let result = calculator.calculateOneOperation(given,at: index)
        
        XCTAssertEqual(result, ["1.0","+","2.0","+","6.0","/","1.0"])
    }
    
    func testGivenArrayOfStringWhenRemoveThenArrayOfStringIsShorter() {
        let given = ["1.0","+","1.0","*","2.0","+","6.0","/","1.0"]
        let index = 3
        
        let result = calculator.remove(given,at: index)
        
        XCTAssertEqual(result, ["1.0","+","+","6.0","/","1.0"])
    }

    func testGivenOperatorWwhenCalculateOneOperatorThenArrayOfstringReducedWithoutOperator(){
        let given = ["1.0","+","1.0","*","2.0","+","6.0","/","1.0","1.0","+","1.0","*","2.0","-","6.0","/","1.0"]
        let myOperator = "*"
        
        let result = calculator.calculatorWithOnePriorityOperator(given,with: myOperator)
        
        XCTAssertEqual(result, ["1.0","+","2.0","+","6.0","/","1.0","1.0","+","2.0","-","6.0","/","1.0"])
    }
    
    func testGivenArrayOfStringWhenCalcultateMinorOperatorThenArrayOfStringsolve(){
        let given = ["1.0","+","1.0","-","6.0","+","8.0"]
        
        let result = calculator.calculatorWithOneMinorOperator(given)
        
        XCTAssertEqual(result, ["4.0"])
    }

    func testGivenAstringWhenCalculateThenReturnResult(){
        let given = ["1.0","+","1.0","*","2.0","+","8.0","/","2.0","-","1.0","+","1.0","*","2.0","-","6.0","/","1.0"]
        
        let result = calculator.calculateAll(given)
        
        XCTAssertEqual(result, ["2.0"])
    }
    
    
    
    
}
