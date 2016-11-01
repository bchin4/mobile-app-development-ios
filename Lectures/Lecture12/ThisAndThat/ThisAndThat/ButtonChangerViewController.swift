//
//  ButtonChangerViewController.swift
//  ThisAndThat
//
//  Created by Robert Stjacques Jr on 11/1/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ButtonChangerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var buttonNameField: UITextField!
    
    var theButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buttonNameField.text = theButton.title(for: .normal)        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        theButton.setTitle(buttonNameField.text, for: .normal)
    }
    
    // handles pressing the return key by dismissing the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func screenTapped(_ sender: Any) {
        view.endEditing(true)
    }
}
