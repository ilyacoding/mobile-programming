//
//  City.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation

class City {
    let name: String
    let description: String
    let latitude: String
    let longitude: String
    let imageUrl: String
    
    init(name: String, description: String, latitude: String, longitude: String, imageUrl: String) {
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.imageUrl = imageUrl
    }
    
//    var icon: UIImage? {
//        return UIImage(named: iconName)
//    }
}
