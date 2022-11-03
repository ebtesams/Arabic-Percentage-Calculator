//
//  TableViewCell.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 07/05/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit

class EquationsCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labEquation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = view.layer.frame.height/3
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.20
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.masksToBounds = false
    }
   
}
