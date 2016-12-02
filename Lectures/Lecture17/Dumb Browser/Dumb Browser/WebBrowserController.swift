//
//  WebBrowserController.swift
//  Dumb Browser
//
//  Created by Robert Stjacques Jr on 12/1/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class WebBrowserController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var urlField: UITextField!
    
    @IBAction func go(_ sender: Any) {
        let urlString = urlField.text!
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        else {
            print("Inavlid url: \(urlString)")
        }
    }
}
