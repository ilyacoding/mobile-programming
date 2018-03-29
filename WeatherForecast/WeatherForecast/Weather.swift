//
//  Weather.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/28/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import AlamofireImage

class Weather {
    var temperature: String
    var imageUrl: String
    var windKph: String
    var windDegree: Double
    var image: Image?
    
    init(_ temperature: String, _ imageUrl: String, _ windKph: String, _ windDegree: Double) {
        self.temperature = temperature
        self.imageUrl = imageUrl
        self.windKph = windKph
        self.windDegree = windDegree
    }
}
