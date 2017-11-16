//
//  addExerciseViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class addExerciseViewController: UIViewController, UITextFieldDelegate {
    let displayName: UILabel
    let displayResistenceType: UILabel
    let displayMuscleGroup: UILabel
    
    let typeExerciseName: UITextField
    let addMuscleGroupButton: UIButton
    let addResistenceTypeButton: UIButton
    let createExercise: UIButton
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        displayName = UILabel()
        displayResistenceType = UILabel()
        displayMuscleGroup = UILabel()
        
        typeExerciseName = UITextField()
        addMuscleGroupButton = UIButton()
        addResistenceTypeButton = UIButton()
        createExercise = UIButton()

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //THESE THINGS NEED TO GO INTO FUNCTIONS!!
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        //let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        typeExerciseName.frame = CGRect(x: 0, y: centerY - 175, width: screenSize.width, height: 50)
        typeExerciseName.textAlignment = NSTextAlignment.center
        typeExerciseName.textColor = UIColor.black
        typeExerciseName.backgroundColor = UIColor.cyan
        typeExerciseName.borderStyle = UITextBorderStyle.bezel
        typeExerciseName.delegate = self
        self.view.addSubview(typeExerciseName)
        
        createExercise.frame = CGRect(x: 0, y: centerY + 125, width: screenSize.width, height: 50)
        createExercise.setTitle("Go Back", for: .normal)
        createExercise.backgroundColor = UIColor.cyan
        createExercise.setTitleColor(UIColor.black, for: .normal)
        createExercise.addTarget(self, action: #selector(addExerciseViewController.createExercisePressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(createExercise)
        
        addMuscleGroupButton.frame = CGRect(x: 0, y: centerY + 25, width: screenSize.width, height: 50)
        addMuscleGroupButton.setTitle("Add Muscles Used", for: .normal)
        addMuscleGroupButton.backgroundColor = UIColor.cyan
        addMuscleGroupButton.setTitleColor(UIColor.black, for: .normal)
        addMuscleGroupButton.addTarget(self, action: #selector(addExerciseViewController.addMuscleGroupPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(addMuscleGroupButton)
        
        addResistenceTypeButton.frame = CGRect(x: 0, y: centerY - 75, width: screenSize.width, height: 50)
        addResistenceTypeButton.setTitle("Add Resistence Type", for: .normal)
        addResistenceTypeButton.backgroundColor = UIColor.cyan
        addResistenceTypeButton.setTitleColor(UIColor.black, for: .normal)
        addResistenceTypeButton.addTarget(self, action: #selector(addExerciseViewController.addResistenceTypePressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(addResistenceTypeButton)
        
    

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Exercise"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func createExercisePressed() {
        //makes an instance of an exercise class and adds it to the store of exercises!
    }
    
    @objc func addMuscleGroupPressed() {
        //self.present(musclesTableView(), animated: true, completion: nil)
        self.navigationController?.pushViewController(musclesTableView(), animated: true)
    }
    
    @objc func addResistenceTypePressed() {
        self.navigationController?.pushViewController(resistenceTypeTableView(style: .plain), animated: true)
    }
}
