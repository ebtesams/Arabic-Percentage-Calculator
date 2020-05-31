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
        let doubleNumber1:Double!
        let doubleNumber2:Double!
        if let final1 = formatterAR.number(from: num1) {
            doubleNumber1 = Double(final1)
        }
        else{
            let final1 = formatterEN.number(from: num1)
            doubleNumber1 = Double(final1!)
        }
        
        if let final2 = formatterAR.number(from: num2) {
            doubleNumber2 = Double(final2)
        }
        else{
            let final2 = formatterEN.number(from: num2)
            doubleNumber2 = Double(final2!)
        }
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
            }
       return output!
    }
}
