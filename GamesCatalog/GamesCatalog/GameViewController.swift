//
//  ViewController.swift
//  GamesCatalog
//
//  Created by Ilya Kovalenko on 2/12/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameReleaseDate: UILabel!
    @IBOutlet weak var gameDescription: UITextView!
    @IBOutlet weak var openUrlButton: UIButton!
    
    var game : Game? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGameAttributes()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpGameAttributes() {
        gameImage.image = game!.FullImage
        gameTitle.text = game!.Title
        gameReleaseDate.text = "Release date: " + game!.ReleaseDate
        gameDescription.text = game!.FullDescription
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fromFullDescriptionToWeb") {
            let destVC = segue.destination as! LinkViewController;
            destVC.url = game!.Url
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
