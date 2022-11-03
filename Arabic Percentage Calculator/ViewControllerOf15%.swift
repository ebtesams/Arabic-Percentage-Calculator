//
//  ViewControllerOf15%.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 12/10/1441 AH.
//  Copyright © 1441 Ebtesam. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewControllerOf15_: UIViewController {

    let numberFormatter = NumberFormatter()

    @IBOutlet weak var viewOffset: UIView!

    @IBOutlet weak var bannerView: GADBannerView!

    @IBOutlet weak var valueWithoutTax: UITextField!
    @IBOutlet weak var totalValueWith15: UILabel!
    @IBOutlet weak var totalTax15: UILabel!

    @IBOutlet weak var totalValueWith5: UILabel!
    @IBOutlet weak var totalTax5: UILabel!

    @IBOutlet weak var valueWithTax: UITextField!
    @IBOutlet weak var Tax15: UILabel!
    @IBOutlet weak var valueWithout15: UILabel!

    @IBOutlet weak var Tax5: UILabel!
    @IBOutlet weak var valueWithout5: UILabel!

    @IBOutlet weak var extraDiffNet: UILabel!
    @IBOutlet weak var extraDiffTot: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        LeftToRigh()
       // unitAdID(BannerView: bannerView)

        viewOffset.layer.shadowOffset = CGSize(width:1, height: 1)
        viewOffset.layer.masksToBounds = false

    }

    @IBAction func calculatTotal(_ sender: Any) {
        if valueWithoutTax.text != "" {
            // 15%
            let totTax15 = 0.15 * numFormatter(num: valueWithoutTax.text!)
            numberFormatter.minimumFractionDigits = 2
            totalTax15.text = numberFormatter.string(from: NSNumber(value: totTax15))!
            var result = Functions.Equation(equationNumber: 5 , num1: valueWithoutTax.text!, num2: "15")
            totalValueWith15.text = numberFormatter.string(from: NSNumber(value: result ))!

            // 5%
            let totTax5 = 0.05 * numFormatter(num: valueWithoutTax.text!)
            numberFormatter.minimumFractionDigits = 2
            totalTax5.text = numberFormatter.string(from: NSNumber(value: totTax5))!
            var result2 = Functions.Equation(equationNumber: 5 , num1: valueWithoutTax.text!, num2: "5")
            totalValueWith5.text = numberFormatter.string(from: NSNumber(value: result2 ))!

            //
            let diffNum = totTax15 - totTax5
            extraDiffNet.text = numberFormatter.string(from: NSNumber(value: diffNum))!
        }
    }

    @IBAction func extractValue(_ sender: Any) {
        if valueWithTax.text != "" {
            // 15%
            numberFormatter.minimumFractionDigits = 2
            let tax15 = (15 * numFormatter(num: valueWithTax.text!))/115
            Tax15.text = numberFormatter.string(from: NSNumber(value: tax15))!
            var result = Functions.Equation(equationNumber: 8 , num1: valueWithTax.text!, num2: "15")
            valueWithout15.text = numberFormatter.string(from: NSNumber(value: result))!

            // 5%
            numberFormatter.minimumFractionDigits = 2
            let tax5 = (5 * numFormatter(num: valueWithTax.text!))/105
            Tax5.text = numberFormatter.string(from: NSNumber(value: tax5))!
            var result2 = Functions.Equation(equationNumber: 8 , num1: valueWithTax.text!, num2: "5")
            valueWithout5.text = numberFormatter.string(from: NSNumber(value: result2))!

            //
            let diffNum = tax15 - tax5
            extraDiffTot.text = numberFormatter.string(from: NSNumber(value: diffNum))!
        }
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


