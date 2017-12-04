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
    private var exerciseSet: [ExerciseSet]
    
    init(exerciseSet: [ExerciseSet]) {
        self.dateCreated = Date()
        self.exerciseSet = exerciseSet
    }
    
    func addSet(set: ExerciseSet) {
        exerciseSet.append(set)
    }
    
    func addArrayOfSets(arrayOfSets: [ExerciseSet]) {
        exerciseSet.append(contentsOf: arrayOfSets)
    }
    
    func getSets() -> [ExerciseSet] {
        return exerciseSet
    }
    
    func returnDateCreated() -> Date {
        return dateCreated
    }
    
    func returnNumberOfSets() -> Int {
        return exerciseSet.count
    }
}
