//
//  RoundedButton.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam Alahmari on 08/10/2022.
//  Copyright © 2022 Ebtesam. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = self.layer.frame.size.height/2
        self.layer.cornerRadius = radius
    }
}
