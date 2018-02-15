//
//  Game.swift
//  GamesCatalog
//
//  Created by Ilya Kovalenko on 2/12/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation
import UIKit

class Game
{
    init(title : String, releaseDate : String, shortDescription : String, fullDescription : String, url : String, image : UIImage?, fullImage : UIImage?)
    {
        Title = title
        ReleaseDate = releaseDate
        ShortDescription = shortDescription
        FullDescription = fullDescription
        Url = url
        Image = image
        FullImage = fullImage
    }
    
    public var Title : String
    public var ReleaseDate : String
    public var ShortDescription : String
    public var FullDescription : String
    public var Url : String
    public var Image : UIImage?
    public var FullImage : UIImage?
}
