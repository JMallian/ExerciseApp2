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
    let headerHeight: CGFloat = 50
    
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
            for item in dataToPass {
                if item == myCell?.textLabel?.text {
                    dataToPass.remove(at: dataToPass.index(of: (myCell?.textLabel?.text)!)!)
                }
            }
        }else if checkMarkCount == maxCheckMarkCount {
            //does nothing, user has to uncheck a check first to select this cell
            //but I can't just do an if else so here's an empty else if??
        }else{
            myCell?.accessoryType = .checkmark
            checkMarkCount = checkMarkCount + 1
            dataToPass.append((myCell?.textLabel?.text)!)
            delegate?.passMusclesUsed(data: dataToPass)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame: CGRect = tableView.frame
        let myHeaderView: UIView = UIView()
        myHeaderView.frame = CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.width)
        myHeaderView.backgroundColor = UIColor.red
        
        addEditButtonToHeader(view: myHeaderView, frame: frame)
        addAddButtonToHeader(view: myHeaderView, frame: frame)
        addOrderButtonToHeader(view: myHeaderView, frame: frame)
        
        return myHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
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
            sender.setTitle("Edit", for: .normal)
        }else{
            setEditing(true, animated: true)
            sender.setTitle("Done", for: .normal)
        }
    }
    
    @objc func addButtonPressed() {
        let alert = UIAlertController(title: "Add Muscle", message: "Type Muscle to Add", preferredStyle: .alert)
        alert.addTextField { (textField) in
            //textField.text = "type muscle here"
            //configure textfield here
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            let textField = alert.textFields![0]
            
            if !(textField.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! {
                //add to array
                self.dataMuscleGroups.append((textField.text)!) //need to check that it's not an emtpy String
                //add to tableView
                self.tableView.insertRows(at: [IndexPath(row: self.dataMuscleGroups.count - 1, section: 0)], with: .automatic)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { (_) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func orderButtonPressed() {
        
    }
    
    func addEditButtonToHeader(view: UIView, frame: CGRect) {
        let editButton = UIButton()
        editButton.frame = CGRect(x: 0, y: 0, width: frame.size.width/2, height: headerHeight)
        editButton.setTitle("Edit", for: .normal)
        editButton.backgroundColor = ColorsForApp.componentBackgroundColor
        editButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        editButton.addTarget(self, action: #selector(musclesTableView.editButtonPressed), for: UIControlEvents.touchUpInside)
        view.addSubview(editButton)
    }
    
    func addAddButtonToHeader(view: UIView, frame: CGRect) {
        let addButton = UIButton()
        addButton.frame = CGRect(x: (frame.size.width/3) + (frame.size.width/3), y: 0, width: frame.size.width/3, height: headerHeight)
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = ColorsForApp.componentBackgroundColor
        addButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        addButton.addTarget(self, action: #selector(musclesTableView.addButtonPressed), for: UIControlEvents.touchUpInside)
        view.addSubview(addButton)
    }
    
    func addOrderButtonToHeader(view: UIView, frame: CGRect) {
        let orderMusclesButton = UIButton()
        orderMusclesButton.frame = CGRect(x: frame.size.width/3, y: 0, width: frame.size.width/3, height: headerHeight)
        orderMusclesButton.setTitle("Order", for: .normal)
        orderMusclesButton.backgroundColor = ColorsForApp.componentBackgroundColor
        orderMusclesButton.setTitleColor(ColorsForApp.textColor, for: .normal)
        orderMusclesButton.addTarget(self, action: #selector(musclesTableView.orderButtonPressed), for: UIControlEvents.touchUpInside)
        view.addSubview(orderMusclesButton)
    }
}


