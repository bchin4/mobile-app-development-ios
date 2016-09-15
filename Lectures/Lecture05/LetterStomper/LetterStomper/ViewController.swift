//
//  ViewController.swift
//  LetterStomper
//
//  Created by Robert Stjacques Jr on 9/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let DEFAULT_STRING = "Hi, there!"
    
    @IBOutlet var outputLabel: UILabel!
    @IBOutlet var stompedTextField: UITextField!
    @IBOutlet var toStompTextField: UITextField!
    
    var replacementChar: String?
    
    @IBAction func messageReceived(textField: UITextField) {
        updateMessage()
    }
    
    @IBAction func replacementCharacterChanged(textField: UITextField) {
        replacementChar = textField.text
        updateMessage()
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        stompedTextField.resignFirstResponder()
        toStompTextField.resignFirstResponder()
    }
    
    func updateMessage() {
//        if let replacement = replacementChar,
//            let old = stompedTextField.text {
//            let new = old.stringByReplacingOccurrencesOfString(replacement, withString: "*")
//            if new.characters.count > 0 {
//                outputLabel.text = new
//            }
//            else {
//                outputLabel.text = DEFAULT_STRING
//            }
//        }
        
        if let old = stompedTextField.text {
            let new: String
            if let replacement = replacementChar {
              new = old.stringByReplacingOccurrencesOfString(replacement, withString: "*")
            }
            else {
                new = old
            }
            if new.characters.count > 0 {
                outputLabel.text = new
            }
            else {
                outputLabel.text = DEFAULT_STRING
            }
        }
    }
    
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                   replacementString string: String) -> Bool {
        
        //print("current:\(range)")
        //print("replace:\(string)")
        
        if let current = textField.text where !current.isEmpty {
            return string.characters.count == 0
        }
        else
        if string.characters.count <= 1 {
            return true
        }
        else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = DEFAULT_STRING
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

