//
//  repsController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/23/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//
//  OK, so, header has textfields to enter reps
//  hit OK and then that displays as a rep in the tableview
//  header (or footer??) needs to have a finish button
//  or going back to pick another exercise serves as a finish button
//  and displays the exercise and reps under AsYouGoWorkoutViewController 

import UIKit

protocol repsControllerDelegate: class {
    func passDataBack(data: [ExerciseSet])
}

class repsController: UITableViewController, UITextFieldDelegate {
    
    weak var delegate: repsControllerDelegate? //I don't quite understand weak keyword, but the article I read said to use it for delegates
    var exercise: Exercise?
    var set: [ExerciseSet] = [ExerciseSet]()
    var cellID = "cellID"
    var weightString: String?
    var repsString: String?
    
    let weightTextfield: UITextField = {
        let textfield = UITextField()
        textfield.textAlignment = NSTextAlignment.center
        textfield.textColor = ColorsForApp.textColor
        textfield.backgroundColor = ColorsForApp.componentBackgroundColor
        textfield.borderStyle = UITextBorderStyle.bezel
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.tag = 1
        textfield.keyboardType = .numbersAndPunctuation
        return textfield
    }()
    
    let repsTextfield: UITextField = {
        let textfield = UITextField()
        textfield.textAlignment = NSTextAlignment.center
        textfield.textColor = ColorsForApp.textColor
        textfield.backgroundColor = ColorsForApp.componentBackgroundColor
        textfield.borderStyle = UITextBorderStyle.bezel
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.tag = 2
        textfield.keyboardType = .numbersAndPunctuation
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrapped = exercise?.name {
            navigationItem.title = unwrapped
        }
        weightTextfield.delegate = self
        repsTextfield.delegate = self
        
        tableView.register(RepCell.self, forCellReuseIdentifier: cellID)

        tableView.tableFooterView = UIView()
        tableView.backgroundColor = ColorsForApp.backroundColor
        tableView.separatorColor = ColorsForApp.componentBackgroundColor
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    // there's a lot of stuff going on here
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        
        let weightLabel: UILabel = {
            let label = UILabel()
            label.text = "weight: "
            label.textColor = ColorsForApp.textColor
            label.textAlignment = NSTextAlignment.right
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let repsLabel: UILabel = {
            let label = UILabel()
            label.text = "reps: "
            label.textColor = ColorsForApp.textColor
            label.textAlignment = NSTextAlignment.right
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let saveButton: UIButton = {
            let button = UIButton()
            button.setTitle("save", for: .normal)
            button.backgroundColor = ColorsForApp.componentBackgroundColor
            button.setTitleColor(ColorsForApp.textColor, for: .normal)
            button.addTarget(self, action: #selector(repsController.savePressed), for: UIControlEvents.touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        header.addSubview(weightLabel)
        weightLabel.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 8).isActive = true
        weightLabel.topAnchor.constraint(equalTo: header.topAnchor, constant: 8).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        weightLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8).isActive = true
        
        header.addSubview(weightTextfield)
        weightTextfield.leftAnchor.constraint(equalTo: weightLabel.rightAnchor, constant: 8).isActive = true
        weightTextfield.topAnchor.constraint(equalTo: header.topAnchor, constant: 8).isActive = true
        weightTextfield.widthAnchor.constraint(equalToConstant: 50).isActive = true
        weightTextfield.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8).isActive = true
        
        header.addSubview(repsLabel)
        repsLabel.leftAnchor.constraint(equalTo: weightTextfield.rightAnchor, constant: 8).isActive = true
        repsLabel.topAnchor.constraint(equalTo: header.topAnchor, constant: 8).isActive = true
        repsLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        repsLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8).isActive = true
        
        header.addSubview(repsTextfield)
        repsTextfield.leftAnchor.constraint(equalTo: repsLabel.rightAnchor, constant: 8).isActive = true
        repsTextfield.topAnchor.constraint(equalTo: header.topAnchor, constant: 8).isActive = true
        repsTextfield.widthAnchor.constraint(equalToConstant: 50).isActive = true
        repsTextfield.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8).isActive = true
        
        header.addSubview(saveButton)
        saveButton.leftAnchor.constraint(equalTo: repsTextfield.rightAnchor, constant: 8).isActive = true
        saveButton.topAnchor.constraint(equalTo: header.topAnchor, constant: 8).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8).isActive = true
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RepCell
        cell.setDisplay(display: "\(weightString ?? "this should have a value") x \(repsString ?? "this should have a value")")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return set.count
    }
    
    
    @objc func savePressed() {
        // to do: make sure only numbers exist in the text fields
        if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: weightTextfield.text!)) && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: repsTextfield.text!)) {
            //print("only numbers here" )
        }
        if weightTextfield.text != "" && repsTextfield.text != "" {
            //print("good to go" )
            weightString = weightTextfield.text
            repsString = repsTextfield.text
            var weight: Int
            if let num1 = Int(weightTextfield.text!){
                weight = num1
            }else{
                weight = 0
            }
            var reps: Int
            if let num2 = Int(repsTextfield.text!){
                reps = num2
            }else{
                reps = 0
            }
            var name: String
            if let unwrapped = exercise?.name {
                name = unwrapped
            }else{
                name = "somehow I don't exist"
            }
            var resistence: String
            if let unwrapped2 = exercise?.resistenceType {
                resistence = unwrapped2
            }else{
                resistence = "somehow I don't exist"
            }
            let createdSet = ExerciseSet(name: name, resistenceType: resistence, weight: weight, reps: reps)
            set.append(createdSet)
            weightTextfield.text = ""
            repsTextfield.text = ""
            
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: set.count-1, section: 0)], with: .automatic)
            tableView.endUpdates()

        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //tags: 1 is weight, 2 is reps
        if textField.tag == 1 {
            self.weightTextfield.resignFirstResponder()
            //weightString = weightTextfield.text
        }else{
            self.repsTextfield.resignFirstResponder()
            //repsString = repsTextfield.text
        }
        return true
    }
    
    // this is called when the back button of a UINavigationController is hit (thanks StackOverflow!) 
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            //print("back button hit")
            //if there is stuff in the array then it should be saved as an exercise in the workout
            if set.count != 0 {
                delegate?.passDataBack(data: set)
                //print("passing data backwards!")
            }
            
        }
    }

    
}


