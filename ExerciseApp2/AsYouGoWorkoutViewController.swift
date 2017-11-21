//
//  AsYouGoWorkoutViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/17/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

// has a UIView as top level view and need to subclass UITableView as a subview (so it's not the whole screen)
// though maybe just using a header or footer might be a better way - yes actually I should do it this way
// and call self.tableView.tableFooterView = UIView() inside viewDidLoad so it looks good (gets ride of empty cells)
class AsYouGoWorkoutViewController: UIViewController {
    var topView: UIView
    var bottomTableView: UITableView
    var finishWorkoutButtion: UIButton
    var addExerciseButton: UIButton
    let screenSize: CGSize = UIScreen.main.bounds.size
    //let centerY: CGFloat = screenSize.height / 2
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        topView = UIView()
        bottomTableView = UITableView()
        finishWorkoutButtion = UIButton()
        addExerciseButton = UIButton()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        createTopView()
        createTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createTopView() {
        topView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        self.view.addSubview(topView)
        createFinishWorkoutButton()
        createAddExerciseButton()
    }
    
    func createTableView() {
        bottomTableView.frame = CGRect(x: 0, y: screenSize.height/2, width: screenSize.width, height: screenSize.height/2)
        self.view.addSubview(bottomTableView)
    }
    
    func createFinishWorkoutButton() {
        finishWorkoutButtion.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 - 175, width: screenSize.width, height: 50)
        finishWorkoutButtion.setTitle("Finish Workout", for: .normal)
        finishWorkoutButtion.setTitleColor(ColorsForApp.textColor, for: .normal)
        finishWorkoutButtion.backgroundColor = ColorsForApp.componentBackgroundColor
        self.view.addSubview(finishWorkoutButtion)
    }
    
    func createAddExerciseButton() {
        addExerciseButton.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 - 235, width: screenSize.width, height: 50)
        addExerciseButton.setTitle("Add Exercise", for: .normal)
        addExerciseButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addExerciseButton.backgroundColor = ColorsForApp.componentBackgroundColor
        self.view.addSubview(addExerciseButton)
    }
}
