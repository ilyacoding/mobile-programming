//
//  LinkViewController.swift
//  GamesCatalog
//
//  Created by Ilya Kovalenko on 2/14/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import UIKit
import WebKit

class LinkViewController: UIViewController {

    @IBOutlet weak var gameWeb: WKWebView!
    
    var url : String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        gameWeb.load(URLRequest(url: URL(string: url!)!))
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
