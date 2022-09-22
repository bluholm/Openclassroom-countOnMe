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
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
        && elements.last != "*" && elements.last != "/"
        && !expressionContainEqual
    }
    
    var isFirstoperator: Bool {
        return elements.count>=1
    }
    
    var expressionContainEqual: Bool {
        return elements.contains("=")
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*"
        && elements.last != "/" && !expressionContainEqual
    }
    
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    
    var divisionByzero: Bool {
        return elements.last != "/"
    }
}
