//
//  ExerciseListViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/22/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class ExerciseListViewController: UITableViewController {
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Exercises"
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
        //tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        //tableView.separatorColor = UIColor(white: 1, alpha: 0.2)
        tableView.backgroundColor = ColorsForApp.backroundColor
        tableView.separatorColor = ColorsForApp.componentBackgroundColor

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //go on down to the next viewController
        print("click on exercise")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ExerciseCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
