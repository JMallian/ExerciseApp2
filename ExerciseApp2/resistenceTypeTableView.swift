//
//  resistenceTypeTableView.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/16/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

protocol resistenceTypeTableViewDelegate: class {
    func passResistenceType(text: String)
}


class resistenceTypeTableView: UITableViewController {
    var delegate: resistenceTypeTableViewDelegate?
    var resistenceTypeData: [String] = []
    var cellSelected: Bool
    var cellIndexForSelected: IndexPath
    
    override init(style: UITableViewStyle) {
        cellSelected = false
        cellIndexForSelected = IndexPath()
        super.init(style: .plain)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select Resistence Type"
        resistenceTypeData = [
            "Barbell",
            "Bodyweight",
            "Counter-Weight",
            "Dumbbell",
            "Resistence Band",
            "Machine"
        ]
        tableView.backgroundColor = ColorsForApp.backroundColor
        tableView.separatorColor = ColorsForApp.componentBackgroundColor
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.tableFooterView = UIView()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resistenceTypeData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        myCell.textLabel?.text = resistenceTypeData[indexPath.row]
        myCell.backgroundColor = .clear
        
        return myCell
    }
    
    
    //only one should be checked at a time
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myCell = tableView.cellForRow(at: indexPath)
        
        if !cellSelected {
            myCell?.accessoryType = .checkmark
            cellSelected = true
        }else{ //a UITableViewCell is already selected
            tableView.cellForRow(at: cellIndexForSelected)?.accessoryType = .none
            myCell?.accessoryType = .checkmark
        }
        cellIndexForSelected = indexPath
        delegate?.passResistenceType(text: (myCell?.textLabel?.text)!)
    }
}
