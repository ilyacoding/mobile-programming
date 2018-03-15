//
//  CityJSONSerializer.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import SwiftyJSON

class CitiesJSONSerializer {
    func Deserialize(source : String) -> [City] {
        if let dataFromString = source.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data : dataFromString)
            var array = [City]()
            for game in json["cities"].arrayValue {
                let name = game["name"].stringValue
                let description = game["description"].stringValue
                let latitude = game["latitude"].stringValue
                let longitude = game["longitude"].stringValue
                let imageUrl = game["imageUrl"].stringValue
                
                let cityInfo = City(name: name, description: description, latitude: latitude, longitude: longitude, imageUrl: imageUrl)
                array += [cityInfo]
            }
            return array
        }
        return [City]()
    }
}
