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
    static var allExercises = [Exercise]()
    
    func storeExercise(exercise: Exercise) {
        ExerciseStore.allExercises.append(exercise)
    }
    
    func removeExercise(exercise: Exercise) {
        if let index = ExerciseStore.allExercises.index(of: exercise) {
            ExerciseStore.allExercises.remove(at: index)
        }
    }
    
    //this is not even used right now
    func arrangeAlphabetically() {
        //allExercises.sort { $0.name < $1.name }
        ExerciseStore.allExercises = ExerciseStore.allExercises.sorted()
    }
    
    //for testing purposes
    static func printExercises() {
        for exercise in ExerciseStore.allExercises {
            print(exercise.name)
            print(exercise.resistenceType)
            for muscleGroup in exercise.primaryMusclesUsed {
                print(muscleGroup)
            }
        }
    }
    
}
