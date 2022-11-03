//
//  ViewController.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 07/05/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import GoogleMobileAds
import UIKit
import MessageUI

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //Create an interstitial ad object
    private var interstitial: GADInterstitialAd?
    
    var equations = [
        Percentages(name: "حساب القيمة المضافة ١٥٪" , equation: "س + ((٠٫١٥)س)"),
        Percentages(name: "نسبة ٪ القيمة" , equation: "س(ص/١٠٠)"),
        Percentages(name: "نسبة ٪ التغير" , equation: "((ص - س)/س)١٠٠"),
        Percentages(name: "قيمة أ هي ب٪ من؟ ", equation: "(س*١٠٠)/ص"),
        Percentages(name: "نسبة ٪ قيمة من قيمة" , equation: "س(ص/١٠٠)"),
        Percentages(name: "الزيادة بنسبة ٪ " , equation: "س + ((ص/١٠٠)س)"),
        Percentages(name: "النقصان بنسبة ٪ " , equation: "س - ((ص/١٠٠)س)"),
        Percentages(name: "بعد الخصم ٪" , equation: "س /((١٠٠ - ص)/١٠٠)"),
        Percentages(name: "بعد الاضافة ٪" , equation: "س /((١٠٠ + ص)/١٠٠)")
    ]
    var counterAd = 0
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //Load an ad
        loadInterstitial()
        //to hide the default back swipe
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        counterAd = defaults.integer(forKey: "counterAd")
    }
}

// MARK: -UITableViewDataSource

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        equations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell:EquationsCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EquationsCell
        Cell.labName.text = equations[indexPath.row].name
        Cell.labEquation.text = equations[indexPath.row].equation
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

// MARK: -UITableViewDelegate

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "s0", sender: nil)
        case 1:
            performSegue(withIdentifier: "s1", sender: nil)
        case 2:
            performSegue(withIdentifier: "s2", sender: nil)
        case 3:
            performSegue(withIdentifier: "s3", sender: nil)
        case 4:
            performSegue(withIdentifier: "s4", sender: nil)
        case 5:
            performSegue(withIdentifier: "s5", sender: nil)
        case 6:
            performSegue(withIdentifier: "s6", sender: nil)
        case 7:
            performSegue(withIdentifier: "s7", sender: nil)
        default:
            performSegue(withIdentifier: "s8", sender: nil)
        }
        
        if counterAd == 7 {
            //Show the ad
            if interstitial != nil {
                loadInterstitial()
                interstitial!.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            counterAd = 0
            defaults.set(counterAd, forKey: "counterAd")
        }
        counterAd += 1
        defaults.set(counterAd, forKey: "counterAd")
    }
    
}


// MARK: -GADInterstitialDelegate

extension HomeViewController : GADFullScreenContentDelegate {
    
    func loadInterstitial() {
        // test "ca-app-pub-3940256099942544/4411468910"
       
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3322987272798341/4357932548" ,
                               request: request)
        { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
    }
    
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        //loadInterstitial()
    }
    
}

