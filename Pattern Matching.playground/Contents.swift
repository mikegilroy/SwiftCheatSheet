//: Playground - noun: a place where people can play

import UIKit

// *** Pattern Matching ***



let data: [Any?] = ["Ted", nil, 12,53,  "Mike"]

for case let name as String in data {
	print(name.uppercased()) // Optional removed and cast as String
}

for case let name? in data where name is String {
	print(name) // Optional removed and NOT casted as String but does check for String class type
}

for case let datum? in data {
	print(datum) // Optional removed
}

let view = UIButton()

switch view {
case is UIButton:
	print("Found a button")
case is UILabel:
	print("Found label")
case is UISwitch:
	print("Found a switch")
default:
	print("Found some view")
}
