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
    
    // at this point I'm not sure why I felt I needed a header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = ColorsForApp.backroundColor
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! WorkoutCell
        //let exercise = exercises?[indexPath.row]
        let exerciseSet = ongoingWorkout?.getSets()[indexPath.row]
        if let nameUnwrapped = exerciseSet?.getName() {
            cell.setName(name: nameUnwrapped)
        }
        if let resistenceUnwrapped = exerciseSet?.getResistenceType() {
            cell.setResistence(resistence: resistenceUnwrapped)
        }
        if let weightUnwrapped = exerciseSet?.getWeight(), let repsUnwrapped = exerciseSet?.getReps() {
            cell.setSet(set: "\(weightUnwrapped) X \(repsUnwrapped)")
        }
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
    
    private var nameDisplay: UILabel
    private var resistenceDisplay: UILabel
    private var setDisplay: UILabel

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        nameDisplay = UILabel()
        resistenceDisplay = UILabel()
        setDisplay = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        nameDisplay.textColor = ColorsForApp.textColor
        nameDisplay.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameDisplay)
        nameDisplay.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        nameDisplay.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        nameDisplay.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameDisplay.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        resistenceDisplay.textColor = ColorsForApp.textColor
        resistenceDisplay.textAlignment = NSTextAlignment.right
        resistenceDisplay.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resistenceDisplay)
        resistenceDisplay.leftAnchor.constraint(equalTo: nameDisplay.rightAnchor, constant: 8).isActive = true
        resistenceDisplay.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        resistenceDisplay.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        resistenceDisplay.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        setDisplay.textColor = ColorsForApp.textColor
        setDisplay.translatesAutoresizingMaskIntoConstraints = false
        addSubview(setDisplay)
        setDisplay.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        setDisplay.topAnchor.constraint(equalTo: nameDisplay.bottomAnchor, constant: 0).isActive = true
        setDisplay.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        setDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ideally the name (ex squat) would be a section and not be listed in every cell, but, baby steps
    func setName(name: String) {
        nameDisplay.text = name
    }
    
    func setResistence(resistence: String) {
        resistenceDisplay.text = resistence
    }
    
    func setSet(set: String) {
        setDisplay.text = set
    }
    
}
