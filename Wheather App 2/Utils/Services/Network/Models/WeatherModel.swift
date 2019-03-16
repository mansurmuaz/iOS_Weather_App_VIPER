//
//  WeatherModel.swift
//  Wheather App 2
//
//  Created by Mansur Muaz  Ekici on 16.07.2018.
//  Copyright © 2018 Adesso. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherModel: BaseModel {
    
    var name: String!
    var degree: Int!
    var weather: String!
    var description: String!
    var wind: Int!
    var humidity: Int!
    var date: String?
    var image: UIImage!
    var unit: String!
    
    var weatherUnit = "metric"
    
    required init(json: JSON) {
        super.init(json: json)

        self.name = json["name"].stringValue
        self.degree = json["main"]["temp"].intValue
        self.weather = json["weather"][0]["main"].stringValue
        self.description = json["weather"][0]["description"].stringValue
        self.wind = json["wind"]["speed"].intValue
        self.humidity = json["main"]["humidity"].intValue
        self.date = json["dt_txt"].stringValue
        
        if let savedUnit = UserDefaults.standard.string(forKey: "unit") {
            weatherUnit = savedUnit
        }
        
        switch weatherUnit {
        case "metric":
            self.unit = "ºC"
        case "imperial":
            self.unit = "ºF"
        default:
            self.unit = "ºC"
        }
        
        switch json["weather"][0]["icon"].stringValue {
        case "01d": //clear
            self.image = #imageLiteral(resourceName: "backgroundImage")
        case "01n": //clear night
            self.image = #imageLiteral(resourceName: "clear sky night")
        case "02d": //clouds
            self.image = #imageLiteral(resourceName: "clouds")
        case "02n": //cloud night
            self.image = #imageLiteral(resourceName: "clouds night")
        case "03d", "04d": //few cloud
            self.image = #imageLiteral(resourceName: "few clouds")
        case "03n", "04n": //few cloud night
            self.image = #imageLiteral(resourceName: "few clouds night")
        case "50d": //mist
            self.image = #imageLiteral(resourceName: "mist")
        case "50n": //mist night
            self.image = #imageLiteral(resourceName: "mist night")
        case "09d", "10d": //rain
            self.image = #imageLiteral(resourceName: "rain")
        case "09n", "10n": //rain night
            self.image = #imageLiteral(resourceName: "rain night")
        case "13d": //snow
            self.image = #imageLiteral(resourceName: "snow")
        case "13n": //snow night
            self.image = #imageLiteral(resourceName: "snow night")
        case "11d": //thunderstorm
            self.image = #imageLiteral(resourceName: "thunderstorm")
        case "11n": //thunderstorm night
            self.image = #imageLiteral(resourceName: "thunderstorm night")
        default:
            self.image = #imageLiteral(resourceName: "backgroundImage")
        }
    }
}
