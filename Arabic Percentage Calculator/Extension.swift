//
//  Extension.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 03/08/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//


import UIKit
extension UIViewController {
    

    func LeftToRigh() {
        let left = UISwipeGestureRecognizer(target : self, action : #selector(leftSwipe))
        left.direction = .left
        self.view.addGestureRecognizer(left)
    }
    //leftSwipe
    @objc func leftSwipe(){
        navigationController?.popToRootViewController(animated: true)
    }
    //to hide keyboard
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
