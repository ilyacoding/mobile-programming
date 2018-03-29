//
//  WeatherJSONSerializer.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/29/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherJSONSerializer {
    func Deserialize(source : String) -> Weather? {
        if let dataFromString = source.data(using: .utf8, allowLossyConversion: false){
            let json = try! JSON(data : dataFromString);
            let temperature = json["current"]["temp_c"].stringValue + " °C"
            let imageUrl = "https:" + json["current"]["condition"]["icon"].stringValue
            let windKph = json["current"]["wind_kph"].stringValue + " km/h"
            let windDegree = json["current"]["wind_degree"].doubleValue
            return Weather(temperature, imageUrl, windKph, windDegree)
        }
        return nil
    }
}
