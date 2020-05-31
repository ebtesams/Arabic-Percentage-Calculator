//
//  customTextField.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 10/08/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit

class customTextField: UITextField {
    
//    public static func convertStringtoArabic(_ paramString: String) -> String {
//        var finalString: String = paramString
//        finalString = finalString.replacingOccurrences(of: "٠", with: "0")
//        finalString = finalString.replacingOccurrences(of: "١", with: "1")
//        finalString = finalString.replacingOccurrences(of: "٢", with: "2")
//        finalString = finalString.replacingOccurrences(of: "٣", with: "3")
//        finalString = finalString.replacingOccurrences(of: "٤", with: "4")
//        finalString = finalString.replacingOccurrences(of: "٥", with: "5")
//        finalString = finalString.replacingOccurrences(of: "٦", with: "6")
//        finalString = finalString.replacingOccurrences(of: "٧", with: "7")
//        finalString = finalString.replacingOccurrences(of: "٨", with: "8")
//        return finalString
//    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//        
//        var newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
//        
//        
//        newText = Preferences.convertStringtoArabic(newText)
//        
//        // You can use this new text
//        
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: string)
//        return allowedCharacters.isSuperset(of: characterSet)
//    }
    
    
    
    
    
    
    
    
    
    
    
    

//    let inputLocales = UITextInputMode.activeInputModes.compactMap {$0.primaryLanguage}.map(Locale.init(identifier:))
//    let localizations = Bundle.main.preferredLocalizations.map(Locale.init(identifier:))
//    let numberFormatter = NumberFormatter()
//
//    override func awakeFromNib() {
//
//    let locale = inputLocales.flatMap { l in localizations.map {(l, $0)}}
//        .filter { preferredLanguage, preferredLocalization in
//            if preferredLocalization.regionCode == nil || preferredLanguage.regionCode == nil {
//                return preferredLanguage.languageCode == preferredLocalization.languageCode
//            } else {
//                return preferredLanguage == preferredLocalization
//            }
//        }
//        .first?.0
//        ?? Locale.current
//    numberFormatter.locale = locale
//    }

}
