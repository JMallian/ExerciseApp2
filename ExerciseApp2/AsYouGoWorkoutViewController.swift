//
//  AsYouGoWorkoutViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/17/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

// need custom header, footer, and tableViewCells
class AsYouGoWorkoutViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Workout"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Exercise", style: .plain, target: self, action: #selector(AsYouGoWorkoutViewController.addExerciseButtonPressed))
        //tableView.register(WorkoutCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .red
        return header
    }
    
    //is this needed? 
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    @objc func addExerciseButtonPressed() {
        //goes to a tableView of exercies
        let nextViewController = ExerciseListViewController(style: .plain)
        //nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
