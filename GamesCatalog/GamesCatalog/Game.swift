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
    init(title : String, shortDescription : String, fullDescription : String, url : String, image : UIImage?)
    {
        Title = title
        ShortDescription = shortDescription
        FullDescription = fullDescription
        Url = url
        Image = image
    }
    
    public var Title : String
    public var ShortDescription : String
    public var FullDescription : String
    public var Url : String
    public var Image : UIImage?
}
