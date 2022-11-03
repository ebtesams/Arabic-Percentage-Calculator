//
//  SettingVC.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam Alahmari on 07/10/2022.
//  Copyright © 2022 Ebtesam. All rights reserved.
//

import UIKit
import MessageUI

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   

    @IBOutlet weak var tableView: UITableView!
    
    let settingArray = [["عن التطبيق","info.circle"],["مشاركة التطبيق","square.and.arrow.up"],["راسلنا","envelope"],["سياسة الخصوصية","lock.shield"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        tableView.clipsToBounds = true
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingArray.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! SettingCell
        cell.titleLbl.text = settingArray[indexPath.row].first
        cell.icon.image = UIImage(systemName: settingArray[indexPath.row].last ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row
        {
        case 0:
            performSegue(withIdentifier: "aboutUs", sender: nil)
        case 1 :
            let firstActivityItem = " تطبيق الحسابات المئوية تطبيق يحتوي على معادلات تخص النسبة المئوية والتى تحتاجها باستمرار و في خطوات بسيطة جدا"
            let secondActivityItem : NSURL = NSURL(string: "itms-apps://itunes.apple.com/app/bars/id1456324528")!
            
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
            
        case 2:
            if !MFMailComposeViewController.canSendMail() {
                print("Mail services are not available")
                return
            }
            sendEmail()
        case 3:
            performSegue(withIdentifier: "privacyPolicy", sender: nil)
        default:
            print("nothing")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

}

//MARK: -MFMailComposeViewControllerDelegate
extension SettingVC: MFMailComposeViewControllerDelegate {
    func sendEmail(){
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["customer.supnsug@outlook.com"])
        composeVC.setSubject("تطبيق الحسابات المئوية")
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController,didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
