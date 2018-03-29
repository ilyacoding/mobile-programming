//
//  CityTableViewCell.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityLogo: UIImageView!
    
    @IBOutlet weak var weatherTemperature: UILabel!
    @IBOutlet weak var weatherLogo: UIImageView!
    @IBOutlet weak var weatherWind: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
