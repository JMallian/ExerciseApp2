//
//  ExerciseSet.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/23/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//
//  a workout is made up of a bunch of exercise sets: squat, 95 lbs, 5 (5 reps of squats with 95 lbs)

import Foundation

class ExerciseSet: NSObject, NSCoding {

    private let name: String
    private let resistenceType: String
    private let weight: Int
    private let reps: Int
    
    init(name: String, resistenceType: String, weight: Int, reps: Int) {
        self.name = name
        self.resistenceType = resistenceType
        self.weight = weight
        self.reps = reps
        super.init()
    }
    
    func getName() -> String{
        return name
    }
    
    func getResistenceType() -> String {
        return resistenceType
    }
    
    func getWeight() -> Int {
        return weight
    }
    
    func getReps() -> Int {
        return reps
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.resistenceType, forKey: "resistenceType")
        aCoder.encode(self.weight, forKey: "weight")
        aCoder.encode(self.reps, forKey: "reps")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let resistenceType = aDecoder.decodeObject(forKey: "resistenceType") as! String
        let weight = aDecoder.decodeInteger(forKey: "weight") as! Int
        let reps = aDecoder.decodeInteger(forKey: "reps") as! Int
        
        self.init(
            name: name,
            resistenceType: resistenceType,
            weight: weight,
            reps: reps
        )
    }
    
}
