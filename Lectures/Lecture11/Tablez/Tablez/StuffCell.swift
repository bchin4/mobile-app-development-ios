//
//  StuffCell.swift
//  Tablez
//
//  Created by Robert Stjacques Jr on 10/24/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class StuffCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var detail1: UILabel!
    @IBOutlet var detail2: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        title.font = bodyFont
        
        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        detail1.font = caption1Font
        detail2.font = caption1Font
    }
}
