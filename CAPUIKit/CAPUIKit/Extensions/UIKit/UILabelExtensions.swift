//
//  UILabelExtensions.swift
//  Demo
//
//  Created by Craig Appleton on 08/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import UIKit

extension UILabel: XIBLocalizableProtocol {
    
    // MARK: - XIBLocalizableProtocol Variable Declarations
    
    @IBInspectable public var localizationKey: String? {
        
        set {
            
            text = newValue?.localized
        }
        
        get {
            
            return nil
        }
    }
}
