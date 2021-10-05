//
//  WeatherManager.swift
//  SipTemp
//
//  Created by Mike Miller on 9/4/21.
//  Copyright © 2021 iosAppBuild. All rights reserved.
//

import Foundation
import CoreLocation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {

    var urlComponents = URLComponents()
    
//    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=cac5ec6f204004569ee46788439a1f55&units=imperial"
    
    let appID = "cac5ec6f204004569ee46788439a1f55"
    let units = "imperial"
    var delegate: WeatherManagerDelegate?

    
    mutating func fetchCityName(cityName: String) {
        
//        let urlString = "\(weatherURL)&q=\(cityName)"
//        performRequest(with: urlString)
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [
            URLQueryItem(name: "appid", value: appID),
            URLQueryItem(name: "units", value: units),
            URLQueryItem(name: "q", value: cityName)
        ]
        
        let urlString = "\(urlComponents.url?.absoluteString ?? "No URLString")"
            performRequest(with: urlString)
    }
    
    mutating func fetchCityName(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        
        
        let lat = String(format: "%.4f", latitude)
        let lon = String(format: "%.4f", longitude)

        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [
            URLQueryItem(name: "appid", value: appID),
            URLQueryItem(name: "units", value: units),
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon)
        ]

        let urlString = "\(urlComponents.url?.absoluteString ?? "No URLString")"

            performRequest(with: urlString)
     
    }
    
    func performRequest(with urlString: String) {
       
        //1. URL
        
        if let url = URL(string: urlString) {
            
            //2. URLSession\\
            
            let session = URLSession(configuration: .default)
            
            //3. Session Task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let weather = parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4. Task Resume
            
            task.resume()
            
        }
    }
    
    func parseJSON(_ weather: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weather)
            
            let name = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
                
            
            let weather = WeatherModel(cityName: name, temperature: temp, conditionID: id)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
      
        
    }
    
}
