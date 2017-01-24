//: Playground - noun: a place where people can play

import UIKit

// *** Generics ***

let data: [Any?] = ["Ted", nil, 12,53,  "Mike"]

// Generic type T is proclaimed inside <> which is the type used for the object parameter
func inspect<T>(object: T) {
	print(object)
}

inspect(object: 234)


// Generic type T is proclaimed again inside <>, but this time adhering to the Integer protocol, meaning that T can be any type adhering to the Integer protocol. As the return type is also T then the return type must be the same type as the one used for the items within the 'numbers' array. 
func sumOf<T: Integer>(numbers: [T]) -> T {
	return numbers.reduce(0, +)
}

sumOf(numbers: [12, 13, 13])

func printValues<T: Collection>(collection: T) {
	print("Printing values of a collection:")
	var index = 0
	for value in collection {
		print("\(index): \(value)")
		index += 1
	}
}

printValues(collection: [1,2,3])
printValues(collection: data)
printValues(collection: data)

