//
//  ViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//
// this is the root view controller for the app

import UIKit

class ViewController: UIViewController {
    let startNewButton: UIButton
    let historyButton: UIButton
    let createButton: UIButton
    let addExerciseButton: UIButton

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        startNewButton = UIButton()
        historyButton = UIButton()
        createButton = UIButton()
        addExerciseButton = UIButton()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //button placement
        let screenSize: CGSize = UIScreen.main.bounds.size
        //let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        startNewButton.frame = CGRect(x: 0, y: centerY - 175, width: screenSize.width, height: 50)
        historyButton.frame = CGRect(x: 0, y: centerY - 75, width: screenSize.width, height: 50)
        createButton.frame = CGRect(x: 0, y: centerY + 25, width: screenSize.width, height: 50)
        addExerciseButton.frame = CGRect(x: 0, y: centerY + 125, width: screenSize.width, height: 50)
        
        //button titles
        startNewButton.setTitle("Start New Workout", for: .normal)
        historyButton.setTitle("History", for: .normal)
        createButton.setTitle("Create Workout", for: .normal)
        addExerciseButton.setTitle("Add Exercise", for: .normal)
        
        //button colors
        startNewButton.backgroundColor = ColorsForApp.componentBackgroundColor
        historyButton.backgroundColor = ColorsForApp.componentBackgroundColor
        createButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addExerciseButton.backgroundColor = ColorsForApp.componentBackgroundColor
        
        startNewButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        historyButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        createButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addExerciseButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        
        //button functions
        addExerciseButton.addTarget(self, action: #selector(ViewController.addExercisePressed), for: UIControlEvents.touchUpInside)
        startNewButton.addTarget(self, action: #selector(ViewController.startNewPressed), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(startNewButton)
        self.view.addSubview(historyButton)
        self.view.addSubview(createButton)
        self.view.addSubview(addExerciseButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Exercise App"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addExercisePressed() {
        //self.present(addExerciseViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(addExerciseViewController(), animated: true)
    }
    
    @objc func startNewPressed() {
        self.navigationController?.pushViewController(ChooseWorkoutTypeViewController(), animated: true)
    }


}

