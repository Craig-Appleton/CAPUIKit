//
//  TableViewRowProtocol.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

public protocol TableViewRowProtocol {
    
    typealias CellForRowHandler = (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell
    typealias CellHighlightHandler = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool
    typealias CellSelectionHandler = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void
    typealias CellAccessoryViewHandler = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void
    
    var cellForRowHandler: CellForRowHandler { get }
    var cellHighlightHandler: CellHighlightHandler? { get }
    var cellSelectionHandler: CellSelectionHandler? { get }
    var cellAccessoryViewHandler: CellAccessoryViewHandler? { get }
}
