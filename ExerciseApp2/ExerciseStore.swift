//
//  ExerciseStore.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/17/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

//stores my Exercises!
import UIKit

class ExerciseStore {
    var allExercises = [Exercise]()
    
    func storeExercise(exercise: Exercise) {
        allExercises.append(exercise)
    }
    
    func removeExercise(exercise: Exercise) {
        if let index = allExercises.index(of: exercise) {
            allExercises.remove(at: index)
        }
    }
    
    func arrangeAlphabetically() {
        //allExercises.sort { $0.name < $1.name }
        allExercises = allExercises.sorted()
    }
    
}
