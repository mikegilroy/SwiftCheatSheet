//: Playground - noun: a place where people can play

import UIKit


// ***** Tuples *****


let singer = (first: "Calvin", last: "Harris")
singer.first

// Tuples can be given closures (these are not methods as they have no access to sibling properties like first and last in this example)
let artist = (first: "Ed", last: "Sheeran", sing: { (lyrics: String) in
	print(lyrics)
})

artist.sing("I know all")
artist.first


// Functions can return tuples when miltiple values of different types are needed
func getWeather() -> (name: String, cloud: Int, high: Int, low: Int) {
	return ("Sunny", 0, 20, 15)
}

getWeather().cloud

let optionalStrings: (String?, String?) = ("Name", nil)
let optionalTuple: (String, String)? = nil


// You can do conditional checks on tuple matching but only up to 6 elements - e.g. (A, B, C, D, E, F)
// It also does not take label names into account - e.g. last and surname labels used here

let Ed = (first: "Ed", last: "Sheeran")
let Calvin = (first:"Calvin", surname: "Harris")

if singer == Calvin {
	print("We found Calvin")
} else {
	print("We're stuck with Ed")
}


// typealias can be used to make using tuples in functions cleaner

let father = (first: "Scott", last: "Harris")
let mother = (first: "Mary", last: "Jane")
typealias Name = (first: String, last: String)

func marry(man: Name, women: Name) -> (husband: Name, wife: Name) {
	return (man, (women.first, man.last))
}





