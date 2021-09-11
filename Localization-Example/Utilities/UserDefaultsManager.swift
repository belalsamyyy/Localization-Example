//
//  UserDefaultsManager.swift
//  Localization-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation

var Defaults = UserDefaultsManager.shared

struct UserDefaultsManager {
    
    //MARK: - singleton manager
    static var shared = UserDefaultsManager()
    private init() {}
    let def = UserDefaults.standard
    
    //MARK: - computed properties
    
    // computed propery for language
    var language: String {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.language)
        } get {
            guard def.object(forKey: UserDefaultsKeys.language) != nil else {
                return "language not specified"
            }
            return def.object(forKey: UserDefaultsKeys.language) as! String
        }
    }

}
