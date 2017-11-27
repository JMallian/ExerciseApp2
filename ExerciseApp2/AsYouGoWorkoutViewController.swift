//
//  AsYouGoWorkoutViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/17/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

// need custom header, footer, and tableViewCells
class AsYouGoWorkoutViewController: UITableViewController, repsControllerDelegate {
    
    var ongoingWorkout: Workout?
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Workout"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Exercise", style: .plain, target: self, action: #selector(AsYouGoWorkoutViewController.addExerciseButtonPressed))
        //tableView.register(WorkoutCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
        tableView.register(WorkoutCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .red
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! WorkoutCell
        //let exercise = exercises?[indexPath.row]
        //cell.exercise = exercise
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = ongoingWorkout?.getSets().count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    @objc func addExerciseButtonPressed() {
        //goes to a tableView of exercies
        let nextViewController = ExerciseListViewController(style: .plain)
        nextViewController.whereICameFrom = self //doesn't seem right, but not sure how else to link them
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //do stuff with data from RepsController
    func passDataBack(data: [ExerciseSet]) {
        ongoingWorkout?.addArrayOfSets(arrayOfSets: data)
        print("added to workout")
    }

}

class WorkoutCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //backgroundColor = .clear
        backgroundColor = .purple
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
