//
//  addExerciseViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

// I think this might be a monster view controller
class addExerciseViewController: UIViewController, UITextFieldDelegate, resistenceTypeTableViewDelegate, musclesTableViewDelegate {
    
    let displayName: UILabel
    let displayResistenceType: UILabel
    let displayMuscleGroup: UILabel
    let displayExercisesAddedSucces: UILabel
    
    let typeExerciseName: UITextField
    let addMuscleGroupButton: UIButton
    let addResistenceTypeButton: UIButton
    let createExercise: UIButton
    
    //let screenSize: CGSize = UIScreen.main.bounds.size
    let spaceBetweenLables: CGFloat = 5
    let multiplierForLabelHeight: CGFloat = 0.05
    let spaceBetweenNonLables: CGFloat = 10
    let multiplierForNonLabelHeight: CGFloat = 0.15
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        displayName = UILabel()
        displayResistenceType = UILabel()
        displayMuscleGroup = UILabel()
        displayExercisesAddedSucces = UILabel()
        
        typeExerciseName = UITextField()
        addMuscleGroupButton = UIButton()
        addResistenceTypeButton = UIButton()
        createExercise = UIButton()

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.addSubview(displayExercisesAddedSucces)
        self.view.addSubview(displayName)
        self.view.addSubview(displayResistenceType)
        self.view.addSubview(displayMuscleGroup)
        self.view.addSubview(typeExerciseName)
        self.view.addSubview(addResistenceTypeButton)
        self.view.addSubview(addMuscleGroupButton)
        self.view.addSubview(createExercise)
        
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
        //makes an instance of an exercise class and adds it to the store of exercises
        //button only does things if labels have data
        if (displayMuscleGroup.text != "" && displayResistenceType.text != "" && displayName.text != "") { //don't add empty strings
            let exerciseName = displayName.text
            let resistenceType = displayResistenceType.text
            let stringToSplit = displayMuscleGroup.text
            if exerciseName != nil && resistenceType != nil && stringToSplit != nil { //makeing sure the ! don't cause a crash
                let musclesType = stringToSplit?.components(separatedBy: " ,") //not sure if this is what I want
                let exerciseToAdd = Exercise(name: exerciseName!, primaryMusclesUsed: musclesType!, resistenceType: resistenceType!)
                ExerciseStore.allExercises.append(exerciseToAdd)
                clearLabelsAndDisplaySucces()
            }
        }
    }
    
    @objc func addMuscleGroupPressed() {
        let nextViewController = musclesTableView()
        nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func addResistenceTypePressed() {
        let nextViewController = resistenceTypeTableView(style: .plain)
        nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //dismisses keyboard when user hits Return on keyboard while typing text into typeExerciseName UITextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.typeExerciseName.resignFirstResponder()
        displayName.text = typeExerciseName.text
        return true
    }
    
    //has to receive information from resistenceTypeTableView
    func passResistenceType(text: String) {
        displayResistenceType.text = text
    }
    
    //has to receive information from musclesTableView
    func passMusclesUsed(data: [String]) {
        var displayString = ""
        for item in data {
            displayString = displayString + item + ", "
        }
        let result = String(displayString.dropLast(2))
        displayMuscleGroup.text = result
    }
    
    func createLabels() {
        displayName.translatesAutoresizingMaskIntoConstraints = false
        displayName.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        displayName.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForLabelHeight).isActive = true
        displayName.topAnchor.constraint(equalTo: displayExercisesAddedSucces.bottomAnchor, constant: spaceBetweenLables).isActive = true
        
        displayResistenceType.translatesAutoresizingMaskIntoConstraints = false
        displayResistenceType.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        displayResistenceType.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayResistenceType.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForLabelHeight).isActive = true
        displayResistenceType.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: spaceBetweenLables).isActive = true
        
        displayMuscleGroup.translatesAutoresizingMaskIntoConstraints = false
        displayMuscleGroup.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        displayMuscleGroup.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayMuscleGroup.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForLabelHeight).isActive = true
        displayMuscleGroup.topAnchor.constraint(equalTo: displayResistenceType.bottomAnchor, constant: spaceBetweenLables).isActive = true
        
        displayExercisesAddedSucces.translatesAutoresizingMaskIntoConstraints = false
        displayExercisesAddedSucces.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        displayExercisesAddedSucces.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayExercisesAddedSucces.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForLabelHeight).isActive = true
        displayExercisesAddedSucces.topAnchor.constraint(equalTo: view.topAnchor, constant: spaceBetweenLables).isActive = true
    }
    
    func createTextBox() {
        typeExerciseName.textAlignment = NSTextAlignment.center
        typeExerciseName.placeholder = "Type Exercise Name"
        typeExerciseName.textColor = ColorsForApp.textColor
        typeExerciseName.backgroundColor = ColorsForApp.componentBackgroundColor
        typeExerciseName.borderStyle = UITextBorderStyle.bezel
        typeExerciseName.delegate = self
        typeExerciseName.translatesAutoresizingMaskIntoConstraints = false
        typeExerciseName.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        typeExerciseName.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        typeExerciseName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForNonLabelHeight).isActive = true
        typeExerciseName.topAnchor.constraint(equalTo: displayMuscleGroup.bottomAnchor, constant: spaceBetweenNonLables).isActive = true
    }
    
    func createAddResistenceTypeButton() {
        addResistenceTypeButton.translatesAutoresizingMaskIntoConstraints = false
        addResistenceTypeButton.setTitle("Add Resistence Type", for: .normal)
        addResistenceTypeButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addResistenceTypeButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addResistenceTypeButton.addTarget(self, action: #selector(addExerciseViewController.addResistenceTypePressed), for: UIControlEvents.touchUpInside)
        addResistenceTypeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addResistenceTypeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addResistenceTypeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForNonLabelHeight).isActive = true
        addResistenceTypeButton.topAnchor.constraint(equalTo: typeExerciseName.bottomAnchor, constant: spaceBetweenNonLables).isActive = true
    }
    
    func createAddMuscleGroupButton() {
        addMuscleGroupButton.translatesAutoresizingMaskIntoConstraints = false
        addMuscleGroupButton.setTitle("Add Muscles Used", for: .normal)
        addMuscleGroupButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addMuscleGroupButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addMuscleGroupButton.addTarget(self, action: #selector(addExerciseViewController.addMuscleGroupPressed), for: UIControlEvents.touchUpInside)
        addMuscleGroupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addMuscleGroupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addMuscleGroupButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForNonLabelHeight).isActive = true
        addMuscleGroupButton.topAnchor.constraint(equalTo: addResistenceTypeButton.bottomAnchor, constant: spaceBetweenNonLables).isActive = true
    }
    
    func createExerciseButton() {
        createExercise.setTitle("Create Exercise", for: .normal)
        createExercise.backgroundColor = ColorsForApp.componentBackgroundColor
        createExercise.setTitleColor(ColorsForApp.textColor, for: .normal)
        createExercise.addTarget(self, action: #selector(addExerciseViewController.createExercisePressed), for: UIControlEvents.touchUpInside)
        createExercise.translatesAutoresizingMaskIntoConstraints = false
        createExercise.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        createExercise.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        createExercise.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierForNonLabelHeight).isActive = true
        createExercise.topAnchor.constraint(equalTo: addMuscleGroupButton.bottomAnchor, constant: spaceBetweenNonLables).isActive = true
        
    }
    
    func clearLabelsAndDisplaySucces() {
        displayName.text = ""
        displayMuscleGroup.text = ""
        displayResistenceType.text = ""
        typeExerciseName.text = ""
        displayExercisesAddedSucces.text = "Exercise Added"
        //only want it to display for a few seconds
        UIView.animate(withDuration: 3, animations: { () -> Void in
            self.displayExercisesAddedSucces.alpha = 0
        })
    }
}
