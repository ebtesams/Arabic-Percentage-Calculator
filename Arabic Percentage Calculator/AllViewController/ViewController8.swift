//
//  ViewController8.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 08/05/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController8: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func output(_ sender: Any) {
        if number1.text != "" && number1.text != "" {
         result.text = String(Functions.Equation(equationNumber: 8 , num1: number1.text! ,num2: number2.text!))
        }
    }
    override func viewDidLoad() {
        LeftToRigh()
        //unitAd ID
        bannerView.adUnitID = "ca-app-pub-3322987272798341/8801395850"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
}
