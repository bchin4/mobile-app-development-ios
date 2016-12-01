//
//  StockQuoteViewController.swift
//  Dumb Browser
//
//  Created by Robert Stjacques Jr on 11/29/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class StockQuoteViewController: UIViewController {
    
    @IBOutlet var urlField: UITextField!
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var avdLabel: UILabel!
    @IBOutlet var dividendLabel: UILabel!
    @IBOutlet var lastTradeLabel: UILabel!
    @IBOutlet var yearLowLabel: UILabel!
    @IBOutlet var yearHighLabel: UILabel!
    
    var fetcher: StockQuoteFetcher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcher = StockQuoteFetcher()
    }
    
    @IBAction func getStockQuote(_ sender: Any) {
        let symbol = urlField.text!
        
        fetcher.fetchStockQuote(for: symbol) {
            (stockResult) -> Void in
            switch(stockResult) {
            case let .StockSuccess(stock):
                OperationQueue.main.addOperation() {
                    self.updateStock(with: stock)
                }
            case let .StockFailure(error):
               print("error: \(error)")
            }
        }
    }
    
    private func updateStock(with stock: Stock) {
        updateLabel(symbolLabel, text: stock.symbol)
        updateLabel(priceLabel, text: stock.price)
        updateLabel(avdLabel, text: stock.averageDailyVolume)
        updateLabel(dividendLabel, text: stock.dividendShare)
        updateLabel(lastTradeLabel, text: stock.lastTradeDate)
        updateLabel(yearLowLabel, text: stock.yearLow)
        updateLabel(yearHighLabel, text: stock.yearHigh)
    }
    
    private func updateLabel(_ label: UILabel, text: String?) {
        if let newText = text {
            label.text = newText
        }
        else {
            label.text = "not available"
        }
    }
    
    //
    // trailing closure examples (for reference only)
    //
    
    //function expects a closure as the last parameter
    func foo(first: String, second: String, third: (Int, Double) -> Void) {
        print(first)
        print(second)
        third(1, 2.0)
    }
    
    // call the function with a closure in the argument list
    func callFoo() {
        foo(first: "a",
            second: "b",
            third: { (anInt: Int, aDouble: Double) -> Void in
                print(anInt)
                print(aDouble)
        })
    }
    
    // or use a trailing closure instead
    func callFooToo() {
        foo(first: "a", second: "b") {
            (anInt, aDouble) -> Void in
            print(anInt)
            print(aDouble)
        }
    }
    
    
}
