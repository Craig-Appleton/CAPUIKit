//
//  UITableViewExtensions.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 18/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

extension UITableView {
    
    func dequeueCell<CellType: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> CellType {
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CellType else {
            fatalError("no cell registered for identifier: \(identifier)")
        }
        
        return cell
    }
    
    func dequeueOrCreateCell(with reuseIdentifier: String, for style: UITableViewCell.CellStyle) -> UITableViewCell {
        
        return self.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: style, reuseIdentifier: reuseIdentifier)
    }
}
