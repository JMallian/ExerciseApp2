//
//  addExerciseViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class addExerciseViewController: UIViewController, UITextFieldDelegate, resistenceTypeTableViewDelegate, musclesTableViewDelegate {
    
    let displayName: UILabel
    let displayResistenceType: UILabel
    let displayMuscleGroup: UILabel
    
    let typeExerciseName: UITextField
    let addMuscleGroupButton: UIButton
    let addResistenceTypeButton: UIButton
    let createExercise: UIButton
    
    let screenSize: CGSize = UIScreen.main.bounds.size
    
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
        
        
        //let centerX: CGFloat = screenSize.width / 2
        //let centerY: CGFloat = screenSize.height / 2
        
        createLabels()
        createTextBox()
        createExerciseButton()
        createAddMuscleGroupButton()
        createAddResistenceTypeButton()
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
        //button only does things if labels have data
        if (displayMuscleGroup.text != nil && displayResistenceType.text != nil && displayName.text != nil) {
            let exerciseName = displayName.text
            let resistenceType = displayResistenceType.text
            let stringToSplit = displayMuscleGroup.text
            let musclesType = stringToSplit?.components(separatedBy: " ,") //not sure if this is what I want
            let exerciseToAdd = Exercise(name: exerciseName!, primaryMusclesUsed: musclesType!, resistenceType: resistenceType!)
            ExerciseStore.allExercises.append(exerciseToAdd)
            
            //clear labels and display success
            displayName.text = ""
            displayMuscleGroup.text = "Exercise Added"
            displayResistenceType.text = ""
            typeExerciseName.text = ""
            
            //for testing
            print("items in exercise array: \(ExerciseStore.allExercises.count)")
            ExerciseStore.printExercises()
        }
    }
    
    @objc func addMuscleGroupPressed() {
        //self.present(musclesTableView(), animated: true, completion: nil)
        let nextViewController = musclesTableView()
        nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func addResistenceTypePressed() {
        let nextViewController = resistenceTypeTableView(style: .plain)
        nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: true)
        //self.navigationController?.pushViewController(resistenceTypeTableView(style: .plain), animated: true)
    }
    
    //dismisses keyboard when user hits Return on keyboard while typing text into typeExerciseName UITextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.typeExerciseName.resignFirstResponder()
        displayName.text = typeExerciseName.text
        return true
    }
    
    func passResistenceType(text: String) {
        displayResistenceType.text = text
    }
    
    func passMusclesUsed(data: [String]) {
        var displayString = ""
        for item in data {
            displayString = displayString + item + ", "
        }
        let result = String(displayString.dropLast(2))
        displayMuscleGroup.text = result
    }
    
    func createLabels() {
        displayName.frame = CGRect(x: 0, y: 50, width: screenSize.width, height: 50)
        self.view.addSubview(displayName)
        displayResistenceType.frame = CGRect(x: 0, y: 65, width: screenSize.width, height: 50)
        self.view.addSubview(displayResistenceType)
        displayMuscleGroup.frame = CGRect(x: 0, y: 80, width: screenSize.width, height: 50)
        self.view.addSubview(displayMuscleGroup)
    }
    
    func createTextBox() {
        typeExerciseName.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 - 175, width: screenSize.width, height: 50)
        typeExerciseName.textAlignment = NSTextAlignment.center
        typeExerciseName.placeholder = "Type Exercise Name"
        typeExerciseName.textColor = ColorsForApp.textColor
        typeExerciseName.backgroundColor = ColorsForApp.componentBackgroundColor
        typeExerciseName.borderStyle = UITextBorderStyle.bezel
        typeExerciseName.delegate = self
        self.view.addSubview(typeExerciseName)
    }
    
    func createExerciseButton() {
        createExercise.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 + 125, width: screenSize.width, height: 50)
        createExercise.setTitle("Create Exercise", for: .normal)
        createExercise.backgroundColor = ColorsForApp.componentBackgroundColor
        createExercise.setTitleColor(ColorsForApp.textColor, for: .normal)
        createExercise.addTarget(self, action: #selector(addExerciseViewController.createExercisePressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(createExercise)
    }
    
    func createAddMuscleGroupButton() {
        addMuscleGroupButton.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 + 25, width: screenSize.width, height: 50)
        addMuscleGroupButton.setTitle("Add Muscles Used", for: .normal)
        addMuscleGroupButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addMuscleGroupButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addMuscleGroupButton.addTarget(self, action: #selector(addExerciseViewController.addMuscleGroupPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(addMuscleGroupButton)
    }
    
    func createAddResistenceTypeButton() {
        addResistenceTypeButton.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 - 75, width: screenSize.width, height: 50)
        addResistenceTypeButton.setTitle("Add Resistence Type", for: .normal)
        addResistenceTypeButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addResistenceTypeButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addResistenceTypeButton.addTarget(self, action: #selector(addExerciseViewController.addResistenceTypePressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(addResistenceTypeButton)
    }
}
