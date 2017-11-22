//
//  ExerciseCell.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/22/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    private let exerciseLabel: UILabel = {
        let label = UILabel()
        label.text = "squat"
        //label.backgroundColor = .purple
        label.textColor = ColorsForApp.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resistenceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "barbell"
        //label.backgroundColor = .green
        label.textColor = ColorsForApp.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let musclesUsedLabel: UILabel = {
        let label = UILabel()
        label.text = "quads, hamstrings, glutes"
        //label.backgroundColor = .yellow
        label.textColor = ColorsForApp.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(exerciseLabel)
        exerciseLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        exerciseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        exerciseLabel.widthAnchor.constraint(equalToConstant: 275).isActive = true
        exerciseLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(resistenceTypeLabel)
        resistenceTypeLabel.leftAnchor.constraint(equalTo: exerciseLabel.rightAnchor, constant: 8).isActive = true
        resistenceTypeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        resistenceTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        resistenceTypeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(musclesUsedLabel)
        musclesUsedLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        musclesUsedLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        musclesUsedLabel.topAnchor.constraint(equalTo: exerciseLabel.bottomAnchor, constant: 0).isActive = true
        musclesUsedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        
        
        
//        coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
//        coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
//        coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
//        coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
//        addSubview(titleLabel)
//        //titleLabel.frame = CGRect(x: 66, y: 20, width: 250, height: 20)
//        titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
//        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
//        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
//        //self.centerYAnchor puts it right in the middle of the superview, a constant of -10 moves it up 10
//
//        addSubview(authorLabel)
//        //authorLabel.frame = CGRect(x: 66, y: 48, width: 250, height: 20)
//        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
//        authorLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
//        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
//        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
