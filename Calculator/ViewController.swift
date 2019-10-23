//
//  ViewController.swift
//  Calculator
//
//  Created by Emirhan on 17.10.2019.
//  Copyright © 2019 emirhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //12 + 16
    //previousNumber (12)
    //numberOnScreen (16)
    //isPerformingOperation BOOL     true/false
    //operation (+ - * /)
    //tag (Ekrana Ne Basıldı)
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dot: UIButton!
    
    // + - * /
    @IBOutlet weak var bolme: UIButton!
    @IBOutlet weak var carpma: UIButton!
    @IBOutlet weak var cikarma: UIButton!
    @IBOutlet weak var toplama: UIButton!
    @IBOutlet weak var ters: UIButton!
    
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    var dotclick = 0
    var operators = 0
    var calculated = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel.text = "0"
    }
    
    //Number Buttons Codes
    @IBAction func numberPressed(_ sender: Any) {
        
        operators = 0
        carpma.isEnabled = true
        bolme.isEnabled = true
        toplama.isEnabled = true
        cikarma.isEnabled = true
        
        
        
        if dotclick == 0 {
            dot.isEnabled = true
        }
        else{
            dot.isEnabled = false
        }
        
        
        if resultLabel.text == "0"{
            resultLabel.text = ""
        }
        
        
        guard let tag = (sender as? UIButton)?.tag else {
            
            return
        }
        
        
        if tag - 1 != 0{
            calculated = false
        }
        
        if tag - 1 == 0{
            if calculated == true{
                resultLabel.text = ""
            }
        }
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            
            resultLabel.text = String(tag-1)
       
        }
        else if let text = resultLabel.text{
           
            resultLabel.text = text + String(tag - 1)
            
        }
        if let resultText = resultLabel.text, let numOnScreen = Double(resultText) {
            numberOnScreen = numOnScreen
        }
        
    }
    
    
    //Operator Buttons Codes
    @IBAction func operatorPressed(_ sender: Any) {
        
        ters.isEnabled = true
        
        let tag = (sender as! UIButton).tag
        operators += 1
        dotclick = 0
        
        
        if operators <= 1{
            if (tag == 11 || tag == 12 || tag == 13 || tag == 14) {
                calculated = false
                operation = tag
                isPerformingOperation = true
                previousNumber = Double(resultLabel.text!)!
                
                
                
                 
                  if tag == 11 {
                      resultLabel.text = "/"
                  }
                  else if tag == 12 {
                      resultLabel.text = "*"
                      
                  }
                  else  if tag == 13 {
                      resultLabel.text = "-"
                    
                  }
                  else if tag == 14 {
                      resultLabel.text = "+"
                  }
                
            }
            
        }
        else {
            carpma.isEnabled = false
            bolme.isEnabled = false
            toplama.isEnabled = false
            cikarma.isEnabled = false
        }
        
        
        /* Clear Button - 16 */
        if tag == 16{
            resultLabel.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            dotclick = 0
            operators = 0
            ters.isEnabled = true
            
            return
        }
        
        /* operation +(14) -(13) *(12) /(11) =(15)  */
        
        
        if tag == 15 {
            
            calculated = true
            operators = 0
            
            /* ( = / + - * ) */
            /* Operation(tag) */
            
            if operation == 11 {
                
                resultLabel.text = String(previousNumber / numberOnScreen)
                
            }
            else if operation == 12 {
                
                resultLabel.text = String(previousNumber * numberOnScreen)
                
            }
            else if operation == 13 {
                
                resultLabel.text = String(previousNumber - numberOnScreen)
                
            }
            else if operation == 14 {
                
                resultLabel.text = String(previousNumber + numberOnScreen)
                
            }
            dotclick = 0
        }
        
    }
    
    
    @IBAction func dotClick(_ sender: UIButton) {
        dotclick += 1
        
        if dotclick <= 1{
            resultLabel.text = String(resultLabel.text!) + "."
            dot.isEnabled = true
        }
        else{
            dot.isEnabled = false
        }
    }
    
    
    @IBAction func tersClicked(_ sender: UIButton) {
        
        resultLabel.text = "-" + resultLabel.text!
        
        if let resultText = resultLabel.text, let numOnScreen = Double(resultText) {
            numberOnScreen = numOnScreen
        }
        
        ters.isEnabled = false
        operators = 0
        isPerformingOperation = true

    }
    
}

