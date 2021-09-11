//
//  String+Extensions.swift
//  Localization-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
