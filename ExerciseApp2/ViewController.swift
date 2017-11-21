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
    
    private let startNewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start New Workout", for: .normal)
        button.backgroundColor = ColorsForApp.componentBackgroundColor
        button.setTitleColor(ColorsForApp.textColor, for: .normal)
        button.addTarget(self, action: #selector(ViewController.startNewPressed), for: UIControlEvents.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false //prevents view from being framed underneath the navigation bar
        return button
    }()
    
    private let historyButton: UIButton = {
        let button = UIButton()
        button.setTitle("History", for: .normal)
        button.backgroundColor = ColorsForApp.componentBackgroundColor
        button.setTitleColor(ColorsForApp.textColor, for: .normal)
        //button.addTarget(self, action: #selector(ViewController.startNewPressed), for: UIControlEvents.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Workout", for: .normal)
        button.backgroundColor = ColorsForApp.componentBackgroundColor
        button.setTitleColor(ColorsForApp.textColor, for: .normal)
        //button.addTarget(self, action: #selector(ViewController.startNewPressed), for: UIControlEvents.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addExerciseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Exercise", for: .normal)
        button.backgroundColor = ColorsForApp.componentBackgroundColor
        button.setTitleColor(ColorsForApp.textColor, for: .normal)
        button.addTarget(self, action: #selector(ViewController.addExercisePressed), for: UIControlEvents.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Exercise App"
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // I did all this and I still don't know how to get the buttons to resize when the device is rotated
        // but at least it looks the same on all screen sizes 
        let navBarHeight = self.navigationController?.navigationBar.frame.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        var viewHeight: CGFloat
        if let unwrapped = navBarHeight { //is this even necessary?
            viewHeight = UIScreen.main.bounds.height - unwrapped - statusBarHeight
        }else{
            viewHeight = UIScreen.main.bounds.height
        }
        let buttonHeight: CGFloat = viewHeight * 0.20
        let spaceBetweenButtons: CGFloat = viewHeight * 0.04
        let buttonBothSidePadding: CGFloat = 10
        let topMostButtonPadding: CGFloat = viewHeight * 0.04 //this is only used once it's just nice to have it here
        
        self.view.addSubview(startNewButton)
        startNewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: topMostButtonPadding).isActive = true
        startNewButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: buttonBothSidePadding).isActive = true
        startNewButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -buttonBothSidePadding).isActive = true
        startNewButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        self.view.addSubview(historyButton)
        historyButton.topAnchor.constraint(equalTo: startNewButton.bottomAnchor, constant: spaceBetweenButtons).isActive = true
        historyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: buttonBothSidePadding).isActive = true
        historyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -buttonBothSidePadding).isActive = true
        historyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        self.view.addSubview(createButton)
        createButton.topAnchor.constraint(equalTo: historyButton.bottomAnchor, constant: spaceBetweenButtons).isActive = true
        createButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: buttonBothSidePadding).isActive = true
        createButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -buttonBothSidePadding).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        self.view.addSubview(addExerciseButton)
        addExerciseButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: spaceBetweenButtons).isActive = true
        addExerciseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: buttonBothSidePadding).isActive = true
        addExerciseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -buttonBothSidePadding).isActive = true
        addExerciseButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addExercisePressed() {
        self.navigationController?.pushViewController(addExerciseViewController(), animated: true)
    }
    
    @objc func startNewPressed() {
        self.navigationController?.pushViewController(ChooseWorkoutTypeViewController(), animated: true)
    }
    
    
}
