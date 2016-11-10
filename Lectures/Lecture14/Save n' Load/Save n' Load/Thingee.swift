//
//  Thingee.swift
//  Save n' Load
//
//  Created by Robert Stjacques Jr on 11/9/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Thingee: NSObject, NSCoding {
    let aStringKey = "aString"
    let aNumberKey = "aNumber"
    let aBooleanKey = "aBoolean"
    let aUniqueIDKey = "aUniqueID"
    
    var aString: String
    var aNumber: Int
    var aBoolean: Bool
    var aUniqueID: String
    
    override init() {
        aString = "default string"
        aNumber = 1234
        aBoolean = false
        aUniqueID = NSUUID().uuidString
    }
    
    // decodes (deserializes) a Thingee
    required init(coder aDecoder: NSCoder) {
        aString = aDecoder.decodeObject(forKey: aStringKey) as! String
        aNumber = aDecoder.decodeInteger(forKey: aNumberKey)
        aBoolean = aDecoder.decodeBool(forKey: aBooleanKey)
        aUniqueID = aDecoder.decodeObject(forKey: aUniqueIDKey) as! String
    }
    
    // encodes (serializes) a Thingee
    func encode(with aCoder: NSCoder) {
        aCoder.encode(aString, forKey: aStringKey)
        aCoder.encode(aNumber, forKey: aNumberKey)
        aCoder.encode(aBoolean, forKey: aBooleanKey)
        aCoder.encode(aUniqueID, forKey: aUniqueIDKey)
    }
    
    
}
