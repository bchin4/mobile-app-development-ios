//
//  RawHTMLBrowserViewController.swift
//  Dumb Browser
//
//  Created by Robert Stjacques Jr on 11/28/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class RawHTMLBrowserViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var urlField: UITextField!
    
    var rawHTMLFetcher: RawHTMLFetcher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rawHTMLFetcher = RawHTMLFetcher()
    }
    
    @IBAction func fetchRawHtml(_ sender: Any) {
        let url = urlField.text!
        
        rawHTMLFetcher.fetchRawHTML(url: url) {
            (fetchResult) -> Void in
            switch(fetchResult) {
            case let .FetchSuccess(html):
                // need to insure that interface updates happen
                // in the main thread
                OperationQueue.main.addOperation() {
                    self.textView.text = html
                }
            case let .FetchFailure(error):
                // need to insure that interface updates happen
                // in the main thread
                OperationQueue.main.addOperation() {
                    self.textView.text = "error: \(error)"
                }
            }
        }
    }
}
