//
//  CityProperties.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/29/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation

final class CityProperties {
    let lat: String
    let lon: String
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
}
