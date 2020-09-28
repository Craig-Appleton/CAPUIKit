//
//  StringExtensions.swift
//  Demo
//
//  Created by Craig Appleton on 08/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

extension String: LocalizableProtocol {
    
    // MARK: - LocalizableProtocol Variable Declarations
    
    public var localized: String {
        
        return NSLocalizedString(self, comment: "")
    }
}
