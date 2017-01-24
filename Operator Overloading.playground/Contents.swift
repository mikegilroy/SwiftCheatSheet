//: Playground - noun: a place where people can play

import UIKit

// ***** Operator Overloading *****

// You can create new operators by declaring the function to be applied when the operator is used and defining the operators assosciativity and precedence

// Function to be applied when operator is used:
func **(lhs: Int, rhs: Int) -> Int {
	return Int(pow(Double(lhs), Double(rhs)))
}

// Declaring the operator and that it adheres to 'ExponentiativePrecedence'
infix operator ** : ExponentiativePrecedence

// Defining the 'ExponentiativePrecedence' precedence group
precedencegroup ExponentiativePrecedence {
	associativity: left
	higherThan: MultiplicationPrecedence
}

2 ** 4 ** 2



// ⛔️⛔️⛔️ DANGEROUS ⛔️⛔️⛔️

// You can also override existing operators - but this can cause bugs that are extremely difficult to find, especially if the developer working on the project is unaware of and did not create the override of the operator in the first - e.g. below overriding '==' :

func ==(lhs: Int, rhs: Int) -> Bool {
	return false
}

if 4 == 4 {
	print("4 == 4")
} else {
	print("4 != 4")
}

