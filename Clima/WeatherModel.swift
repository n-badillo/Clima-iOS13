//
//  WeatherModel.swift
//  Clima
//
//  Created by CSUFTitan on 3/28/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel{
    
    // Stored Properties
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let weatherDesc: String
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {  // return the value of what the condition name should be
        
        switch conditionId{
         // Conditions for various types of thunder storms
        case 200...201:
            return "cloud.bolt.rain"
        case 210...221:
            return "cloud.bolt"
        case 230...232:
            return "cloud.bolt.rain"
        
        // Conditions for various types of drizzle
        case 300...321:
            return "cloud.drizzle"
            
        // Conditions for various types of rain
        case 500...501:
            return "cloud.rain"
        case 502...531:
            return "cloud.heavyrain"
        
        // Conditions for various types of snow
        case 600...602:
            return "cloud.snow"
        case 611...613:
            return "cloud.sleet"
        case 615...622:
            return "cloud.snow"
            
        // Conditions for various types of fog
        case 701...711:
            return "smoke"
        case 721:
            return "haze"
        case 731:
            return "sun.dust"
        case 741:
            return "sun.fog"
        case 751...761:
            return "sun.dust"
        case 762:
            return "smoke"
        case 771:
            return "wind"
        case 781:
            return "tornado"
            
        // Conditions for clear skies
        case 800:
            return "sun.min"
        
        // Conditions for various clouds
        case 801...804:
            return "cloud.sun"
        default:
            return "sun.min"
        }
    }
}
    


//func getConditionName (weatherID: Int) -> String{
//       switch weatherID{
//
//        // Conditions for various types of thunder storms
//       case 200...201:
//           return "cloud.bolt.rain"
//       case 210...221:
//           return "cloud.bolt"
//       case 230...232:
//           return "cloud.bolt.rain"
//
//       // Conditions for various types of drizzle
//       case 300...321:
//           return "cloud.drizzle"
//
//       // Conditions for various types of rain
//       case 500...501:
//           return "cloud.rain"
//       case 502...531:
//           return "cloud.heavyrain"
//
//       // Conditions for various types of snow
//       case 600...602:
//           return "cloud.snow"
//       case 611...613:
//           return "cloud.sleet"
//       case 625...622:
//           return "cloud.snow"
//
//       // Conditions for various types of fog
//       case 701, 711, 762:
//           return "smoke"
//       case 721:
//           return "haze"
//       case 731, 751, 761:
//           return "sun.dust"
//       case 741:
//           return "sun.fog"
//       case 771:
//           return "wind"
//       case 781:
//           return "tornado"
//
//       // Conditions for clear skies
//       case 800:
//           return "sun.min"
//
//       // Conditions for various clouds
//       case 801...804:
//           return "cloud.sun"
//       default:
//           return "sun.min"
//       }
       
