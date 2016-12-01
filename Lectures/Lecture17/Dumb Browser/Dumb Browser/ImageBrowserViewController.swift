//
//  ImageBrowserViewController.swift
//  Dumb Browser
//
//  Created by Robert Stjacques Jr on 11/28/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ImageBrowserViewController: UIViewController {
    

    @IBOutlet var urlField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    var imageFetcher: ImageFetcher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.masksToBounds = true
        
        imageFetcher = ImageFetcher()
    }
    
    @IBAction func fetchImage(_ sender: Any) {
        let url = urlField.text!
        
        imageFetcher.fetchImage(url: url) {
            (fetchResult) -> Void in
            
            switch(fetchResult) {
            case let .ImageSuccess(image):
                OperationQueue.main.addOperation() {
                    self.imageView.image = image
                }
            case let .ImageFailure(error):
                OperationQueue.main.addOperation {
                    self.imageView.image = #imageLiteral(resourceName: "oops")
                }
                print("error: \(error)")
            }
            
        }
    }
}
