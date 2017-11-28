//
//  ChooseWorkoutTypeViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/17/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class ChooseWorkoutTypeViewController: UIViewController {
    var choosePredefinedWorkout: UIButton
    var chooseAddExercisesAsYouGo: UIButton
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        choosePredefinedWorkout = UIButton()
        chooseAddExercisesAsYouGo = UIButton()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerY: CGFloat = screenSize.height / 2
        choosePredefinedWorkout.frame = CGRect(x: 0, y: centerY - 175, width: screenSize.width, height: 50)
        choosePredefinedWorkout.setTitle("Predifined Workout", for: .normal)
        choosePredefinedWorkout.backgroundColor = ColorsForApp.componentBackgroundColor
        choosePredefinedWorkout.setTitleColor(ColorsForApp.textColor, for: .normal)
        choosePredefinedWorkout.addTarget(self, action: #selector(ChooseWorkoutTypeViewController.choosePredifinedClicked), for: UIControlEvents.touchUpInside)
        choosePredefinedWorkout.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(choosePredefinedWorkout)
        choosePredefinedWorkout.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        choosePredefinedWorkout.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        choosePredefinedWorkout.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        choosePredefinedWorkout.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
        chooseAddExercisesAsYouGo.frame = CGRect(x: 0, y: centerY - 75, width: screenSize.width, height: 50)
        chooseAddExercisesAsYouGo.setTitle("Add Exercises As You Workout", for: .normal)
        chooseAddExercisesAsYouGo.backgroundColor = ColorsForApp.componentBackgroundColor
        chooseAddExercisesAsYouGo.setTitleColor(ColorsForApp.textColor, for: .normal)
        chooseAddExercisesAsYouGo.addTarget(self, action: #selector(ChooseWorkoutTypeViewController.chooseAddExerciesAsYouGoClicked), for: UIControlEvents.touchUpInside)
        chooseAddExercisesAsYouGo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(chooseAddExercisesAsYouGo)
        chooseAddExercisesAsYouGo.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chooseAddExercisesAsYouGo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chooseAddExercisesAsYouGo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        chooseAddExercisesAsYouGo.topAnchor.constraint(equalTo: choosePredefinedWorkout.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func choosePredifinedClicked() {
        
    }
    
    @objc func chooseAddExerciesAsYouGoClicked() {
        //create a workout and let next view know about it
        let workout = Workout(exerciseSet: [ExerciseSet]())
        let nextView = AsYouGoWorkoutViewController()
        nextView.ongoingWorkout = workout 
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
