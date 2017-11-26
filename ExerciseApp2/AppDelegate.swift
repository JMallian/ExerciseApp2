//
//  AppDelegate.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = ColorsForApp.backroundColor
        let appNavController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = appNavController
        //window?.rootViewController = ViewController(nibName: nil, bundle: nil)
        
        //add some exercises for testing purposes and whatnot
        let squat = Exercise(name: "squat", primaryMusclesUsed: ["quads", "hamstrings", "glutes"], resistenceType: "Barbell")
        let bench = Exercise(name: "bench", primaryMusclesUsed: ["pecs"], resistenceType: "Barbell")
        let deadlift = Exercise(name: "Deadlift", primaryMusclesUsed: ["hamstrings", "glutes", "back"], resistenceType: "Barbell")
        let pushup = Exercise(name: "Pushup", primaryMusclesUsed: ["pecs", "biceps"], resistenceType: "bodyweight")
        let gluteBridge = Exercise(name: "Glute Bridge", primaryMusclesUsed: ["glutes"], resistenceType: "bodyweight")
        let gluteBridgeBarbell = Exercise(name: "Barbell Glute Bridge", primaryMusclesUsed: ["glutes"], resistenceType: "Barbell")
        ExerciseStore.allExercises.append(squat)
        ExerciseStore.allExercises.append(bench)
        ExerciseStore.allExercises.append(deadlift)
        ExerciseStore.allExercises.append(pushup)
        ExerciseStore.allExercises.append(gluteBridge)
        ExerciseStore.allExercises.append(gluteBridgeBarbell)
        
        let set1 = ExerciseSet(name: "squat", resistenceType: "Barbell", weight: 90, reps: 3)
        let set2 = ExerciseSet(name: "squat", resistenceType: "Barbell", weight: 90, reps: 3)
        let set3 = ExerciseSet(name: "squat", resistenceType: "Barbell", weight: 90, reps: 3)
        
        let set4 = ExerciseSet(name: "deadlift", resistenceType: "barbell", weight: 115, reps: 10)
        let set5 = ExerciseSet(name: "deadlift", resistenceType: "barbell", weight: 115, reps: 10)
        
        let workout1 = Workout(exerciseSet: [set1, set2, set3, set4, set5])
        WorkoutStore.allWorkouts.append(workout1)
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

