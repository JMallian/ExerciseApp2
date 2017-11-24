//
//  Workout.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/23/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import Foundation

class Workout {
    private let dateCreated: Date
    private let exerciseSet: [ExerciseSet]
    
    init(exerciseSet: [ExerciseSet]) {
        self.dateCreated = Date()
        self.exerciseSet = exerciseSet
    }
}
