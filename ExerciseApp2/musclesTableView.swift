//
//  musclesTableView.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/14/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

protocol musclesTableViewDelegate: class {
    func passMusclesUsed(data: [String])
}

class musclesTableView: UITableViewController {
    var dataMuscleGroups: [String] = []
    var delegate: musclesTableViewDelegate?
    var checkMarkCount: Int = 0
    var maxCheckMarkCount: Int = 3
    var dataToPass: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Muscles Used"
                        
        dataMuscleGroups = [
            "anterior deltoids",
            "biceps",
            "calves",
            "deltoids",
            "erectors",
            "external obliques",
            "gluteals",
            "hamstrings",
            "internal obliques",
            "lateral deltoids",
            "lats",
            "midtraps",
            "pectorals",
            "posterior deltoids",
            "quadriceps",
            "rectus abdominis",
            "rhomboids",
            "traps",
            "triceps",
            "upper gluteals",
            "upper trapezius"
        ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMuscleGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        myCell.textLabel?.text = dataMuscleGroups[indexPath.row]
        
        return myCell
    }
    
    //should probably limit the selection to 3 or so
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myCell = tableView.cellForRow(at: indexPath)
        
        if myCell?.accessoryType == .checkmark {
            myCell?.accessoryType = .none
            checkMarkCount = checkMarkCount - 1
            //remove it from the array
            //this could probably be done better - possibly with a dictionary where key = indexPath
            for item in dataToPass {
                if item == myCell?.textLabel?.text {
                    dataToPass.remove(at: dataToPass.index(of: (myCell?.textLabel?.text)!)!)
                }
            }
        }else if checkMarkCount == maxCheckMarkCount {
            //does nothing, user has to uncheck a check first to select this cell
        }else{
            myCell?.accessoryType = .checkmark
            checkMarkCount = checkMarkCount + 1
            dataToPass.append((myCell?.textLabel?.text)!)
            delegate?.passMusclesUsed(data: dataToPass)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame: CGRect = tableView.frame
        
        //need to make it more obvious that there are buttons here by adding some space between them
        let editButton = UIButton()
        editButton.frame = CGRect(x: 0, y: 0, width: frame.size.width/2, height: 50)
        editButton.setTitle("Edit Muscle Groups", for: .normal)
        editButton.backgroundColor = ColorsForApp.componentBackgroundColor
        editButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        editButton.addTarget(self, action: #selector(musclesTableView.editButtonPressed), for: UIControlEvents.touchUpInside)
        let addButton = UIButton()
        addButton.frame = CGRect(x: frame.size.width/2, y: 0, width: frame.size.width/2, height: 50)
        addButton.setTitle("Add Muscle Group", for: .normal)
        addButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addButton.addTarget(self, action: #selector(musclesTableView.addButtonPressed), for: UIControlEvents.touchUpInside)
        let myHeaderView: UIView = UIView()
        myHeaderView.frame = CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.width)
        myHeaderView.backgroundColor = UIColor.red
        myHeaderView.addSubview(editButton)
        myHeaderView.addSubview(addButton)
        return myHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let musclesToDelete = dataMuscleGroups[indexPath.row]
            let index = dataMuscleGroups.index(of: musclesToDelete)
            dataMuscleGroups.remove(at: index!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
    
    @objc func editButtonPressed(sender: UIButton) {
        if isEditing {
            setEditing(false, animated: true)
            sender.setTitle("Edit Muscle Groups", for: .normal)
        }else{
            setEditing(true, animated: true)
            sender.setTitle("Done Editing", for: .normal)
        }
    }
    
    @objc func addButtonPressed() {
        
    }
}


