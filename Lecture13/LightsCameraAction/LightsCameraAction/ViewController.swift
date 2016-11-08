//
//  ViewController.swift
//  LightsCameraAction
//
//  Created by Robert Stjacques Jr on 11/7/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - outlets
    
    @IBOutlet var imageView: UIImageView!

    // MARK: - lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - actions
    
    @IBAction func takePhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            print("camera selected")
        }
        else {
            picker.sourceType = .photoLibrary
            print("photo library selected")
        }
    
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: - image picker delegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = photo
        
        dismiss(animated: true, completion: nil)
    }
}

