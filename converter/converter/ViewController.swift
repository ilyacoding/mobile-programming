//
//  ViewController.swift
//  converter
//
//  Created by Ilya Kovalenko on 2/1/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dollarsTextInput: UITextField!
    @IBOutlet weak var rublesTextInput: UITextField!
    @IBOutlet weak var eurosTextInput: UITextField!
    @IBOutlet weak var poundsTextInput: UITextField!
    
    let dollarsRate = 1.0;
    let rublesRate = 1.9;
    let eurosRate = 0.9;
    let poundsRate = 0.8;
    
    enum UpdateField { case Dollars, Rubles, Euros, Pounds }
    
    @IBAction func textInputChanged(_ sender: Any) {
        var dollars : Double?;
        if (dollarsTextInput.text!.isEmpty)
        {
            return;
        }
        
        dollars = convertToDouble(dollarsTextInput.text!);
        
        if (dollars != nil)
        {
            updateCurrencyInputs(dollars!, [UpdateField.Rubles, UpdateField.Euros, UpdateField.Pounds]);
        }
        else {
            showInputErrorAlert();
        }
    }
    
    @IBAction func rublesInputChanged(_ sender: Any) {
        let textInput = sender as! UITextField;
        var rubles : Double?;
        if (textInput.text!.isEmpty)
        {
            return;
        }
        
        rubles = convertToDouble(textInput.text!);
        
        if (rubles != nil)
        {
            let dollars = Converter(numerator: rubles!).convertToGeneric(rublesRate);
            updateCurrencyInputs(dollars, [UpdateField.Dollars, UpdateField.Euros, UpdateField.Pounds]);
        } else {
            showInputErrorAlert();
        }
    }
    
    @IBAction func eurosInputChanged(_ sender: Any) {
        let textInput = sender as! UITextField;
        var euros : Double?;
        if (textInput.text!.isEmpty)
        {
            return;
        }
        
        euros = convertToDouble(textInput.text!);
        
        if (euros != nil)
        {
            let dollars = Converter(numerator: euros!).convertToGeneric(eurosRate);
            updateCurrencyInputs(dollars, [UpdateField.Dollars, UpdateField.Rubles, UpdateField.Pounds]);
        } else {
            showInputErrorAlert();
        }
    }
    
    @IBAction func poundsInputChanged(_ sender: Any) {
        let textInput = sender as! UITextField;
        var pounds : Double?;
        if (textInput.text!.isEmpty)
        {
            return;
        }
        
        pounds = convertToDouble(textInput.text!);
        
        if (pounds != nil)
        {
            let dollars = Converter(numerator: pounds!).convertToGeneric(poundsRate);
            updateCurrencyInputs(dollars, [UpdateField.Dollars, UpdateField.Euros, UpdateField.Rubles]);
        } else {
            showInputErrorAlert();
        }
    }
    
    func updateCurrencyInputs(_ dollars: Double, _ fields: Set<UpdateField>) {
        let converter : Converter = Converter(numerator: dollars);
        if (fields.contains(UpdateField.Dollars)) {
            dollarsTextInput.text = String(converter.convert(dollarsRate));
        }
        if (fields.contains(UpdateField.Rubles)) {
            rublesTextInput.text = String(converter.convert(rublesRate));
        }
        if (fields.contains(UpdateField.Euros)) {
            eurosTextInput.text = String(converter.convert(eurosRate));
        }
        if (fields.contains(UpdateField.Pounds)) {
            poundsTextInput.text = String(converter.convert(poundsRate));
        }
    }
    
    func convertToDouble(_ value : String) -> Double?
    {
        let formatter : NumberFormatter = NumberFormatter();
        return formatter.number(from: value)?.doubleValue;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showInputErrorAlert() {
        showAlert(title: "Try again!", message: "Invalid input");
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

