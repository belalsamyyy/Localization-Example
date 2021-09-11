//
//  Localizer.swift
//  Localization-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation
import UIKit

//MARK: - Localizer

class Localizer {
    
    static func doTheExchange() {
        ExchangeMethodsForClass(className: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.customlocalizedString(forKey:value:table:)))
        
        ExchangeMethodsForClass(className: UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), overrideSelector: #selector(getter: UIApplication.changeDirection))
    }
}

//MARK: - custom localized String

extension Bundle {
    
    @objc func customlocalizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        
        let currentLanguage = Language.currentLanguage
        var bundle = Bundle()
        
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: path)!
        }else{
            let path = Bundle.main.path(forResource: "Base", ofType: "lproj")
            bundle = Bundle(path: path!)!
        }
        
        return bundle.customlocalizedString(forKey: key, value: value, table: tableName)
    }
}


//MARK: - Exchange

extension UIApplication {
    
    @objc var changeDirection: UIUserInterfaceLayoutDirection {
        get{
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            if Language.currentLanguage == Lang.arabic.rawValue {
                direction = .rightToLeft
            }
            return direction
        }
    }
}

func ExchangeMethodsForClass(className: AnyClass, originalSelector: Selector, overrideSelector: Selector){
    
    let originalMethod : Method = class_getInstanceMethod(className, originalSelector)!
    let overrideMethod : Method = class_getInstanceMethod(className, overrideSelector)!
    
    if class_addMethod(className, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
        
        class_replaceMethod(className, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    }else{
        method_exchangeImplementations(originalMethod, overrideMethod)
    }
}

