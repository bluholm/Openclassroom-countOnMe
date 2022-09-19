//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//
// ✅ Le design n’a pas été finalisé dans le projet Xcode : rien n’est responsive !
// ✅ L’architecture du projet ne respecte pas encore les bonnes pratiques de développement (pas de MVC)
// 𐄂 L’ensemble de l’application n’est pas testé
// ✅ Seul la soustraction et l’addition ont été faits, il manque la division et la multiplication.
// ✅ Permettre l’affichage de l’application dans toute les tailles d’iPhone en mode portrait.
// ✅ Être exempt de tout erreur ou warning.
// ✅ Être fonctionnelle sur iOS 11 et supérieur et écrit en Swift 4 minimum.
// ✅ Test si zero lorsque l'on divise  a faire :)

 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = ""
    }
    
    // MARK: - action tapped
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
        
        textView.text.append(" = \(calculate(elements: elements).first!)")
    }
    
    @IBAction func tappedResetButton(_ sender: UIButton) {
        textView.text = ""
    }
    
    func alertOperatorAlreadyExist() {
        let alertVC = UIAlertController(title: "Error!", message: "operator error", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

