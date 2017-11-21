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
    
    private let buttonHeight: CGFloat = 100
    private let spaceBetweenButtons: CGFloat = 20
    private let buttonBothSidePadding: CGFloat = 10
    
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

        self.view.addSubview(startNewButton)
        startNewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
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
        self.navigationController?.pushViewController(addExerciseViewController(), animated: true)
    }
    
    @objc func startNewPressed() {
        self.navigationController?.pushViewController(ChooseWorkoutTypeViewController(), animated: true)
    }


}

