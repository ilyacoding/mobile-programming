//
//  MasterViewController.swift
//  WeatherForecast
//
//  Created by Ilya Kovalenko on 3/13/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol CitySelectionDelegate: class {
    func citySelected(_ newCity: City)
}

class MasterViewController: UITableViewController {
    weak var delegate: CitySelectionDelegate?

    var cities = [City]()
    
    func performDataRequest(_ url: URL, completion: @escaping (String?) -> Void) {
        Alamofire.request(url).responseString {
            response in
            if let data = response.result.value {
                completion(data)
            } else {
                completion(nil)
            }
        }
    }
    
    func performImageRequest(_ url: String, completion: @escaping (Image?) -> Void) {
        Alamofire.request(url).responseImage {
            response in
            if let image = response.result.value {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
    
    func getCurrentWeatherApiUrl(_ cityName: String) -> URL {
        let requestLink = "https://api.apixu.com/v1/current.json?key=bca10c771c2a41a59b6203640182803&q=" + cityName
        return URL(string: requestLink)!
    }
    
    private func loadCitiesWithWeather() {
        let path = Bundle.main.path(forResource: "cityList", ofType: "json")
        let data = try! String(contentsOfFile: path!)
        self.cities = CitiesJSONSerializer().Deserialize(source: data)
        
        DispatchQueue.global(qos: .utility).async {
            for city in self.cities {
                self.performImageRequest(city.imageUrl, completion: { image in
                    city.image = image
                    self.tableView.reloadData();
                })
                
                let weatherApiUrl = self.getCurrentWeatherApiUrl(city.name)
                self.performDataRequest(weatherApiUrl, completion: { weatherData in
                    let weather = WeatherJSONSerializer().Deserialize(source: weatherData!)!
                    let cityProperties = CityPropertiesJSONSerializer().Deserialize(source: weatherData!)
                    
                    self.performImageRequest(weather.imageUrl, completion: { weatherLogo in
                        weather.image = weatherLogo
                        self.tableView.reloadData();
                    })
                    
                    city.weather = weather
                    city.latitude = cityProperties?.lat
                    city.longitude = cityProperties?.lon
                    self.tableView.reloadData();
                })
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCitiesWithWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CityTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CityTableViewCell.")
        }
        let city = cities[indexPath.row]
        
        cell.cityName.text = city.name
        cell.cityLogo.image = city.image
        cell.weatherTemperature.text = city.weather?.temperature
        cell.weatherLogo.image = city.weather?.image
        if let lat = city.latitude, let lon = city.longitude {
            cell.cityLatLon.text = "Lat: " + lat + ", Lon: " + lon
        }
        cell.cityDescription.text = city.description
//        cell.weatherWind.text = city.weather?.windKph
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        delegate?.citySelected(selectedCity)
        
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
