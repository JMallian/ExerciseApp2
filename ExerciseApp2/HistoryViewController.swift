//
//  HistoryViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 12/4/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {
    var allTheWorkouts: WorkoutStore?
    var cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "History"
        tableView.tableFooterView = UIView()
        tableView.register(HistoryCell.self, forCellReuseIdentifier: cellID)
        tableView.backgroundColor = ColorsForApp.backroundColor
        tableView.separatorColor = ColorsForApp.componentBackgroundColor
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0) 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HistoryCell
        cell.backgroundColor = .clear
        let aWorkout = allTheWorkouts?.getWorkout(index: indexPath.row)
        let aDate = aWorkout?.returnDateCreated()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMM d, yyyy"
        if aDate != nil {
            cell.textLabel?.text = dateFormatter.string(from: aDate!)
        }
    
//        print(myDate)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE MMM d, yyyy"
//        print(dateFormatter.string(from: myDate))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allTheWorkouts != nil {
            return allTheWorkouts!.count()
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

class HistoryCell: UITableViewCell {
    
}
