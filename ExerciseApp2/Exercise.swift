//
//  Exercise.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/17/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class Exercise: NSObject, Comparable {
    
    var name: String
    var primaryMusclesUsed: [String]
    var resistenceType: String
    
    init(name: String, primaryMusclesUsed: [String], resistenceType: String) {
        self.name = name.uppercased()
        self.primaryMusclesUsed = primaryMusclesUsed
        self.resistenceType = resistenceType
        
        super.init()
    }
    
    
    static func <(lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name < rhs.name
    }
    
    
    static func ==(lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}
