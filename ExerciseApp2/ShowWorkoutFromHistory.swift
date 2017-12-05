//
//  ShowWorkoutFromHistory.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 12/4/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//
// this class taught me that I should have created a Workout as having an array of sets when what is has is an array of reps
// a rep is like squat: 5 reps at 90 lbs, a set would be all the squats you did in a workout
// it also taught me that ShowWorkoutFromHistory and AsYouGoWorkoutViewController are very similiar but not designed
// with enough foresight that one could easily inherit from another, or both inherit from a superclass

import UIKit

class ShowWorkoutFromHistory: UITableViewController {
    var workoutToDisplay: Workout?
    var cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        let aDate = workoutToDisplay?.returnDateCreated()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMM d, yyyy"
        if aDate != nil {
            navigationItem.title = dateFormatter.string(from: aDate!)
        }
        tableView.tableFooterView = UIView()
        tableView.register(HistoryWorkoutCell.self, forCellReuseIdentifier: cellID)
        tableView.backgroundColor = ColorsForApp.backroundColor
        tableView.separatorColor = ColorsForApp.componentBackgroundColor
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0) //makes seperator extend all the way to the sides
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HistoryWorkoutCell
        let name = workoutToDisplay?.getSets()[indexPath.row].getName() ?? "optional fail name"
        cell.setName(name: name)
        let resistence = workoutToDisplay?.getSets()[indexPath.row].getResistenceType() ?? "optional fail resistence"
        cell.setResistence(resistence: resistence)
        let weight = workoutToDisplay?.getSets()[indexPath.row].getWeight() ?? 1000
        let reps = workoutToDisplay?.getSets()[indexPath.row].getReps() ?? 9000
        let set = "\(weight)X\(reps)"
        cell.setSet(set: set)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = ColorsForApp.componentBackgroundColor
        }else{
            cell.backgroundColor = .clear //the else is necessary if reusing cells
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if workoutToDisplay?.getSets() != nil { //I KNOW it exists and yet I don't like using !
            return (workoutToDisplay?.getSets().count)!
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


class HistoryWorkoutCell: UITableViewCell {
    
    private var nameDisplay: UILabel
    private var resistenceDisplay: UILabel
    private var setDisplay: UILabel
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        nameDisplay = UILabel()
        resistenceDisplay = UILabel()
        setDisplay = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameDisplay.textColor = ColorsForApp.textColor
        nameDisplay.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameDisplay)
        nameDisplay.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        nameDisplay.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        nameDisplay.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        resistenceDisplay.textColor = ColorsForApp.textColor
        resistenceDisplay.textAlignment = NSTextAlignment.right
        resistenceDisplay.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resistenceDisplay)
        resistenceDisplay.leftAnchor.constraint(equalTo: nameDisplay.rightAnchor, constant: 8).isActive = true
        resistenceDisplay.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        resistenceDisplay.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        resistenceDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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


