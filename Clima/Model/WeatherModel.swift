//
//  WeatherModel.swift
//  SipTemp
//
//  Created by Mike Miller on 09/17/2021.
//  Copyright © 2021 iosAppBuild. All rights reserved.

import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let conditionID: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var nameDrinkString: String {
        switch conditionID {
                case 200...232:
                    return "Martini"
                case 300...321:
                    return "Hot Toddy"
                case 500...531:
                    return "Purple Rain"
                case 600...622:
                    return "Kahlua Hot Chocolate"
                case 701...781:
                    return "Foggy Manchester"
                case 800:
                    return "Sangria Sesh"
                case 801...804:
                    return "Green Rum Cocktail"
                default:
                    return "Cloudy Day"
                }
    }
    
    var phraseDrinkConditionString: String {
        switch conditionID {
                case 200...232:
                    return "Sweet Sound of,🧊 Shake it girl!"
                case 300...321:
                    return "Sip Into Some Hotness 🔥🔥"
                case 500...531:
                    return "Hands Up For Iconic Purple"
                case 600...622:
                    return "Balanced is Chocolate in Both Hands"
                case 701...781:
                    return "💫Fresh Looks Fab On You"
                case 800:
                    return "Well Hello, Miss Friskay!❤️‍🔥"
                case 801...804:
                    return "Are you a rum, rum, or rum Girl?"
                default:
                    return "Cloudy With A Chance of silver lining ⭐⭐"
                }
    }
    
    var imageDrinkConditionString: String {
        switch conditionID {
                case 200...232:
                    return "shaken"
                case 300...321:
                    return "hot-toddy"
                case 500...531:
                    return "purple-rain"
                case 600...622:
                    return "kahlua-hot"
                case 701...781:
                    return "foggy-manchester"
                case 800:
                    return "sangria"
                case 801...804:
                    return "green-rum-cocktail"
                default:
                    return "cloudy-day-drink"
                }
        
    }
    
    var conditionString: String {
        switch conditionID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
    
   
}
