//
//  WeatherManager.swift
//  Clima
//
//  Created by CSUFTitan on 3/28/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=7133a6b5faca4eb40c624f25df461d72&units=metric";
    
    var delegate: WeatherManagerDelegate?
    
    func getWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)";
        preformRequest(with: urlString)
    }
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        preformRequest(with: urlString)
    }
    
    func preformRequest(with urlString: String){
        // Networking with OpenWeatherMap API
        
        // 1. Create the URL
        if let url = URL(string: urlString){  // binds to a string
            
            // 2. Creating a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                    // Exit out of the function and do not continue; if we ran into a problem there is no reason to keep going. Does not need a return value
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){  // Add a self if you're calling a method from the current class
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // Different way of having the dataTask work =================
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:) ) // completionHandler will take in a function as the input
            // returns dataTask, which we can output as a constant
            // ============================================================
            
            // 4. Start the task
            task.resume() // tasks start off as a suspended state
        }
        
    }
    
    // Alternate dataTask way of doing the completion handler
    //    func handle(data: Data?, response: URLResponse?, error: Error?){
    //        if error != nil {
    //            print(error!)
    //            return
    //            // Exit out of the function and do not continue; if we ran into a problem there is no reason to keep going. Does not need a return value
    //        }
    //        if let safeData = data {
    //            let dataString = String(data: safeData, encoding: .utf8)
    //            print(dataString)
    //        }
    //    }
    
    func parseJSON(_ weatherData: Data)-> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let description = decodedData.weather[0].description

            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, weatherDesc: description)
            //print(weather.temperatureString)
            //print(weather.conditionName)
            return weather
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

   
}
