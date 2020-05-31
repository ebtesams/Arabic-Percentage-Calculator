//
//  infoViewController.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 05/06/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case Home
    case aboutUs
    case shareApp
    case contact
    case privacyPolicy
}
class MenuViewController: UITableViewController {
    
        var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
  
    }
        
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     guard let menuType = MenuType(rawValue: indexPath.row) else { return }
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)
            }
        }
}
