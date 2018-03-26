//
//  DetailViewController.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    
    var city: City? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        cityName.text = city?.name
        cityDescription.text = city?.description
//        city.
//        nameLabel.text = monster?.name
//        descriptionLabel.text = monster?.description
//        iconImageView.image = monster?.icon
//        weaponImageView.image = monster?.weaponImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: CitySelectionDelegate {
    func citySelected(_ newCity: City) {
        city = newCity
    }
}
