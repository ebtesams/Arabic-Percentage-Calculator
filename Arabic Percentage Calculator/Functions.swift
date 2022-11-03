//
//  Functions.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 03/08/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//


import Foundation
import  UIKit

class Functions {
   
    static var output : Double?
    
    static func Equation (equationNumber: Int , num1 : String , num2 :String) -> (Double) {
        let formatterAR: NumberFormatter = NumberFormatter()
        let formatterEN: NumberFormatter = NumberFormatter()
        
        formatterAR.locale = Locale(identifier: "AR")
        formatterEN.locale = Locale(identifier: "EN")
        
        var doubleNumber1:Double?
        var doubleNumber2:Double?
        
        if let formatterNum1 = formatterAR.number(from: num1) {
            doubleNumber1 = Double(truncating: formatterNum1)
        }
        else if let formatterNum1 = formatterEN.number(from: num1) {
            doubleNumber1 = Double(truncating: formatterNum1)
        }
        
        if let formatterNum2 = formatterAR.number(from: num2) {
            doubleNumber2 = Double(truncating: formatterNum2)
        }
        else if let formatterNum2 = formatterEN.number(from: num2) {
            doubleNumber2 = Double(truncating: formatterNum2)
        }
        
        if let doubleNumber1 = doubleNumber1 , let doubleNumber2 = doubleNumber2 {
            switch equationNumber {
                case 1 :
                output = (doubleNumber2/100) * doubleNumber1
                case 2 :
                output = ((doubleNumber2-doubleNumber1)/doubleNumber1)*100
                case 3 :
                output = (doubleNumber1*100) / doubleNumber2
                case 4 :
                 output = (doubleNumber1 / doubleNumber2)*100
                case 5 :
                output = doubleNumber1 + ((doubleNumber2/100) * doubleNumber1)
                case 6 :
                output = doubleNumber1 - ((doubleNumber2/100) * doubleNumber1)
                case 7 :
                output = doubleNumber1 / ((100 - doubleNumber2) / 100)
                case 8 :
                output = doubleNumber1 / ((100 + doubleNumber2) / 100)
                default:
                print("error")
                output = 0
            }
        }
       return output ?? 0
    }
}

