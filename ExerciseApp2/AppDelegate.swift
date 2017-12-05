//
//  AppDelegate.swift
//  ExerciseApp2
//
//  Created by Mallian, Jessica L on 11/13/17.
//  Copyright © 2017 Mallian, Jessica L. All rights reserved.
//
//  ideally ths would display a scrollable calander, but babysteps 
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //add some exercises for testing purposes and whatnot
        let squat = Exercise(name: "squat", primaryMusclesUsed: ["quads", "hamstrings", "glutes"], resistenceType: "Barbell")
        let bench = Exercise(name: "bench", primaryMusclesUsed: ["pecs"], resistenceType: "Barbell")
        let deadlift = Exercise(name: "deadlift", primaryMusclesUsed: ["hamstrings", "glutes", "back"], resistenceType: "Barbell")
        let pushup = Exercise(name: "seated row", primaryMusclesUsed: ["lats", "midtraps", "rhomboids"], resistenceType: "Machine")
        let gluteBridge = Exercise(name: "pull-up machine", primaryMusclesUsed: ["lats", "midtraps", "rhomboids"], resistenceType: "Counterweight")
        let gluteBridgeBarbell = Exercise(name: "dumbbell split squat", primaryMusclesUsed: ["quads, glutes"], resistenceType: "Dumbbell")
        ExerciseStore.allExercises.append(squat)
        ExerciseStore.allExercises.append(bench)
        ExerciseStore.allExercises.append(deadlift)
        ExerciseStore.allExercises.append(pushup)
        ExerciseStore.allExercises.append(gluteBridge)
        ExerciseStore.allExercises.append(gluteBridgeBarbell)
        
        let set1 = ExerciseSet(name: "squat", resistenceType: "Barbell", weight: 90, reps: 3)
        let set2 = ExerciseSet(name: "lunge", resistenceType: "Dumbbell", weight: 20, reps: 10)
        let set3 = ExerciseSet(name: "squat", resistenceType: "Bodyweight", weight: 0, reps: 20)
        let set4 = ExerciseSet(name: "deadlift", resistenceType: "barbell", weight: 115, reps: 10)
        let set5 = ExerciseSet(name: "bench", resistenceType: "barbell", weight: 65, reps: 5)
        
        //let workout1 = Workout(exerciseSet: [set1, set2, set3, set4, set5])
        let date = Date(timeIntervalSinceReferenceDate: 529999999.0)
        let workout2 = Workout(exerciseSet: [set1, set1, set1, set2, set2, set2, set2, set2], date: date)
        let date2 = Date(timeIntervalSinceReferenceDate: 531005459.0)
        let workout3 = Workout(exerciseSet: [set5, set5, set5, set5, set5, set4, set4, set4, set3, set3, set3, set3, set3], date: date2)
        let date3 = Date(timeIntervalSinceReferenceDate: 532005459.0)
        let workout4 = Workout(exerciseSet: [set3, set3, set3, set3, set4, set4, set4, set4, set5, set5, set5, set5, set2, set2, set1, set1], date: date3)

        let allTheWorkouts = WorkoutStore()
        allTheWorkouts.addWorkout(workout: workout2)
        allTheWorkouts.addWorkout(workout: workout3)
        allTheWorkouts.addWorkout(workout: workout4)
        //allTheWorkouts.addWorkout(workout: workout1)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = ColorsForApp.backroundColor
        let rootViewController = ViewController()
        rootViewController.allTheWorkouts = allTheWorkouts
        let appNavController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = appNavController

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

