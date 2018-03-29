//
//  City.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import AlamofireImage

class City {
    let name: String
    let description: String
    var latitude: String?
    var longitude: String?
    
    var imageUrl: String
    var image: Image?
    var weather: Weather?
    
    init( _ name: String, _ description: String, _ imageUrl: String) {
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
}
