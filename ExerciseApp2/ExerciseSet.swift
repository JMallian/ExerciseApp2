//
//  ExerciseSet.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/23/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//
//  a workout is made up of a bunch of exercise sets: squat, 95 lbs, 5 (5 reps of squats with 95 lbs)

import Foundation

class ExerciseSet {
    let name: String
    let resistenceType: String
    private let weight: Int
    private let reps: Int
    
    init(name: String, resistenceType: String, weight: Int, reps: Int) {
        self.name = name
        self.resistenceType = resistenceType
        self.weight = weight
        self.reps = reps
    }
    
}
