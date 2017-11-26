//
//  RepCell.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/25/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class RepCell: UITableViewCell {
    
    private let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "95 lbs. x 3"
        label.backgroundColor = .purple
        label.textColor = ColorsForApp.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(displayLabel)
        displayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        displayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        displayLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        displayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
