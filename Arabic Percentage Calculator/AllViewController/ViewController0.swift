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
    
    var alertLabel = AlertLabel()
    var alertLabel2 = AlertLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LeftToRigh()
        unitAdID(BannerView: bannerView)
        valueWithoutTax.roundedView()
        totalValue.roundedView()
        totalValue.clipsToBounds = true
        totalTax.roundedView()
        totalTax.clipsToBounds = true
        valueWithTax.roundedView()
        Tax.roundedView()
        Tax.clipsToBounds = true
        value.roundedView()
        value.clipsToBounds = true
        valueWithTax.delegate = self
        valueWithoutTax.delegate = self
        view.addSubview(alertLabel)
        alertLabel.lableConstraint(textField: valueWithoutTax)
        view.addSubview(alertLabel2)
        alertLabel2.lableConstraint(textField: valueWithTax)
    }
    
    
    @IBAction func calculatTotal(_ sender: Any) {
        if valueWithoutTax.text?.isEmpty == false  {
            if  !valueWithoutTax.text!.isNumber {
                alertLabel.isHidden = false
                totalTax.text = ""
                totalValue.text = ""
                
            }else {
                let totTax = 0.15 * numFormatter(num: valueWithoutTax.text!)
                totalTax.text = String(format: "%.2f", totTax)
                let result = Functions.Equation(equationNumber: 5 , num1: valueWithoutTax.text!, num2: "15")
                totalValue.text = String(format: "%.2f", result )
                
            }
        }
        else
        {
            alertLabel.isHidden = false
            totalTax.text = ""
            totalValue.text = ""
        }
        
    }
    
    @IBAction func extractValue(_ sender: Any) {
        if valueWithTax.text?.isEmpty == false  {
            if  !valueWithTax.text!.isNumber {
                alertLabel2.isHidden = false
                Tax.text = ""
                value.text = ""
                
            }else {
                let tax = (15 * numFormatter(num: valueWithTax.text!))/115
                Tax.text = String(format: "%.2f", tax)
                let result = Functions.Equation(equationNumber: 8 , num1: valueWithTax.text!, num2: "15")
                value.text = String(format: "%.2f", result)
            }
        }
        else
        {
            alertLabel2.isHidden = false
            Tax.text = ""
            value.text = ""
        }
        
    }
    
    
    func numFormatter (num:String)->Double{
        let formatterAR: NumberFormatter = NumberFormatter()
        let formatterEN: NumberFormatter = NumberFormatter()
        formatterAR.locale = Locale(identifier: "AR")
        formatterEN.locale = Locale(identifier: "EN")
        var doubleNumber:Double?
        if let formatterNum = formatterAR.number(from: num) {
            doubleNumber = Double(truncating: formatterNum)
        }
        else if let formatterNum = formatterEN.number(from: num) {
            doubleNumber = Double(truncating: formatterNum)
        }
        return doubleNumber ?? 0
    }
    
}

//MARK: -UITextFieldDelegate
extension ViewController0: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        alertLabel.isHidden = true
        alertLabel2.isHidden = true
    }
}

