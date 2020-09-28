//
//  TableViewRow.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import Foundation

public final class TableViewRow: TableViewRowProtocol {
    
    public enum Style {
        
        case `default`
        case subtitle
        case value1
        case value2
        case `switch`
    }
    
    public typealias CellSwitchControlHandler = (_ switchControl: UISwitch, _ tableView: UITableView, _ indexPath: IndexPath) -> Void
    
    // MARK: - Variable Declarations
    
    private static let defaultCellReuseIdentifier = "DefaultCellReuseIdentifier"
    private static let identifiers = [Style.default : defaultCellReuseIdentifier,
                                      Style.subtitle : "SubtitleCellReuseIdentifier",
                                      Style.value1 : "Value1CellReuseIdentifier",
                                      Style.value2 : "Value2CellReuseIdentifier",
                                      Style.switch : SwitchTableViewCell.reuseIdentifier]
    
    private let defaultCellForRowHandler: CellForRowHandler = { tableView, indexPath in
        
        
        
        return UITableViewCell()
    }
    
    public var style: Style
    public var textLabelText: String?
    public var detailTextLabelText: String?
    public var accessoryType: UITableViewCell.AccessoryType = .none
    public var editingAccessoryType: UITableViewCell.AccessoryType = .none
    
    
    // MARK: - TableViewRowProtocol Variable Declarations
    
    public lazy var cellForRowHandler: CellForRowHandler = { tableView, indexPath in
        return self.cellForRow(tableView: tableView, at: indexPath)
    }
    public var cellHighlightHandler: CellHighlightHandler?
    public var cellSelectionHandler: CellSelectionHandler?
    public var cellAccessoryViewHandler: CellAccessoryViewHandler?
    public var cellSwitchControlConfigurationHandler: (() -> Bool)?
    public var cellSwitchControlHandler: CellSwitchControlHandler?
    
    
    // MARK: - Life Cycle Methods
    
    public init(style: Style = .default, textLabelText: String? = nil, detailTextLabelText: String? = nil, accessoryType: UITableViewCell.AccessoryType = .none, editingAccessoryType: UITableViewCell.AccessoryType = .none, cellSelectionHandler: CellSelectionHandler? = nil) {
        
        self.style = style
        self.textLabelText = textLabelText
        self.detailTextLabelText = detailTextLabelText
        self.accessoryType = accessoryType
        self.editingAccessoryType = editingAccessoryType
        self.cellSelectionHandler = cellSelectionHandler
    }
    
    
    // MARK: - Helper Methods
    
    private func cellForRow(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = TableViewRow.identifiers[style] ?? TableViewRow.defaultCellReuseIdentifier
        
        switch style {
            
        case .default, .subtitle, .value1, .value2:
            
            guard let cellStyle = tableViewCellStyle(for: style) else {
                fatalError()
            }
            
            let cell = tableView.dequeueOrCreateCell(with: identifier, for: cellStyle)
            cell.textLabel?.text = textLabelText
            cell.detailTextLabel?.text = detailTextLabelText
            cell.accessoryType = accessoryType
            cell.editingAccessoryType = editingAccessoryType
            
            return cell
            
        case .switch:
            
            let cell: SwitchTableViewCell = tableView.dequeueCell(withIdentifier: SwitchTableViewCell.reuseIdentifier, for: indexPath)
            cell.textLabel?.text = textLabelText
            cell.switchControl.isOn = cellSwitchControlConfigurationHandler?() ?? false
            cell.switchToggledHandler = { (switchControl) in
                
                self.cellSwitchControlHandler?(switchControl, tableView, indexPath)
            }
            
            return cell
        }
    }
    
    private func tableViewCellStyle(for style: Style) -> UITableViewCell.CellStyle? {
        
        switch style {
            
        case .default:
            return .default
            
        case .subtitle:
            return .subtitle
            
        case .value1:
            return .value1
            
        case .value2:
            return .value2
            
        default:
            return nil
        }
    }
}
