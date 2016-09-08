//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello, CSC 214!")

//
// integers
//
var aFirstInteger: Int     // type but no value
aFirstInteger = 234        // assigns value to previously declared variable
var aSecondInt = 123       // type is inferred from literal value
var aThirdInt = aSecondInt // makes a COPY (type inferred), NOT a reference to the same
                           //     integer.  changes to one won't affect the other
aSecondInt = 1             // 123 replaced with 1
print(aThirdInt)           // retained original value
var aFourthInt = 123
//aFourthInt = 12.34       // Error: Swift is strongly typed; can't assign a floating
                           //     point value to an integer variable

var aFifthInt: Int = 789   // type and value may both be explicitly declared


// mins and maxes of various integer types
print(UInt8.min)  // unint 8 is an 8-bit unsigned integer
print(UInt8.max)
print(Int32.min)
print(Int32.max)


//
// constants
//
let aConstantInt = 123       // "let" is used to create a constant
//aConstantInt = 234         // Error: you can't reassign a constant
let anotherConstantInt: Int  // you can declare a constant without assigning it
anotherConstantInt = 456     // and later give it a value that cannot change
//anotherConstantInt = 567   // Error: constants can be assigned only once


//
// initializers
//
let initIntDefault = Int()        // default initializer; 0
let initIntString = Int("999")    // init with string
let initIntFloat = Int(45.67)     // init with float; floor

//
// Booleans
//
var aFirstBool: Bool       // type but no value
aFirstBool = true          // assign the literal "true"
aFirstBool = false         // assign the literal "false"
var aSecondBool = true     // type is inferred from literal value
//aSecondBool = 23         // Error: Swift is still strongly typed.

let initBoolDef = Bool()            // default initializer; false
let initBoolBoo = Bool(aSecondBool) // init with another bool
let initBoolOne = Bool(1)           // init with Int (1); true
let initBoolZer = Bool(0)           // init with Int (0); false
let initBoolNeg = Bool(-1)          // init with Int (-1); true



//
// floating point numbers
//
let mFloatLiteral = 12.34  // this is a Double by default
let aCopy: Float
//aCopy = mFloatLiteral    // so this causes an error (can't assign Double to Float)

let aFloat: Float = 12.34           // 32-bit
let aDouble: Double = 1234567.89567 // 64-bit
let aFloat80: Float80 = 12345678901234567890.12345678901234567890 // 80-bit
let anotherFloat: Float = 2                // assigning an integer literal to a float is fine
// let yetAnotherFloat: Float = aSecondInt    // Error: can't assign int var to float

let initFloatDef = Float()          // default; 0
let initFloatStr = Float("12.56")   // init with string
let initFloatInt = Float(12345)     // init with int

//
// strings
//
let aFirstString = "abc"    // type inferred
let aSecondString: String   // type explicit, no value

//isEmpty
aSecondString = "def"       // assigns a value to previously declared variable
aSecondString.isEmpty       // not empty
let aThirdString = ""       // the empty string
aThirdString.isEmpty        // is empty
let aBlankString = "   "    // white space
aBlankString.isEmpty        // is not empty

// mutation
var mutableString = "abc"
mutableString.appendContentsOf("def")  // in place mutation of the string
print(mutableString)

let immutableString = "123"
//immutableString.appendContentsOf("456")  // Error: can't change a constant string; immutable


let initStringDef = String()
let initStringStr = String("abc")
let initStringInt = String(1234)
let initStringFlo = String(45.67)

//
// arrays
//
var aFirstArray: Array<Int>      // type but no values
aFirstArray = [1, 2, 3]          // assigns a value
aFirstArray.count                // the number of elements in the array; 3
aFirstArray.append(7)            // adds a value to the array
aFirstArray.count                // count is now 4
//aFirstArray.append("abc")      // Error: strongly typed; can't add strings to an int array
let anElement = aFirstArray[1]   // arrays are indexed starting at 0

let aSecondArray: [Int]          // shorthand for type; preferred
//aSecondArray = ["abc", "def"]  // Error: arrays are strongly typed; can't add strings 
                                 // to an array of ints
aSecondArray = [4, 5]            // create an array with two elements
aSecondArray.count               // the number of elements in the array
//aSecondArray.append(6)         // Error: cannot append to a constant array
//var bad = aSecondArray[2]      // Error: there are only 2 elements in the array; can't
                                 //   get the third.
//aSecondArray.removeAtIndex(2)  // error: cannot remove elements from a constant array
//aSecondArray.insert(8, 1)      // error: cannot insert into a constant array

let initArrayDef = Array<String>()               // empty array
let initArrayArr = Array<String>(["abc", "def"]) // init with literal

let anArrayOfArrays: Array<Array<Int>>      // an array of arrays of ints
let arrayOfArrays: [[Int]]
anArrayOfArrays = [[1],[4,5,6],[7,8]]       // assign a literal value; ragged arrays OK
let anotherElement = anArrayOfArrays[1][2]  // index of 3rd element in 2nd array

var aSourceArray = [10, 20, 30]
let aCopyArray = aSourceArray

aSourceArray.append(42)
aSourceArray.removeAtIndex(1)

print(aSourceArray)
print(aCopyArray)




//
// sets
//
let aFirstSet: Set<Int>                   // a set of ints
aFirstSet = Set()                         // empty set
let aSecondSet = Set([123, 456, 789])     // initialize with array; order is lost
aSecondSet.count                          // number of elements in the set; 3
aSecondSet.contains(123)                  // contains 123? true
//aSecondSet.insert(321)                  // Error: cannot insert into constant set
var aThirdSet = Set([123, 123, 456, 123]) // duplicate elements removed
aThirdSet.insert(123)                     // duplicate elements not inserted
aThirdSet.insert(789)                     // new elements are inserted
aThirdSet.popFirst()                      // removes and returns the first element
aThirdSet.remove(123)                     // removes and returns the specified element
aThirdSet.remove(555)                     // return nil as the element isn't in the set
print(aThirdSet)


var aFourthSet = Set<Int>()               // empty set
aFourthSet.insert(123)                    // insert 123
aFourthSet.insert(789)                    // insert 789
aFourthSet.insert(123)                    // element not added
aFourthSet.remove(123)                    // remove element


aFourthSet.count
aFourthSet.contains(123)
aFourthSet.contains(999)
aFourthSet.popFirst()

var aThingFromASet = aFourthSet.remove(1234)
//var total = 5 + aThingFromASet               // error: needs to be unwrapped because remove returns an optional




//
// if-else
//

var aCondition = true
var bCondition = false
var cCondition = true

var dCondition = aCondition || bCondition && !cCondition // boolean operators as you'd expect

if aCondition {        // if-else
    var doSomething = "do something"
}
else {
    var doNothing = "don't do anything"
}

if( !aCondition ) {  // optional parentheses
    
}
else if bCondition { // else if
    
}
else {
    var theElse = "both are false"
}

if aCondition && bCondition { // and
    
}
else if aCondition || bCondition { // or
    
}



//
// optionals and nil
//
let anUnassignedInt: Int
//let aBadAssignment = anUnassignedInt     // Error: can't use a variable before it is assigned
var anOptionalFloat: Float?                // an optional float; may or may not be nil
var anotherOptionalFloat = anOptionalFloat
//var total = anOptionalFloat + 5          // Error: need to unwrap the optional
//var total = anOptionalFloat! + 5         // Error: can force the unwrap with !, but causes a trap
                                           //   if the optional is nil
let anOptionalConstant: String?
//let anotherOptionalConstant = anOptionalConstant!  // error: can't use a constant before it is assigned
anOptionalConstant = "assigned"


anOptionalFloat = 7
var total = anOptionalFloat! + 5           // this works but is potentially unsafe (see above)

if let tmp = anOptionalFloat {             // use if/let to safely unwrap optionals
    total = tmp + 5
}
else {
    let whoops = "looks like the optional was nil!"  // code is not executed unless anOptionalFloat
                                                     //    is nil
}

var optionalTom: Float?
var optionalLarry: Float?
if let tom = optionalTom,         // here is an if/let example with more than one optional
    larry = optionalLarry {       //    separated by commas
    total = tom + larry
}
else {
    let willSeeThis = "both are nil, so the else is executed"
}

//
// dictionaries
//
let aFirstDict: Dictionary<Int,String>            // a dictionary of Int keys and String values
var aSecondDict: [Int:String]                     // shorthand
aSecondDict = [1: "one", 2: "two", 3: "three"]    // literal assignment
aSecondDict[5] = "five"
print(aSecondDict)

var aDictElement = aSecondDict[6]



let one: String? = aSecondDict[1]                 // dictionaries may return nil
let four: String? = aSecondDict[4]                // like this; optionals are needed

if let two = aSecondDict[2] {
    var result = "this works because two is in the dictionary"
}

if let five = aSecondDict[5] {
    var nope = "not there"
}
else {
    var missing = "5 isn't in the dictionary"
}

//
// various for loops (one of which is actually useful)
//

let arrayForLoops = [9,8,7,6,5,4,3,2,1,0]

//for var i = 0; i<arrayForLoops.count; i++ {  // this "C-style" statement is deprecated
//}                                            //    and a warning is issued

var totalOfRange = 0
let range = 0..<arrayForLoops.count  // this for-in is a lot more like Python's

for i in range {
  totalOfRange = totalOfRange + arrayForLoops[i]
}
print(totalOfRange)

var totalOfAnInts = 0
for anInt in arrayForLoops {  // this for-in is similar to a Java-style for-each
  totalOfAnInts = totalOfAnInts + anInt
}
print(totalOfAnInts)

for (i, aString) in arrayForLoops.enumerate() { // this for-in uses enumerate, which returns a 
                                                //    series of tuples.  Not used in iOS
    var interpolated = "index: \(i), value: \(aString)"
}

//
// while loop example
//
var count = 10
var totalWhile = 0
while count > 0 {
    totalWhile = totalWhile + count
    count = count - 1
}
print(totalWhile)

//
// enumerations
//
enum Flowers {
    
}

enum Dogs {                 // an enum works like an enum in Java
    case Lightning
    case Thunder
    case Buttercup
}

let puppy: Dogs        // enums can be used like other types
puppy = Dogs.Buttercup // use dot-notation to reference one value

//var rawPuppy = Dogs.Buttercup.rawValue // does not work because there is no raw value

enum Cats: String {           // enums can also use types; e.g. String
    case Slater = "slater"    // each case can be associated with an instance of the type
    case Cutie = "Cutie"
    case MrJ = "Mr. J"
    case Harley = "Harley"
    case Tom                  // no explicit raw value specified
}

print(Cats.Slater.rawValue)
print(Cats.Tom.rawValue)

enum Cards: Int {
    case NotACard
    case Ace = 11
    case Two = 2
    case Three
    case Four
}

print(Cards.NotACard.rawValue)
print(Cards.Three.rawValue)


let kitty: String
kitty = Cats.Slater.rawValue // the value of the type can be retrieved using .rawValue



//
// switch
//

let dog: String
switch puppy {            // switch used with an enum
case .Buttercup:
    dog = "Buttercup"     // notice no need for breaks (no falling through by default)
case .Thunder:
    dog = "Thunder"
case .Lightning:
    dog = "Lightning"     // the cases must all appear or an error will occur
}

let oldFart = Dogs.Thunder

var otherDog: String
switch oldFart {
case .Thunder:
    otherDog = "Thunder"
    fallthrough
case .Buttercup:
    otherDog = "Buttercup"   // the fallthrough keyword is used to force a fall through
case .Lightning:
    otherDog = "Lightning"
}

let myAge = 41

switch myAge {
case 41:                                // switches can use ints...
    print("Meh")
case 31...40:                           // and ranges (neat)
    print("Not so bad.")
case 0...30:
    print("Still young!")
default:                                // and specify defaults as you'd expect
    print("That is not an age...")
}

var myName = "Bobby"
switch myName {
    case "Bobby":
        print("That's right!")
    default:
        print("That's wrong.")
    
}


