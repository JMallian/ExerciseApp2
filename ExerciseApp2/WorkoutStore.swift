//
//  WorkoutStore.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/25/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import Foundation
// this was used before I was saving and loading the workouts
class WorkoutStore {
    private var allWorkouts = [Workout]() //private and not a static, like how things are suppose to be
    
    func addWorkout(workout: Workout) {
        allWorkouts.append(workout)
    }
    
    func count() -> Int {
        return allWorkouts.count
    }
    
    func getWorkout(index: Int) -> Workout {
        return allWorkouts[index]
    }
    
    func appendWorkouts(workouts: [Workout]) {
        allWorkouts.append(contentsOf: workouts)
    }
    
    func getAllWorkouts() -> [Workout] {
        return allWorkouts
    }
}
