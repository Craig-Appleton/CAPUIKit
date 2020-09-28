//
//  UISwitchExtensions.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 25/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

extension UISwitch {
    
    public convenience init(target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        
        self.init()
        
        addTarget(target, action: action, for: controlEvents)
    }
}
