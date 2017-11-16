//
//  addExerciseViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class addExerciseViewController: UIViewController {
    
    let goBackButton: UIButton
    let addMuscleGroupButton: UIButton
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        goBackButton = UIButton()
        addMuscleGroupButton = UIButton()

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        

        
        let screenSize: CGSize = UIScreen.main.bounds.size
        //let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        goBackButton.frame = CGRect(x: 0, y: centerY + 125, width: screenSize.width, height: 50)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.backgroundColor = UIColor.cyan
        goBackButton.setTitleColor(UIColor.black, for: .normal)
        goBackButton.addTarget(self, action: #selector(addExerciseViewController.goBackPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(goBackButton)
        
        addMuscleGroupButton.frame = CGRect(x: 0, y: centerY + 25, width: screenSize.width, height: 50)
        addMuscleGroupButton.setTitle("Add Muscles Used", for: .normal)
        addMuscleGroupButton.backgroundColor = UIColor.cyan
        addMuscleGroupButton.setTitleColor(UIColor.black, for: .normal)
        addMuscleGroupButton.addTarget(self, action: #selector(addExerciseViewController.addMuscleGroupPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(addMuscleGroupButton)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func goBackPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addMuscleGroupPressed() {
        //self.present(musclesTableView(), animated: true, completion: nil)
        self.navigationController?.pushViewController(musclesTableView(), animated: true)
    }
}
