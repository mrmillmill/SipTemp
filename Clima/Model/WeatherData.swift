//
//  WeatherData.swift
//  SipTemp
//
//  Created by Mike Miller on 09/17/2021.
//  Copyright © 2021 iosAppBuild. All rights reserved.

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
