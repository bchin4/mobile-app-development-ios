//
//  RawHTMLFetcher.swift
//  Dumb Browser
//
//  Created by Robert Stjacques Jr on 11/28/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

enum RawHTMLFetchError: Error {
    case BadURL
    case NotImplementedYet
}

enum RawHTMLFetchResult {
    case FetchSuccess(String)
    case FetchFailure(Error)
}

class RawHTMLFetcher {
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    func fetchRawHTML(url: String,
                      completion: @escaping (RawHTMLFetchResult) -> Void) {
        
        if let htmlURL = URL(string: url) {
            let request = URLRequest(url: htmlURL)
            
            let task = session.dataTask(with: request) {
                (data, response, error) -> Void in
                
                guard let htmlData = data,
                    let html = String(data: htmlData, encoding: .ascii) else {
                    completion(.FetchFailure(error!))
                    return
                }
                
                completion(.FetchSuccess(html))
            }
            task.resume()
        }
        else {
            completion(.FetchFailure(RawHTMLFetchError.BadURL))
        }
    }
}
