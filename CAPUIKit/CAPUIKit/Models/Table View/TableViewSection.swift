//
//  TableViewSection.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

public final class TableViewSection: TableViewSectionProtocol {
    
    // MARK: - TableViewSectionProtocol Variable Declarations
    
    public var headerViewTitle: String?
    public var footerViewTitle: String?
    public var rows: [TableViewRowProtocol]
    
    
    // MARK: - Life Cycle Methods
    
    public init(headerViewTitle: String? = nil, footerViewTitle: String? = nil, rows: [TableViewRowProtocol]) {
        
        self.headerViewTitle = headerViewTitle
        self.footerViewTitle = footerViewTitle
        self.rows = rows
    }
}
