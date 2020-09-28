//
//  SwitchTableViewCell.swift
//  CAPUIKit
//
//  Created by Craig Appleton on 25/03/2019.
//  Copyright © 2019 CAP. All rights reserved.
//

import UIKit

public class SwitchTableViewCell: UITableViewCell {
    
    // MARK: - Variable Declarations
    
    public static let reuseIdentifier = "SwitchTableViewCellReuseIdentifier"
    
    public let switchControl = UISwitch(target: self, action: #selector(switchToggled(_:)), for: .valueChanged)
    public var switchToggledHandler: ((_ sender: UISwitch) -> Void)?
    
    
    // MARK: - UITableView Variable Overrides
    
    public override var isEditing: Bool {
        didSet {
            updateAccessoryViews()
        }
    }
    
    
    // MARK: - Initialiser Methods
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        updateAccessoryViews()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        updateAccessoryViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        updateAccessoryViews()
    }
    
    
    // MARK: - Helper Methods
    
    private func updateAccessoryViews() {
        
        self.accessoryView = self.isEditing ? nil : switchControl
        self.editingAccessoryView = self.isEditing ? switchControl : nil
    }

    
    // MARK: - UI Callback Methods
    
    @objc private func switchToggled(_ sender: UISwitch) {
        
        switchToggledHandler?(sender)
    }
    
    
    // MARK: - UITableViewCell Methods
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        updateAccessoryViews()
    }
}
