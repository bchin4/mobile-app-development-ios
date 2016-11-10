//
//  ThingeePersister.swift
//  Save n' Load
//
//  Created by Robert Stjacques Jr on 11/9/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ThingeePerister: NSObject {
    static let thingeeArchiveURL: NSURL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("thingee.archive") as NSURL
    }()
    
    class func getThingee() -> Thingee {
        if let thingee = NSKeyedUnarchiver.unarchiveObject(withFile: thingeeArchiveURL.path!) as? Thingee {
            return thingee
        }
        else {
            return Thingee()
        }
    }
    
    class func setThingee(_ thingee: Thingee) -> Bool {
        return NSKeyedArchiver.archiveRootObject(thingee, toFile: thingeeArchiveURL.path!)
    }
}
