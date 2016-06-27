//
//  SecondViewController.swift
//  po10tialapp
//
//  Created by Chris Aronchick on 5/20/16.
//  Copyright © 2016 Chris Aronchick. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var exerciseName: UITextField!
    @IBAction func addExercise(sender: AnyObject) {
        exercises.append(exerciseName.text!)
        
        exerciseName.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(exercises, forKey: "exercises")
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
    exerciseName.resignFirstResponder()
    return true
    }


}

