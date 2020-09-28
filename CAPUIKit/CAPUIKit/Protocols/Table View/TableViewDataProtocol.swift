//
//  TableViewDataProtocol.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

public protocol TableViewDataProtocol {
    
    var sections: [TableViewSectionProtocol] { get }
    
    func registerTableViewCells(for tableView: UITableView)
    
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func cellForRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
    subscript (indexPath: IndexPath) -> TableViewRowProtocol { get }
    
    func remove(at indexPath: IndexPath)
    func insert(_ row: TableViewRowProtocol, at indexPath: IndexPath)
}

extension TableViewDataProtocol {
    
    public func numberOfSections() -> Int {
        
        return sections.count
    }
    
    public func numberOfRows(in section: Int) -> Int {
        
        return sections[section].rows.count
    }
    
    public func cellForRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        return self[indexPath].cellForRowHandler(tableView, indexPath)
    }
    
    public subscript (indexPath: IndexPath) -> TableViewRowProtocol {
        
        return sections[indexPath.section].rows[indexPath.row]
    }
}
