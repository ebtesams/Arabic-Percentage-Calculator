//
//  ViewController0.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 04/08/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController0: UIViewController {
    
    let numberFormatter = NumberFormatter()
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var valueWithoutTax: UITextField!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var totalTax: UILabel!
    
    
    @IBOutlet weak var valueWithTax: UITextField!
    @IBOutlet weak var Tax: UILabel!
    @IBOutlet weak var value: UILabel!
    
    
    @IBAction func calculatTotal(_ sender: Any) {
        if valueWithoutTax.text != "" {
            let totTax = 0.05 * numFormatter(num: valueWithoutTax.text!)
            numberFormatter.minimumFractionDigits = 2
            totalTax.text = numberFormatter.string(from: NSNumber(value: totTax))!
            var result = Functions.Equation(equationNumber: 5 , num1: valueWithoutTax.text!, num2: "5")
            totalValue.text = numberFormatter.string(from: NSNumber(value: result ))!  //String(Functions.Equation(equationNumber: 5 , num1: Double(valueWithoutTax.text!)!, num2: 5))
            //numberFormatter.string(from: NSNumber(value: Functions.Equation(equationNumber: 5 , num1: Double(valueWithoutTax.text!)!, num2: 5)))!
        }
    }
    
    @IBAction func extractValue(_ sender: Any) {
        if valueWithTax.text != "" {
            numberFormatter.minimumFractionDigits = 2
            let tax = 0.05 * numFormatter(num: valueWithTax.text!)
            Tax.text = numberFormatter.string(from: NSNumber(value: tax))!
             var result = Functions.Equation(equationNumber: 8 , num1: valueWithTax.text!, num2: "5")
            value.text = numberFormatter.string(from: NSNumber(value: result))!  //String(Functions.Equation(equationNumber: 8 , num1: Double(valueWithTax.text!)!, num2: 5))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         LeftToRigh()
        //test ID
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //unitAd ID
        bannerView.adUnitID = "ca-app-pub-3322987272798341/8801395850"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func numFormatter (num:String)->Double{
        let formatterAR: NumberFormatter = NumberFormatter()
        let formatterEN: NumberFormatter = NumberFormatter()
        formatterAR.locale = Locale(identifier: "AR")
        formatterEN.locale = Locale(identifier: "EN")
        let doubleNumber:Double!
        if let final = formatterAR.number(from: num) {
            doubleNumber = Double(final)
        }
        else{
            let final = formatterEN.number(from: num)
            doubleNumber = Double(final!)
        }
       return doubleNumber
    }

}
