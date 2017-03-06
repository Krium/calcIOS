//
//  ViewController.swift
//  Calculator
//
//  Created by Iurii Kryvoshyia on 01.03.17.
//  Copyright © 2017 Iurii Kryvoshyia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: Variables
    var firstArgument = 0.0
    var secondArgument = 0.0
    var arithmeticSign = ""
    var result = 0.0
    var checkButton = false
    var checkButtonResult = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    //MARK: Action
    
    @IBAction func clearButton(_ sender: UIButton) {
        textField.text = ""
        arithmeticSign = ""
        result = 0.0
        checkButton = false
        checkButtonResult = false
    }

    @IBAction func backspaceButton(_ sender: UIButton) {
        var newText: String = textField.text!
        newText.remove(at: newText.index(before: newText.endIndex))
        textField.text = newText
        if arithmeticSign != ""
        {
            checkButton = false
            checkButtonResult = true
            arithmeticSign = ""
        }
    }
    
    
    @IBAction func plusButton(_ sender: UIButton) {
        if textField.hasText && arithmeticSign == ""{
            firstArgument = Double (textField.text!)!
            textField.text = textField.text! + "+"
            arithmeticSign = "+"
            checkButton = true
            checkButtonResult = false
        }
        else if textField.hasText && arithmeticSign != "" {
            
            firstArgument = divideStringToArgument().firstArg
            secondArgument = divideStringToArgument().secondArg
            if secondArgument != 0 {
                resultOfOperations()
            }
            else {
            textField.text = String (firstArgument) + "+"
            arithmeticSign = "+"
            checkButton = true
            checkButtonResult = false
            }
        }
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        if textField.hasText && arithmeticSign == ""{
            firstArgument = Double (textField.text!)!
            textField.text = textField.text! + "-"
            arithmeticSign = "-"
            checkButton = true
            checkButtonResult = false
        }
        else if textField.hasText && arithmeticSign != "" {
            
            firstArgument = divideStringToArgument().firstArg
            secondArgument = divideStringToArgument().secondArg
            if secondArgument != 0 {
                resultOfOperations()
            }
            else {
                textField.text = String (firstArgument) + "-"
                arithmeticSign = "-"
                checkButton = true
                checkButtonResult = false
            }
        }

    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        if textField.hasText && arithmeticSign == ""{
            firstArgument = Double (textField.text!)!
            textField.text = textField.text! + "*"
            arithmeticSign = "*"
            checkButton = true
            checkButtonResult = false
        }
        else if textField.hasText && arithmeticSign != "" {
            
            firstArgument = divideStringToArgument().firstArg
            secondArgument = divideStringToArgument().secondArg
            if secondArgument != 0 {
                resultOfOperations()
            }
            else {
                textField.text = String (firstArgument) + "*"
                arithmeticSign = "*"
                checkButton = true
                checkButtonResult = false
            }
        }

    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        if textField.hasText && arithmeticSign == ""{
            firstArgument = Double (textField.text!)!
            textField.text = textField.text! + "/"
            arithmeticSign = "/"
            checkButton = true
            checkButtonResult = false
        }
        else if textField.hasText && arithmeticSign != "" {
            
            firstArgument = divideStringToArgument().firstArg
            secondArgument = divideStringToArgument().secondArg
            if secondArgument != 0 {
                resultOfOperations()
            }
            else {
                textField.text = String (firstArgument) + "/"
                arithmeticSign = "/"
                checkButton = true
                checkButtonResult = false
            }
        }

    }
    
    @IBAction func resultButton(_ sender: UIButton)
    {
        
        resultOfOperations()
        
    }
    
    // Dot button
    @IBAction func dotButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "."
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            checkButtonResult = false
        } else {
            // do nothing. cant begin with  "."
        }

    }
    
   // Buttons of numbers
    
    @IBAction func zeroButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult { // need to make only one 0
            let firstNumber = Double (textField.text!)
            if firstNumber != 0 {
            textField.text = textField.text! + "0"
            }
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "0"
            checkButtonResult = false
        }
        else {
            textField.text = "0"
        }

    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "1"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "1"
            checkButtonResult = false
        } else {
            textField.text = "1"
        }
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "2"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "2"
            checkButtonResult = false
        } else {
        textField.text = "2"
        }
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "3"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "3"
            checkButtonResult = false
        } else {
            textField.text = "3"
        }
        
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "4"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "4"
            checkButtonResult = false
        } else {
            textField.text = "4"
        }
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "5"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "5"
            checkButtonResult = false
        } else {
            textField.text = "5"
        }
    }
   
    @IBAction func sixButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "6"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "6"
            checkButtonResult = false
        } else {
            textField.text = "6"
        }
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "7"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "7"
            checkButtonResult = false
        } else {
            textField.text = "7"
        }
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "8"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "8"
            checkButtonResult = false
        } else {
            textField.text = "8"
        }
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        if textField.hasText && !checkButtonResult {
            textField.text = textField.text! + "9"
        } else if textField.hasText && checkButtonResult {
            textField.text = ""
            textField.text = "9"
            checkButtonResult = false
        } else {
            textField.text = "9"
        }
    }
    
    //MARK: Functions
    
    func divideStringToArgument() -> (firstArg: Double, secondArg: Double) {
       
        var firstArg = 0.0
        var secondArg = 0.0
        
        if textField.hasText && checkButton {
            
            switch arithmeticSign {
            case "+":
                
                var arriesFromTextField = textField.text?.components(separatedBy: "+")
                firstArg = Double (arriesFromTextField![0])!
                
                if arriesFromTextField!.count > 0 && arriesFromTextField![1] != "" {
                    secondArg = Double (arriesFromTextField![1])!
                }
                else {
                    //Do nothing
                }
            case "-":
                
                var arriesFromTextField = textField.text?.components(separatedBy: "-")
                firstArg = Double (arriesFromTextField![0])!
                
                if arriesFromTextField![1] != "" {
                    secondArg = Double (arriesFromTextField![1])!
                }
                    
                else {
                    //Do nothing
                }

            case "/":
                var arriesFromTextField = textField.text?.components(separatedBy: "/")
                firstArg = Double (arriesFromTextField![0])!
                
                if arriesFromTextField![1] != "" {
                    secondArg = Double (arriesFromTextField![1])!
                }
                    
                else {
                    //Do nothing
                }
                
            case "*":
                var arriesFromTextField = textField.text?.components(separatedBy: "*")
                firstArg = Double (arriesFromTextField![0])!
                
                if arriesFromTextField![1] != "" {
                    secondArg = Double (arriesFromTextField![1])!
                }
                    
                else {
                    //Do nothing
                }

            default:
                textField.text = ""
            }
        }

        
        return (firstArg, secondArg)
    }
    
    func resultOfOperations () {
        
        if textField.hasText && checkButton {
            
            switch arithmeticSign {
            case "+":
                
                secondArgument = divideStringToArgument().secondArg
                result = firstArgument + secondArgument
                textField.text = String (result)
                checkButton = false
                arithmeticSign = ""
                checkButtonResult = true
                
            case "-":
                secondArgument = divideStringToArgument().secondArg
                result = firstArgument - secondArgument
                textField.text = String (result)
                checkButton = false
                arithmeticSign = ""
                checkButtonResult = true
            case "/":
                secondArgument = divideStringToArgument().secondArg
                if secondArgument != 0 {
                    result = firstArgument / secondArgument
                    textField.text = String (result)
                    checkButton = false
                    arithmeticSign = ""
                    checkButtonResult = true
                }
                else {
                    textField.text = "Can't divided on zero!"
                    checkButton = false
                    arithmeticSign = ""
                    checkButtonResult = true
                }
                
            case "*":
                secondArgument = divideStringToArgument().secondArg
                result = firstArgument * secondArgument
                textField.text = String (result)
                checkButton = false
                arithmeticSign = ""
                checkButtonResult = true
            default:
                textField.text = ""
            }
        }
        else {
            
        }
       
   }
}
