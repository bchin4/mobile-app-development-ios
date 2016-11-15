//
//  Thingee.swift
//  Save n' Load
//
//  Created by Robert Stjacques Jr on 11/9/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class Thingee: NSObject, NSCoding {
    static let aStringKey = "aString"
    static let aNumberKey = "aNumber"
    static let aBooleanKey = "aBoolean"
    static let aUniqueIDKey = "aUniqueID"
    
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
        aString = aDecoder.decodeObject(forKey: Thingee.aStringKey) as! String
        aNumber = aDecoder.decodeInteger(forKey: Thingee.aNumberKey)
        aBoolean = aDecoder.decodeBool(forKey: Thingee.aBooleanKey)
        aUniqueID = aDecoder.decodeObject(forKey: Thingee.aUniqueIDKey) as! String
    }
    
    // encodes (serializes) a Thingee
    func encode(with aCoder: NSCoder) {
        aCoder.encode(aString, forKey: Thingee.aStringKey)
        aCoder.encode(aNumber, forKey: Thingee.aNumberKey)
        aCoder.encode(aBoolean, forKey: Thingee.aBooleanKey)
        aCoder.encode(aUniqueID, forKey: Thingee.aUniqueIDKey)
    }
    
    
}
