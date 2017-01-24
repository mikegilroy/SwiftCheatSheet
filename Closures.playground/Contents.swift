//: Playground - noun: a place where people can play

import UIKit

// ***** Closures *****

// Declaring a closure as a constant, to be used later on. This closure takes two parameters, 'firstName' and 'lastName'
let fullname = { (firstName: String, lastName: String) in
	print("The fullname is \(firstName) \(lastName)")
}

fullname("Mike", "Gilroy")


class SomeClass {
	
	func anotherFunc() {
		
	}
	
	func networkingFunc(completion: @escaping () -> Void) {
		completion()
	}
	
	// Use weak self when accessing self in escaping closures to avoid retain cycles
	func doSomething() {
		networkingFunc { [weak self] in
			self?.anotherFunc()
		}
	}
	
}