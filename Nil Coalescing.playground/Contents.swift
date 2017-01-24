//: Playground - noun: a place where people can play

import UIKit

// ** Nil Coalescing **

// Used when setting the value of a let constant
let savedText = (try? String(contentsOfFile: "savedText.txt")) ?? "No saved text"
print(savedText)

// Used when a function requires a non-optional parameter 
let imageName: String? = nil
let image = UIImage(named: imageName ?? "default_image")

