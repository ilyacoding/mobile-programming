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
    var ImageCache = [String: UIImage]()
    
    private func loadCities() {
        let path = Bundle.main.path(forResource: "cityList", ofType: "json")
        do {
            let data = try String(contentsOfFile: path!)
            self.cities = CitiesJSONSerializer().Deserialize(source: data)
        }
        catch
        {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCities()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CityTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CityTableViewCell.")
        }
        let city = cities[indexPath.row]
        
        cell.cityName.text = city.name
        
        let cityName = city.name
        
        if let cityImage = ImageCache[cityName] {
            let cityImageView: UIImageView = cell.imageView!
            cityImageView.image = cityImage
        } else {
            Alamofire.request(city.imageUrl).responseImage { response in
                if let image = response.result.value {
                    self.ImageCache[cityName] = image
                    
                    DispatchQueue.main.async {
                        if let cellToUpdate = tableView.cellForRow(at: indexPath) {
                            let cityImageView: UIImageView = cellToUpdate.imageView!
                            cityImageView.image = image
                        }
                    }
                }
            }
        }
        
//        Alamofire.request().responseImage { response in
//            if let image = response.result.value {
//                cell.imageView?.image = image
//            }
//        }
        
//        cell.titleLabel.text = game.Title
//        cell.releaseDataLabel.text = game.ReleaseDate
//        cell.descriptionLabel.text = game.ShortDescription
//        cell.previewImageView.image = game.Image
        
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
