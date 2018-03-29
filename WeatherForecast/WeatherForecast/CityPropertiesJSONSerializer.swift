//
//  CityPropertiesJSONSerializer.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/29/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityPropertiesJSONSerializer {
    func Deserialize(source : String) -> CityProperties? {
        if let dataFromString = source.data(using: .utf8, allowLossyConversion: false){
            let json = try! JSON(data : dataFromString);
            let lat = json["location"]["lat"].stringValue
            let lon = json["location"]["lon"].stringValue
            
            return CityProperties(lat: lat, lon: lon)
        }
        return nil
    }
}
