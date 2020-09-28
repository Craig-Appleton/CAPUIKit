//
//  TableViewData.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

public final class TableViewData: TableViewDataProtocol {
    
    // MARK: - TableViewDataProtocol Variable Declarations
    
    public var sections: [TableViewSectionProtocol]
    
    
    // MARK: - Life Cycle Methods
    
    public init(sections: [TableViewSectionProtocol] = []) {
        
        self.sections = sections
    }
    
    
    // MARK: - TableViewDataProtocol Methods
    
    public func registerTableViewCells(for tableView: UITableView) {
        
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.reuseIdentifier)
    }
    
    public func remove(at indexPath: IndexPath) {
        
        sections[indexPath.section].rows.remove(at: indexPath.row)
    }
    
    public func insert(_ row: TableViewRowProtocol, at indexPath: IndexPath) {
        
        sections[indexPath.section].rows.insert(row, at: indexPath.row)
    }
}
