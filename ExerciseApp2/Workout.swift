//
//  Workout.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/23/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import Foundation

class Workout: NSObject, NSCoding {

    private let dateCreated: Date
    private var exerciseSet: [ExerciseSet]
    
    init(exerciseSet: [ExerciseSet]) {
        self.dateCreated = Date()
        self.exerciseSet = exerciseSet
    }
    
    init(exerciseSet: [ExerciseSet], date: Date) { // this is only so I can put some fake workouts in with past dates 
        self.dateCreated = date
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.dateCreated, forKey: "dateCreated")
        aCoder.encode(self.exerciseSet, forKey: "exerciseSet")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        let exerciseSet = aDecoder.decodeObject(forKey: "exerciseSet") as! [ExerciseSet]
        
        self.init(
            exerciseSet: exerciseSet, date: dateCreated
        )
    }
    
    
}
