//
//  CalculatorModel.swift
//  tipCalculator
//
//  Created by etudiant08 on 06/03/2017.
//  Copyright © 2017 etudiant08. All rights reserved.
//

import Foundation

struct CalculatorModel{
    var checkAmount = 0.0
    
    var serviceLevel = 0
    
    let tipRates = [0.1,0.15,0.2]
    
    let tipLabel = ["Fair","Good","Excellent"]
    
    var computedTip: Double{
        return checkAmount * tipRates[serviceLevel]
    }
    
    var serviceLabelText: String {
        return tipLabel[serviceLevel]
    }
}
