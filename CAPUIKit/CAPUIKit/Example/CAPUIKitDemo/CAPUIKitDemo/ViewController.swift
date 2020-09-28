//
//  ViewController.swift
//  CAPUIKitDemo
//
//  Created by Craig Appleton on 19/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import UIKit

import CAPUIKit

final class ViewController: TableViewController {
    
    // MARK: - View Loading Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableViewDataLoadHandler = { (_) in
            
            return (self.createRootTableViewData(), nil)
        }
    }
    
    
    // MARK: - Helper Methods
    
    private func createRootTableViewData() -> TableViewData {
        
        let tableViewControllerRow = TableViewRow(style: .default,
                                                  textLabelText: "TableViewController Example",
                                                  accessoryType: .disclosureIndicator) { (_, _) in
                                                    self.showTableViewControllerExample()
        }
        
        let tableViewControllersSection = TableViewSection(rows: [tableViewControllerRow])
        
        return TableViewData(sections: [tableViewControllersSection])
    }
    
    
    // MARK: - TableViewController Example Helper Methods
    
    private func showTableViewControllerExample() {
        
        let viewController = TableViewController(style: .grouped)
        viewController.title = "TableViewController Example"
        viewController.tableViewDataLoadHandler = { (_) in
            
            return (self.createTableViewControllerExampleTableViewData(), nil)
        }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func createTableViewControllerExampleTableViewData() -> TableViewData {
        
        let section1Row1 = TableViewRow(style: .default,
                                        textLabelText: "Row 1") { (tableView, indexPath) in
                                            tableView.deselectRow(at: indexPath, animated: true)
        }
        let section1Row2 = TableViewRow(style: .subtitle,
                                        textLabelText: "Row 2",
                                        detailTextLabelText: "Row 2") { (tableView, indexPath) in
                                            tableView.deselectRow(at: indexPath, animated: true)
        }
        let section1Row3 = TableViewRow(style: .value1,
                                        textLabelText: "Row 3",
                                        detailTextLabelText: "Row 3") { (tableView, indexPath) in
                                            tableView.deselectRow(at: indexPath, animated: true)
        }
        let section1Row4 = TableViewRow(style: .value2,
                                        textLabelText: "Row 4",
                                        detailTextLabelText: "Row 4") { (tableView, indexPath) in
                                            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let section1 = TableViewSection(headerViewTitle: "Section 1 Header Title",
                                        footerViewTitle: "Section 1 Footer Title",
                                        rows: [section1Row1, section1Row2, section1Row3, section1Row4])
        
        let section2Row1 = TableViewRow(style: .switch, textLabelText: "Switch Row - On")
        section2Row1.cellSwitchControlConfigurationHandler = {
            return true
        }
        section2Row1.cellSwitchControlHandler = { (_, _, _) in
            // Do some work
        }
        
        let section2Row2 = TableViewRow(style: .switch, textLabelText: "Switch Row - Off")
        section2Row2.cellSwitchControlConfigurationHandler = {
            return false
        }
        section2Row2.cellSwitchControlHandler = { (_, _, _) in
            // Do some work
        }
        
        let section2 = TableViewSection(headerViewTitle: "Section 2 Header Title",
                                        footerViewTitle: "Section 2 Footer Title",
                                        rows: [section2Row1, section2Row2])
        
        return TableViewData(sections: [section1, section2])
    }
}

