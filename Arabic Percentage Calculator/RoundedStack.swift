//
//  RoundedStack.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam Alahmari on 09/10/2022.
//  Copyright © 2022 Ebtesam. All rights reserved.
//

import UIKit

class RoundedStack: UIStackView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = self.layer.frame.size.height/3
        self.layer.cornerRadius = radius
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.20
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.masksToBounds = false
    }
}
