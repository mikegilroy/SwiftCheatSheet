//: Playground - noun: a place where people can play

import UIKit

// *** Functional Programming ***


let data: [Any?] = ["Ted", nil, 12,53,  "Mike"]

// Flatmap -> removes optionals/one level of containment

let actualData = data.flatMap {$0}
for datum in actualData {
	print(datum)
}

let numericData = data.flatMap{($0 as? Int)}


// Map -> transforms each element and puts back new element

let doubledData = numericData.map {$0 * 2}
let squareRootData = numericData.map {sqrt(Double($0))}


// Chaining flatmap and map
let nonNilData = data.flatMap{($0 as? Int)}.map {$0 * 2}
for datum in nonNilData {
	print(datum)
}


// Flatmap -> removes one level of containment - either optionals or multi-dimesional arrays

let arrayOfArrays = [[1,2,3], [4,5], [6, 7, 8]]
let flattenedArray = arrayOfArrays.flatMap {$0}
print(flattenedArray)


// Filter -> iterates through

let evenNumbers = flattenedArray.filter { remainder(Double($0), 2.0) == 0 }
print("Even numbers:\(evenNumbers)")


// Reduce - Returns the result of calling the given combining closure with each element of this sequence and an accumulating value.

let productOfNonNilData = nonNilData.reduce(1, {$0 * $1})
print(productOfNonNilData)

let sumOfNonNilData = nonNilData.reduce(0, +)
print(sumOfNonNilData)



