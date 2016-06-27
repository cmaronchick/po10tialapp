//
//  FirstViewController.swift
//  po10tialapp
//
//  Created by Chris Aronchick on 5/20/16.
//  Copyright © 2016 Chris Aronchick. All rights reserved.
//

import UIKit

var exercises = [String]()

class FirstViewController: UIViewController,UITableViewDelegate {
    
    var timer = NSTimer()
    
    @IBOutlet weak var exercisestable: UITableView!
    /*var exercisesObj = NSUserDefaults.standardUserDefaults().objectForKey("array")
    func getExercises() {
        if exercisesObj != nil {
     
    }*/
    
    
    //print(exercises)
    
    
    @IBOutlet weak var timerText: UILabel!
    
    var time = 0
    var repCount = 0
    var direction = "Up"
    
    func result() {
        if (direction == "Up") {
        time += 1
        } else {
            time -= 1
        }
        
        timerText.text = String(time)
        if (time == 0) {
            repCount += repCount
            time = 0
            direction = "Up"
        }
        
    }
    
    @IBOutlet weak var timerLabel: UIButton!
    @IBAction func startExercise(sender: AnyObject) {
    if timerLabel.currentTitle == "Start Exercise" {
        timerLabel.setTitle("Stop Exercise", forState: .Normal)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.result), userInfo: nil, repeats: true)
        
    } else {
        timerLabel.setTitle("Start Exercise", forState: .Normal)
        timer.invalidate()
        }
        //timerLabel.setTitle("Stop Exercise", forState: .Normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("exercises") != nil) {
        exercises = NSUserDefaults.standardUserDefaults().objectForKey("exercises") as! [String]
        }
    
        // 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(exercises)
        return exercises.count
    }
    /*func headerTableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let headerCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Header")
        headerCell.textLabel?.text = "Exercises" + String(exercises.count)
        
        
        return headerCell
    }*/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        //let timesTable = Int(slider.value * 20)
        cell.textLabel?.text = String(exercises[indexPath.row])
        
        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            exercises.removeAtIndex(indexPath.row);
        }
        NSUserDefaults.standardUserDefaults().setObject(exercises, forKey: "exercises")
        exercisestable.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        exercisestable.reloadData()
    }

    

}

