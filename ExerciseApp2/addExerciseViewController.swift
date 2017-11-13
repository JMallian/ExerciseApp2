//
//  addExerciseViewController.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

class addExerciseViewController: UIViewController {
    let muscleTextfield: UITextField
    let goBackButton: UIButton
    let muscles: ExerciseGroup
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        goBackButton = UIButton()
        muscleTextfield = UITextField()
        muscles = ExerciseGroup()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //component placement
        let screenSize: CGSize = UIScreen.main.bounds.size
        //let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        goBackButton.frame = CGRect(x: 0, y: centerY + 125, width: screenSize.width, height: 50)
        muscleTextfield.frame = CGRect(x: 0, y: centerY + 25, width: screenSize.width, height: 50)
        
        //button titles
        goBackButton.setTitle("Go Back", for: .normal)
        muscleTextfield.placeholder = "Pick Muscle Groups"
        
        //button colors
        goBackButton.backgroundColor = UIColor.cyan
        muscleTextfield.textColor = UIColor.black
        muscleTextfield.backgroundColor = UIColor.cyan
        muscleTextfield.textAlignment = NSTextAlignment.center

        goBackButton.setTitleColor(UIColor.black, for: .normal)
        
        //button functions
        goBackButton.addTarget(self, action: #selector(addExerciseViewController.goBackPressed), for: UIControlEvents.touchUpInside)
        muscleTextfield.delegate = self as? UITextFieldDelegate
        
        self.view.addSubview(muscleTextfield)
        self.view.addSubview(goBackButton)

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
    
    
}
