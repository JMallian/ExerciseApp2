//
//  RepCell.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/25/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class RepCell: UITableViewCell {
      
    private let displayLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        displayLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        displayLabel.textColor = ColorsForApp.textColor
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .clear
        
        addSubview(displayLabel)
        displayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        displayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        displayLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        displayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDisplay(display: String) {
        displayLabel.text = display
    }
    
}
