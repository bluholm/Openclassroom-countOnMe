//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//


 

import UIKit

class ViewController: UIViewController {
    
    private var calculator = CalculatorTdd()
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = ""
    }
    
    // MARK: - Users action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        if numberText == "0" && !divisionByzero{
            let alertVC = UIAlertController(title: "Error!", message: "Division  by 0 impossible", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } else {
            textView.text.append(numberText)
        }
        
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator && isFirstoperator {
            textView.text.append(" + ")
        } else {
            alertOperatorAlreadyExist()
        }
        
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        print("\(elements.count)")
        if canAddOperator && isFirstoperator {
            textView.text.append(" - ")
        } else {
            alertOperatorAlreadyExist()
        }
       
    }
    
    
    @IBAction func tappedMultiplyButton(_ sender: UIButton) {
        if canAddOperator && isFirstoperator {
            textView.text.append(" * ")
        } else {
            alertOperatorAlreadyExist()
        }
    }
    
    @IBAction func tappedDivideButton(_ sender: UIButton) {
        if canAddOperator && isFirstoperator {
            textView.text.append(" / ")
        } else {
            alertOperatorAlreadyExist()
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Error!", message: "please write a good operation", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Error !", message: "not enough elements", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard let result = calculator.calculateAll(elements).first else { return }
        textView.text.append(" = \(result)")
    }
    
    @IBAction func tappedResetButton(_ sender: UIButton) {
        textView.text = ""
    }
    
    // MARK: - Custom Methods
    
    private func alertOperatorAlreadyExist() {
        let alertVC = UIAlertController(title: "Error!", message: "operator error", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

