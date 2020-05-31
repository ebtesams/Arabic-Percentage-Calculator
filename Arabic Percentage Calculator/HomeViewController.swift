//
//  ViewController.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 07/05/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit
import GoogleMobileAds
import MessageUI

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , GADInterstitialDelegate , MFMailComposeViewControllerDelegate {
    //Create an interstitial ad object
  var interstitial: GADInterstitial!
    
    let transiton = SlideInTransition()
    var topView: UIView?
   
    var equation = Array<Percentages>()
    
    @IBOutlet weak var tabView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return equation.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     let headerView = UIView()
    headerView.backgroundColor = UIColor.clear
    return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell:MyTableViewCell = tabView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
        Cell.labName.text = equation[indexPath.section].name
        Cell.labEquation.text = equation[indexPath.section].equation
        Cell.layer.cornerRadius = 15  
      return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
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
//        //Show the ad
//        if interstitial.isReady {
//            interstitial.present(fromRootViewController: self)
//        }
    }
 
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
     present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {

        topView?.removeFromSuperview()
        switch menuType {
        case .Home:
            dismiss(animated: true, completion: nil)
          
            
        case .aboutUs:
           performSegue(withIdentifier: "aboutUs", sender: nil)
        case .privacyPolicy:
            performSegue(withIdentifier: "privacyPolicy", sender: nil)
        case .shareApp :
            let firstActivityItem = " تطبيق الحسابات المئوية تطبيق يحتوي على معادلات تخص النسبة المئوية والتى تحتاجها باستمرار و في خطوات بسيطة جدا"
            let secondActivityItem : NSURL = NSURL(string: "itms-apps://itunes.apple.com/app/bars/id1456324528")!
            
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
            
        case .contact :
            
            if !MFMailComposeViewController.canSendMail() {
                print("Mail services are not available")
                return
            }
            sendEmail()
    
        default:
            break
        }
    }
    func sendEmail(){
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["sugnsup@outlook.com"])
        composeVC.setSubject("تطبيق الحسابات المئوية")
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController,didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load an ad
       interstitial = createAndLoadInterstitial()
        //to hide the default back swipe
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        equation.append(Percentages(name: "حساب القيمة المضافة ٥٪" , equation: "س + ((٠٫٠٥)س)"))
        equation.append(Percentages(name: "نسبة ٪ القيمة" , equation: "س(ص/١٠٠)"))
        equation.append(Percentages(name: "نسبة ٪ التغير" , equation: "((ص - س)/س)١٠٠"))
        equation.append(Percentages(name: "قيمة أ هي ب٪ من؟ ", equation: "(س*١٠٠)/ص"))
       equation.append(Percentages(name: "نسبة ٪ قيمة من قيمة" , equation: "س(ص/١٠٠)"))
        equation.append(Percentages(name: "الزيادة بنسبة ٪ " , equation: "س + ((ص/١٠٠)س)"))
        equation.append(Percentages(name: "النقصان بنسبة ٪ " , equation: "س - ((ص/١٠٠)س)"))
        equation.append(Percentages(name: "بعد الخصم ٪" , equation: "س /((١٠٠ - ص)/١٠٠)"))
        equation.append(Percentages(name: "بعد الاضافة ٪" , equation: "س /((١٠٠ + ص)/١٠٠)"))
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
  
             //Show the ad
                if interstitial.isReady {
                    interstitial.present(fromRootViewController: self)
                }
    }
    
    //Use GADInterstitialDelegate to reload
    func createAndLoadInterstitial() -> GADInterstitial {
        // test adUnitID: "ca-app-pub-3940256099942544/4411468910"
        // "ca-app-pub-3322987272798341/4629019074"
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3322987272798341/4629019074")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }

}


extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}


