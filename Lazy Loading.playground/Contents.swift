//: Playground - noun: a place where people can play

import UIKit

// ***** Lazy Loading *****

/*

	What is lazy loading?

	Lazy loading allows you to load a variable (typically one that requires heavy computation) only when it is needed
	and then caches the result for future use. If the value of one of your computed variables will not change after
	initial computation then using lazy loading will boost the performance of your code by only running this
	computation once.

	Note - once a lazy loaded variable has been initialised it cannot be changed, as it is cached. For variables that require computation every time they are used, a computed variable should be used instead.

*/


// ***** Lazy Loading Examples *****

// Here we use a private function to get a value for the lazy property 'reversedName'.
// Using a private function helps to keep our properties and functions organised.

class Singer {
	let name: String
	lazy var reversedName: String = self.getReversedName()
	
	init(name: String) {
		self.name = name
	}
	
	private func getReversedName() -> String {
		return "\(String(name.characters.reversed()))"
	}
}


// Here we use a non-escaping closure to return value for lazy property. The closure will be run when the variable reversedName is accessed for the first time.

class Actor {
	let name: String
	lazy var reversedName: String = {
		return "\(String(self.name.characters.reversed()))"
	}()
	
	init(name: String) {
		self.name = name
	}
}

// Lazy-loading singletons - all static let singletons in Swift are automatically lazy-loading. 

class MusicPlayer {
	init() {
		print("Ready to play music")
	}
}

class Musician {
	static let musicPlayer = MusicPlayer()
	init() {
		print("Creating a musician")
	}
}

// Notice the music player initialiser is only called once, and not when the musician is initialised.
let musician = Musician()
let musicPlayer = Musician.musicPlayer


