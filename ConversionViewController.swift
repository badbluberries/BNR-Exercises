//
//  ConversionViewController.swift
//  World Trotter
//
//  Created by Colin McKinstry on 07/04/2016.
//  Copyright © 2016 Allen McKinstry. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
 
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celciusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    func updateCelciusLabel() {
        if let value = celciusValue {
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celciusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count == 0 { return true }
        
        if let _ = string.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "1234567890. ")) {
            if let existingTextHasDecimalSeperator = textField.text?.containsString("."){
                let replacementTextHasDecimalSperator = string.containsString(".")
                if existingTextHasDecimalSeperator && replacementTextHasDecimalSperator {
                    return false
                } else {
                    return true
                }
            }
            return true
        }
        
        return false
    }
    
   //comment from imac
   //also new comment from my MacBook
    
}


