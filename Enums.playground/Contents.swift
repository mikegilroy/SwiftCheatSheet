//: Playground - noun: a place where people can play

import UIKit

// *** Enums *** //

enum WeatherType {
	case cloudy(coverage: Int)
	case sunny
	case windy
}

let weather: WeatherType = .cloudy(coverage: 100)

switch weather {
case .cloudy(let coverage) where coverage > 80:
	print("It's cloudy with a \(coverage)% coverage")
case .windy:
	print("It's windy")
case .sunny:
	print("It's sunny :)")
default:
	print("Weather unknown")
}

let forecast: [WeatherType] = [.cloudy(coverage: 100), .windy, .sunny, .cloudy(coverage: 99), .cloudy(coverage: 40)]

for case let .cloudy(coverage) in forecast {
	print("Weather forecast is cloudy with \(coverage)% coverage")
}

for case .cloudy(40) in forecast {
	print("It's cloudy with 40% coverage, what are the chances?!")
}
