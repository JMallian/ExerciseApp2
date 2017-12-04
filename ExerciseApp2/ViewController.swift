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
    var allTheWorkouts: WorkoutStore? //needs to pass this to ChooseWorkoutTypeViewController, was set in AppDelegate
    
    private let startNewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start New Workout", for: .normal)
        button.backgroundColor = ColorsForApp.componentBackgroundColor
        button.setTitleColor(ColorsForApp.textColor, for: .normal)
        button.addTarget(self, action: #selector(ViewController.startNewPressed), for: UIControlEvents.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
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

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addExercisePressed() {
        self.navigationController?.pushViewController(addExerciseViewController(), animated: true)
    }
    
    @objc func startNewPressed() {
        let nextViewController = ChooseWorkoutTypeViewController()
        nextViewController.allTheWorkouts = self.allTheWorkouts
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        //let margins = view.layoutMarginsGuide I don't care about this, but it's nice to know it exist
        //I don't love using some of these constants but when I tried to make them % of screen height they first failed
        //to resize properly when the screen was rotated when I got that working constraints were being broken
        //so for now constants are still used
//        let height = view.frame.size.height
//        height = height - UIApplication.shared.statusBarFrame.height
//        if let navBar = self.navigationController?.navigationBar.frame.size.height {
//            height = height - navBar
//        }

        self.view.addSubview(startNewButton)
        startNewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        startNewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        startNewButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        startNewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
        self.view.addSubview(historyButton)
        historyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        historyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        historyButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        historyButton.topAnchor.constraint(equalTo: startNewButton.bottomAnchor, constant: 10).isActive = true
        
        self.view.addSubview(createButton)
        createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        createButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        createButton.topAnchor.constraint(equalTo: historyButton.bottomAnchor, constant: 10).isActive = true
        
        self.view.addSubview(addExerciseButton)
        addExerciseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addExerciseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addExerciseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        addExerciseButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 10).isActive = true
    }
}
