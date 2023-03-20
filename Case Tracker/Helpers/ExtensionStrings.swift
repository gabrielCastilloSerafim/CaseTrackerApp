//
//  ExtensionStrings.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 20/3/23.
//

import Foundation


extension String {
    
    /// Apply this to the key value of the desired string in the localized strings file.
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
    
    /// Apply this to the key value of the desired string in the localized strings file, with an array containing the arguments that we want to insert in the base string.
    func localized(args: [CVarArg]) -> String {
        return String(format: localized, args)
    }
}
