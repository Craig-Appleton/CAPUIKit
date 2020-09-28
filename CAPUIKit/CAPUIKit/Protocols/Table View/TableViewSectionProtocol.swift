//
//  TableViewSectionProtocol.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

public protocol TableViewSectionProtocol {
    
    var headerViewTitle: String? { set get }
    var footerViewTitle: String? { set get }
    var rows: [TableViewRowProtocol] { set get }
}
