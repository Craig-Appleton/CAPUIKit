//
//  UINavigationItemExtensions.swift
//  Demo
//
//  Created by Craig Appleton on 08/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import UIKit

extension UINavigationItem: XIBLocalizableProtocol {
    
    // MARK: - XIBLocalizableProtocol Variable Declarations
    
    @IBInspectable public var localizationKey: String? {
        
        set {
            
            title = newValue?.localized
        }
        
        get {
            
            return nil
        }
    }
}
