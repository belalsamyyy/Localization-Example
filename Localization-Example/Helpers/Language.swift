//
//  Lanaguage.swift
//  Localization-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation

//MARK: - Language

enum Lang: String {
    case english = "en"
    case arabic = "ar"
}


struct Language {
    
    static var currentLanguage: String {
        return Defaults.language
    }
    
    static func setAppLanguage(lang: Lang) {
        Defaults.language = lang.rawValue
    }
    
}
