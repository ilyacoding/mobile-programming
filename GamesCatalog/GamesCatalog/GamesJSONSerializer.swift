//
//  GamesJSONSerializer.swift
//  GamesCatalog
//
//  Created by Ilya Kovalenko on 2/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import SwiftyJSON

class GamesJSONSerializer {
    func Deserialize(source : String) -> [Game]{
        if let dataFromString = source.data(using: .utf8, allowLossyConversion: false) {
            
            let json = try! JSON(data : dataFromString);
            var array = [Game]();
            for game in json["games"].arrayValue {
                let title = game["title"].stringValue
                let releaseDate = game["releaseDate"].stringValue
                let shortDescription = game["shortDescription"].stringValue
                let fullDesc = game["fullDescription"].stringValue
                let urlLink = game["url"].stringValue
                let imageSource = game["image"].stringValue
                let fullImageSource = game["fullImage"].stringValue
                let gameInfo = Game(title: title, releaseDate: releaseDate, shortDescription : shortDescription, fullDescription : fullDesc, url : urlLink, image : UIImage(named : imageSource), fullImage : UIImage(named : fullImageSource))
                array += [gameInfo]
            }
            return array
        }
        return [Game]()
    }
}
