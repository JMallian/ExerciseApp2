//
//  musclesTableView.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/14/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

protocol musclesTableViewDelegate: class {
    func passMusclesUsed(text: String) //needs to be changed to be an array
}

class musclesTableView: UITableViewController {
    var dataMuscleGroups: [String] = []
    var delegate: musclesTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Muscles Used"
                
        dataMuscleGroups = [
            "quadriceps",
            "gluteals",
            "hamstrings",
            "erectors",
            "upper gluteals",
            "deltoids",
            "pectorals",
            "triceps",
            "upper trapezius",
            "anterior deltoids",
            "lats",
            "midtraps",
            "rhomboids",
            "biceps",
            "posterior deltoids",
            "lateral deltoids",
            "traps",
            "rectus abdominis",
            "internal obliques",
            "external obliques",
            "calves"
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
        }else{
            myCell?.accessoryType = .checkmark
            delegate?.passMusclesUsed(text: dataMuscleGroups[0]) //just for testing purposes
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.headerView(forSection: section)
    }
    


    
}
