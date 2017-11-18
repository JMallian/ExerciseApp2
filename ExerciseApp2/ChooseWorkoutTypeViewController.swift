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
        self.view.addSubview(choosePredefinedWorkout)
        
        chooseAddExercisesAsYouGo.frame = CGRect(x: 0, y: centerY - 75, width: screenSize.width, height: 50)
        chooseAddExercisesAsYouGo.setTitle("Add Exercises As You Workout", for: .normal)
        chooseAddExercisesAsYouGo.backgroundColor = ColorsForApp.componentBackgroundColor
        chooseAddExercisesAsYouGo.setTitleColor(ColorsForApp.textColor, for: .normal)
        chooseAddExercisesAsYouGo.addTarget(self, action: #selector(ChooseWorkoutTypeViewController.chooseAddExerciesAsYouGoClicked), for: UIControlEvents.touchUpInside)
        self.view.addSubview(chooseAddExercisesAsYouGo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func choosePredifinedClicked() {
        
    }
    
    @objc func chooseAddExerciesAsYouGoClicked() {
        self.navigationController?.pushViewController(AsYouGoWorkoutViewController(), animated: true)
    }
}
