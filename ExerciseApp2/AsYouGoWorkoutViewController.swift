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
    var rowsOfExerciseAndSets = [[String]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Workout"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Exercise", style: .plain, target: self, action: #selector(AsYouGoWorkoutViewController.addExerciseButtonPressed))
        tableView.tableFooterView = UIView()
        tableView.register(WorkoutCell.self, forCellReuseIdentifier: cellID)
        tableView.backgroundColor = ColorsForApp.backroundColor
        tableView.separatorColor = ColorsForApp.componentBackgroundColor
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0) //makes seperator extend all the way to the sides
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
//        print("reloading data")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! WorkoutCell

        cell.setName(name: rowsOfExerciseAndSets[indexPath.section][indexPath.row])
        if indexPath.row == 0 {
            cell.backgroundColor = ColorsForApp.componentBackgroundColor
        }else{
            cell.backgroundColor = .clear //this is necessary because cells are reused and may have had their background color changed
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsOfExerciseAndSets[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return rowsOfExerciseAndSets.count
    }
    
    
    @objc func addExerciseButtonPressed() {
        //goes to a tableView of exercies
        let nextViewController = ExerciseListViewController(style: .plain)
        nextViewController.whereICameFrom = self //this didn't seem like the right way to link them for info passing but the internet assured me it was
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //do stuff with data from RepsController
    func passDataBack(data: [ExerciseSet]) { //this should probably be called receiveData or something
        ongoingWorkout?.addArrayOfSets(arrayOfSets: data)
        // ["squat", ["90 X 5"], ["90 X 5"], ["90 X 5"],
        // ["deadlift", ["140 X 1"], ["140 X 1"] etc.
        // data is an array of ExerciseSets
        var arrayToAdd = [String]()
        arrayToAdd.append(data[0].getName()) //each row is an array where first element is the name, other elements are the sets
        var justTheNumbers: String
        for item in data {
            justTheNumbers = "\(item.getWeight()) X \(item.getReps())"
            arrayToAdd.append(justTheNumbers)
        }
        rowsOfExerciseAndSets.append(arrayToAdd)
        
        for row in rowsOfExerciseAndSets {
            print("in a row: ")
            for item in row {
                print(item)
            }
        }
    }
}

class WorkoutCell: UITableViewCell {
    
    private var nameDisplay: UILabel
    private var resistenceDisplay: UILabel
    private var setDisplay: UILabel

    
    //layout needs to be updated since I changed info shown
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
    
    // ideally the name (ex squat) would be a section and not be listed in every cell, but that turned out to be difficult
    // the way I was implementing it
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
