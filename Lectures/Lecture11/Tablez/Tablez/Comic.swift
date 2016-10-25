//
//  Comics.swift
//  Tablez
//
//  Created by Robert Stjacques Jr on 10/19/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Comic: Book {
    var artist: String
    
    init(_ title: String, _ author: String, _ artist: String) {
        self.artist = artist
        super.init(title, author)
    }
}
