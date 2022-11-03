//
//  ViewController1.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 08/05/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController1: UIViewController  {
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var number1Txt: UITextField!
    @IBOutlet weak var number2Txt: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    
    var alertLabel = AlertLabel()
    
    override func viewDidLoad() {
        LeftToRigh()
        unitAdID(BannerView: bannerView)
        number1Txt.delegate = self
        number2Txt.delegate = self
        number2Txt.roundedView()
        resultLbl.roundedView()
        resultLbl.clipsToBounds = true
        view.addSubview(alertLabel)
        alertLabel.lableConstraint(textField: number2Txt)
    }
    
    @IBAction func output(_ sender: UIButton) {
        if number1Txt.text?.isEmpty == false  && number2Txt.text?.isEmpty == false {
            if  !number1Txt.text!.isNumber || !number2Txt.text!.isNumber {
                alertLabel.isHidden = false
                resultLbl.text = ""
            }else {
                resultLbl.text = String(Functions.Equation(equationNumber: 1 , num1: number1Txt.text! ,num2: number2Txt.text!))
            }
        }
        else
        {
            alertLabel.isHidden = false
            resultLbl.text = ""
            
        }
    }
    
}


//MARK: -UITextFieldDelegate
extension ViewController1: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        alertLabel.isHidden = true
    }
}


