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

class repsController: UITableViewController {
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrapped = exercise?.name {
            navigationItem.title = unwrapped
        }

        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tableView.separatorColor = UIColor(white: 1, alpha: 0.2)

    }
}
