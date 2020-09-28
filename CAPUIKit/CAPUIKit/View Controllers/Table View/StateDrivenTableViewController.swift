//
//  StateDrivenTableViewController.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 11/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import UIKit

open class StateDrivenTableViewController<TableViewDataType: TableViewDataProtocol>: UITableViewController {
    
    public enum State {
        
        case loading
        case loaded(_ tableViewData: TableViewDataType)
        case empty
        case error(_ error: Error)
    }
    
    public typealias TableViewDataLoadHandler = ((_ viewController: StateDrivenTableViewController<TableViewDataType>) -> (tableViewData: TableViewDataType?, error: Error?))
    
    // MARK: - Variable Declarations
    
    public var state: State = .empty {
        didSet { handleStateChanged(newState: state, oldState: oldValue) }
    }
    public var tableViewDataLoadHandler: TableViewDataLoadHandler?
    
    
    // MARK: - View Appearance Methods
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch state {
            
        case .empty, .error(_):
            loadTableViewData()
            
        default:
            break
        }
    }
    
    
    // MARK: - Helper Methods
    
    private func handleStateChanged(newState: State, oldState: State) {
        
        switch (newState, oldState) {
            
        default:
            self.tableView.reloadData()
        }
    }
    
    private func loadTableViewData() {
        
        guard let tableViewDataLoadHandler = self.tableViewDataLoadHandler else {
            
            return
        }
        
        self.state = .loading
        
        DispatchQueue.global().async {
            
            let result = tableViewDataLoadHandler(self)
            
            DispatchQueue.main.async {
                
                if let error = result.error {
                    
                    self.state = .error(error)
                }
                else if let tableViewData = result.tableViewData {
                    
                    tableViewData.registerTableViewCells(for: self.tableView)
                    
                    self.state = .loaded(tableViewData)
                }
                else {
                    
                    self.state = .empty
                }
            }
        }
    }
    
    
    // MARK: - UITableViewDataSource Methods
    
    open override func numberOfSections(in tableView: UITableView) -> Int {
        
        switch state {
            
        case .loaded(let tableViewData):
            return tableViewData.numberOfSections()
            
        default:
            return 0
        }
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch state {
            
        case .loaded(let tableViewData):
            return tableViewData.numberOfRows(in: section)
            
        default:
            return 0
        }
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch state {
            
        case .loaded(let tableViewData):
            return tableViewData.cellForRow(tableView: tableView, indexPath: indexPath)
            
        default:
            fatalError("Attempting to return a cell in state: \(state)")
        }
    }
    
    open override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch state {
            
        case .loaded(let tableViewData):
            return tableViewData.sections[section].headerViewTitle
            
        default:
            return nil
        }
    }
    
    open override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        switch state {
            
        case .loaded(let tableViewData):
            return tableViewData.sections[section].footerViewTitle
            
        default:
            return nil
        }
    }
    
    
    // MARK: - UITableViewDelegate Methods
    
    open override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        switch state {
            
        case .loaded(let tableViewData):
            
            let row = tableViewData[indexPath]
            
            guard let cellHighlightHandler = row.cellHighlightHandler else {
                return row.cellSelectionHandler != nil
            }
            
            return cellHighlightHandler(tableView, indexPath)
            
        default:
            fatalError("Attempting to highlight cell in state: \(state)")
        }
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch state {
            
        case .loaded(let tableViewData):
            tableViewData[indexPath].cellSelectionHandler?(tableView, indexPath)
            
        default:
            fatalError("Attempting to select cell in state: \(state)")
        }
    }
    
    open override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        switch state {
            
        case .loaded(let tableViewData):
            tableViewData[indexPath].cellAccessoryViewHandler?(tableView, indexPath)
            
        default:
            fatalError("Attempting to select accessory view in state: \(state)")
        }
    }
}
