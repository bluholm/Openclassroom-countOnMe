//
//  ExpressionController.swift
//  CountOnMe
//
//  Created by Marc-Antoine BAR on 2022-09-18.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import UIKit

extension ViewController {
    
    var elements: [String] {
        textView.text.split(separator: " ").map { "\($0)" }
    }
    
    
    var expressionIsCorrect: Bool {
        elements.last != "+" && elements.last != "-"
        && elements.last != "*" && elements.last != "/"
        && !expressionContainEqual
    }
    
    var isFirstoperator: Bool {
        elements.count>=1
    }
    
    var expressionContainEqual: Bool {
        elements.contains("=")
    }
    
    var expressionHaveEnoughElement: Bool {
        elements.count >= 3
    }
    
    var canAddOperator: Bool {
        elements.last != "+" && elements.last != "-" && elements.last != "*"
        && elements.last != "/" && !expressionContainEqual
    }
    
    var expressionHaveResult: Bool {
        textView.text.firstIndex(of: "=") != nil
    }
    
    var divisionByzero: Bool {
        elements.last != "/"
    }
}
