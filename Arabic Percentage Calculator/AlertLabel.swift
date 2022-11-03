//
//  AlertLabel.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam Alahmari on 24/10/2022.
//  Copyright © 2022 Ebtesam. All rights reserved.
//

import UIKit

class AlertLabel: UILabel {
    
    override func layoutSubviews() {
        super .layoutSubviews()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text =  "يوجد خطأ الرجاء التأكد من المدخلات"
        self.font = UIFont.systemFont(ofSize: 12)
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .right
        self.textColor = .red
        self.isHidden = true
    }

    func lableConstraint(textField: UITextField ) {
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: textField.trailingAnchor,constant: 0),
            self.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 0),
            self.heightAnchor.constraint(equalToConstant:  25)
        ])
    }
    
}
