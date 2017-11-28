//
//  ViewController.swift
//  projectOne
//
//  Created by Ariel Riggan on 10/12/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import UIKit
import EventKit
//import SQLite

class ViewController: UIViewController {
    var x=0
    var y=10
    var isCustom = false
    
    //var newPlant = plant()
    
    let myStore = EKEventStore()
    var thisPlant = plant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //functions
    @IBAction func unwindAddSegue(_ segue:UIStoryboardSegue){
        //Pass data from addCellData into the main page
        
    }
    @IBAction func unselectSeg(_ sender: Any) {
        isCustom = true
    }
//    override func viewWillAppear(animated: Bool) {
//        checkCalendarAuthorizationStatus()
//    }
    
//    func checkCalendarAuthorizationStatus() {
//        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
//        
//        switch (status) {
//        case EKAuthorizationStatus.notDetermined:
//            // This happens on first-run
//            requestAccessToCalendar()
//        case EKAuthorizationStatus.authorized:
//            // Things are in line with being able to show the calendars in the table view
//            loadCalendars()
//        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
//            // We need to help them give us permission
//            needPermissionView.fadeIn()
//        }
//    }
//    func requestAccessToCalendar() {
//        myStore.requestAccess(to: EKEntityType.event, completion: {
//            (accessGranted: Bool, error: Error?) in
//            
//            if accessGranted == true {
//                DispatchQueue.main.async(execute: {
//                    self.loadCalendars()
//                })
//            } else {
//                DispatchQueue.main.async(execute: {
//                    self.needPermissionView.fadeIn()
//                })
//            }
//        })
//    }
//    func loadCalendars() {
//        self.calendars = eventStore.calendars(for: EKEntityType.event)
//    }
    @IBAction func addPlant(_ sender: Any) {
        constructAlarm()
    }
    func constructAlarm(){
        scrollView.layer.zPosition=0;
        segControl.layer.zPosition=1;
        addButton.layer.zPosition=1;
        
        if (segControl.selectedSegmentIndex==0 && isCustom == false){
            thisPlant = rose()
            
        }
        else if(segControl.selectedSegmentIndex==1 && isCustom == false){
            thisPlant = tulip()
            
        }
        else if(segControl.selectedSegmentIndex==2 && isCustom == false){
            thisPlant = cactus()
        }
        else{
            //plant is custom
        }
        var myCalendar = myStore.defaultCalendarForNewReminders()
        var newReminder=EKReminder(eventStore: myStore)
        newReminder.notes="Do this then that"
        let myAlarm=EKAlarm(relativeOffset: 0)
        newReminder.addAlarm(myAlarm)
        
        var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 1)!)
        var myRepeatRule=EKRecurrenceRule(recurrenceWith: .weekly, interval: 1, daysOfTheWeek: [thisDay], daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil)
        newReminder.addRecurrenceRule(myRepeatRule)
        
        
        
        let newCellImage = UIImageView()
        newCellImage.image=thisPlant.plantImage
        
        newCellImage.frame=CGRect(x:x,y:y,width:100, height:100)
        mainView.addSubview(newCellImage)
        
        let titleLabel = UILabel()
        titleLabel.text=thisPlant.plantName
        titleLabel.frame=CGRect(x:x , y:y, width:100, height: 30)
        titleLabel.backgroundColor=UIColor(red:1 ,green:1,blue:1,alpha: 0.8)
        titleLabel.backgroundColor?.withAlphaComponent(0.3)
        mainView.addSubview(titleLabel)
        
        x=x+120
        
        
        var newNotes=UITextView()
        newNotes.frame=CGRect(x:x,y:y,width:150, height:150)
        newNotes.text=thisPlant.plantNotes
        mainView.addSubview(newNotes)
        
//        var newlabelcount=UILabel()
//        newlabelcount.frame=CGRect(x:x,y:y,width:10, height:10)
//        newlabelcount.text="Reminder number: "
//        newlabelcount.text= newlabecount.text+String(thisPlant.reminderNum)
        
        self.scrollView.contentSize=CGSize(width: self.mainView.frame.width, height: (self.mainView.frame.height+200))
        print("content size is")
        print (self.scrollView.contentSize)
        
        y=y+160
        x=0
        
    
    }
    
    //New class for each cell's data
//    func openDatabase() -> OpaquePointer{
//      var database:OpaquePointer? = nil
//        if sqlite3_open(cellData,&database)==SQLITE_OK{
//            print("Successfully opened connection to database at \(cellData)")
//            return database!
//        }
//        else{
//            print("Unable to open database. Verify that you created the directory described")
//        }
//    }
//    let result = sqlite3_open("alarmingData.sql", &database)
//    let createSQL = "CREATE TABLE IF NOT EXISTS PLANTENTRIES" + "(ID INTEGER PRIMARY KEY AUTOINCREMENT, FIELD_NAME TEXT, FIELD_NOTES TEXT, FIELD_ALARMS UIEVENT)"
//    
}

