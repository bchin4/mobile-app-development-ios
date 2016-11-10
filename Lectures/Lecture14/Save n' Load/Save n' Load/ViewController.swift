//
//  ViewController.swift
//  Save n' Load
//
//  Created by Robert Stjacques Jr on 11/9/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    var thingee: Thingee!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var stringField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var booleanField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = ImageHelper.getImage(forUID: thingee.aUniqueID) {
            // set image view
            imageView.image = img
        }
        
        stringField.text = thingee.aString
        numberField.text = Int(thingee.aNumber).description
        booleanField.text = Bool(thingee.aBoolean).description
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("bye bye")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func choosePhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        
        picker.delegate = self
    
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func stringChanged(_ sender: Any) {
        if let aString = stringField.text {
            thingee.aString = aString
        }
    }
    
    @IBAction func numberChanged(_ sender: Any) {
        if let aString = numberField.text,
            let aNumber = Int(aString) {
            thingee.aNumber = aNumber
        }
    }
    
    @IBAction func booleanChanged(_ sender: Any) {
        if let aString = booleanField.text {
            thingee.aBoolean = NSString(string: aString).boolValue
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        ImageHelper.saveImage(image, forUID: thingee.aUniqueID)
            
        imageView.image = image
            
        dismiss(animated: true, completion: nil)
    }
}

