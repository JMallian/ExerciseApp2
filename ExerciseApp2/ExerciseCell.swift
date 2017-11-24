//
//  ExerciseCell.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/22/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//



// to do: dispaly labels on 3 seperate lines to minimize display issues (with overlapping Strings)
import UIKit

class ExerciseCell: UITableViewCell {
    
    var exercise: Exercise? {
        didSet {
            exerciseLabel.text = exercise?.name
            resistenceTypeLabel.text = exercise?.resistenceType
            musclesUsedLabel.text = exercise?.displayMusclesUsed()
        }
    }
    
    private let exerciseLabel: UILabel = {
        let label = UILabel()
        //label.text = "squat"
        //label.backgroundColor = .purple
        label.textColor = ColorsForApp.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resistenceTypeLabel: UILabel = {
        let label = UILabel()
        //label.text = "barbell"
        //label.backgroundColor = .green
        label.textColor = ColorsForApp.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let musclesUsedLabel: UILabel = {
        let label = UILabel()
        //label.text = "quads, hamstrings, glutes"
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
