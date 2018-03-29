//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/29/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import AlamofireImage

class Forecast {
    let date: String
    let averageTemperature: String
    let maxWindKph: String
    let conditionImageUrl: String
    var conditionImage: Image?
    
    init(_ date: String, _ averageTemperature: String, _ maxWindKph: String, _ conditionImageUrl: String) {
        self.date = date
        self.averageTemperature = averageTemperature
        self.maxWindKph = maxWindKph
        self.conditionImageUrl = conditionImageUrl
    }
}
