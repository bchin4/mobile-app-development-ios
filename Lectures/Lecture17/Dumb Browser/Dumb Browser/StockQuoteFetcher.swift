//
//  StockQuoteFetcher.swift
//  Dumb Browser
//
//  Created by Robert Stjacques Jr on 11/29/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

enum StockError: Error {
    case InvalidStockJSONError
    case NotYetImplementedError
}

enum StockQuoteResult {
    case StockSuccess(Stock)
    case StockFailure(Error)
}

class StockQuoteFetcher {
    // constants used to build the URL
    private static let baseUrl = "https://query.yahooapis.com/v1/public/yql"
    private static let query_1 = "select * from yahoo.finance.quotes where symbol in (\""
    private static let query_2 = "\")"
    private static let env = "store://datatables.org/alltableswithkeys"
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    func fetchStockQuote(for symbol: String, completion: @escaping (StockQuoteResult) -> Void) {
        
        let stockURL = StockQuoteFetcher.getUrl(for: symbol)
        
        let request = URLRequest(url: stockURL)
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            guard let stockData = data else {
                    completion(.StockFailure(error!))
                    return
            }
            
            completion(StockQuoteFetcher.getStock(from: stockData))
        }
        task.resume()
    }
    
    
    private static func getUrl(for symbol: String) -> URL {
        var components = URLComponents(string: baseUrl)!
        
        // set up the query parameters; the stuff that goes after the "?" in the URL
        var queryItems = [URLQueryItem]()
        // symbol query
        let query = query_1 + symbol + query_2
        queryItems.append(URLQueryItem(name: "q", value: query))
        // env
        queryItems.append(URLQueryItem(name: "env", value: env))
        // JSON format
        queryItems.append(URLQueryItem(name: "format", value: "json"))
        
        components.queryItems = queryItems
        
        // create and log the URL before returning
        return components.url!
    }
    
    private static func getStock(from json: Data) -> StockQuoteResult {
        do {
            let jsonObject: Any = try JSONSerialization.jsonObject(with: json, options: [])
            
            guard let jsonDict = jsonObject as? [String:AnyObject],
            let query = jsonDict["query"] as? [String:AnyObject],
            let results = query["results"] as? [String:AnyObject],
            let quote = results["quote"] as? [String:AnyObject] else {
                return .StockFailure(StockError.InvalidStockJSONError)
            }
            
            for (key, value) in quote {
                print("\(key):\(value)")
            }
            
            let stock = Stock(symbol: quote["Symbol"] as? String,
                              price: quote["LastTradePriceOnly"] as? String,
                              averageDailyVolume: quote["AverageDailyVolume"] as? String,
                              dividendShare: quote["DividendShare"] as? String,
                              lastTradeDate: quote["LastTradeDate"] as? String,
                              yearLow: quote["YearLow"] as? String,
                              yearHigh: quote["YearHigh"] as? String)
            
            return .StockSuccess(stock)
        }
        catch let error {
            return .StockFailure(error)
        }
    }
}
