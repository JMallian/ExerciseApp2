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
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "HeaderID")
                
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
        //return tableView.headerView(forSection: section)
        return tableView.dequeueReusableCell(withIdentifier: "HeaderID")
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //do stuff if user hits delete
        }
    }
    
    //I think I need to call this function, not write code in it
    override func setEditing(_ editing: Bool, animated: Bool) {
        
    }
}

class Header: UITableViewHeaderFooterView {
    var editButton: UIButton
    var displayEditingLabel: UILabel
    
    override init(reuseIdentifier: String?) {
        editButton = UIButton()
        displayEditingLabel = UILabel()
        
        super.init(reuseIdentifier: reuseIdentifier)
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        editButton.backgroundColor = ColorsForApp.backroundColor
        editButton.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
        //editButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(editButton)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
