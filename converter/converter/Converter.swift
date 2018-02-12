//
//  Converter.swift
//  converter
//
//  Created by Ilya Kovalenko on 2/2/18.
//  Copyright © 2018 Илья Коваленко. All rights reserved.
//

import Foundation

class Converter {
    var numerator : Double;
    
    init(numerator: Double){
        self.numerator = numerator;
    }
    
    func convert(_ denominator: Double) -> Double
    {
        return numerator * denominator;
    }
    
    func convertToGeneric(_ denominator: Double) -> Double
    {
        if (denominator > 0) {
            return numerator / denominator;
        }
        else {
            return 0;
        }
    }
}
