//
//  addAlarmViewController.swift
//  projectOne
//
//  Created by Ariel Riggan on 10/12/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import UIKit
import EventKit


class addAlarmViewController: UIViewController{
    
    @IBOutlet weak var pickTime: UIDatePicker!
    
    @IBOutlet weak var saturday: UIButton!
    @IBOutlet weak var friday: UIButton!
    @IBOutlet weak var thursday: UIButton!
    @IBOutlet weak var wednesday: UIButton!
    @IBOutlet weak var tuesday: UIButton!
    @IBOutlet weak var monday: UIButton!
    @IBOutlet weak var sunday: UIButton!
    
    @IBOutlet weak var alarmDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func makeAlarm(){
        var selectedTime=pickTime.date
        print (selectedTime)
        
        var matchingComponents = EKRecurrenceDayOfWeek()
        var arrayDays : [EKRecurrenceDayOfWeek] = []
        if sunday.backgroundColor==UIColor.gray {
            //repeat on Sundays
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 1)!)
            arrayDays.append(thisDay)
        }
        if saturday.backgroundColor==UIColor.gray {
            //repeat on Saturday
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 7)!)
            arrayDays.append(thisDay)
        }
        if monday.backgroundColor==UIColor.gray{
            //repeat on Monday
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 2)!)
            arrayDays.append(thisDay)
        }
        if tuesday.backgroundColor==UIColor.gray{
            //repeat on tuesday
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 3)!)
            arrayDays.append(thisDay)
        }
        if wednesday.backgroundColor==UIColor.gray {
            //repeat on wednesday
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 4)!)
            arrayDays.append(thisDay)
        }
        if thursday.backgroundColor==UIColor.gray {
            //repeat on thursday
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 5)!)
            arrayDays.append(thisDay)
        }
        if friday.backgroundColor==UIColor.gray{
            //repeat on fridays
            var thisDay = EKRecurrenceDayOfWeek(EKWeekday(rawValue: 6)!)
            arrayDays.append(thisDay)
        }
        //newReminder.title = "Remember"
        //let comingDay =  Calendar.current.nextDate(after: now,
                                                     // matching: matchingComponents,
                                                      //matchingPolicy:.nextTime)
        
        
        
    }
    
    @IBAction func flipSunday(_ sender: Any) {
        if (sunday.backgroundColor==UIColor.gray){
            sunday.backgroundColor=UIColor.white
        }
        else{
            sunday.backgroundColor=UIColor.gray
        }
    }
    
    @IBAction func flipMonday(_ sender: Any) {
        if (monday.backgroundColor==UIColor.gray){
            monday.backgroundColor=UIColor.white
        }
        else{
            monday.backgroundColor=UIColor.gray
        }
    }
    
    @IBAction func flipTuesday(_ sender: Any) {
        if (tuesday.backgroundColor==UIColor.gray){
            tuesday.backgroundColor=UIColor.white
        }
        else{
            tuesday.backgroundColor=UIColor.gray
        }
    }
    @IBAction func flipWednesday(_ sender: Any) {
        if (wednesday.backgroundColor==UIColor.gray){
            wednesday.backgroundColor=UIColor.white
        }
        else{
            wednesday.backgroundColor=UIColor.gray
        }
    }
    @IBAction func flipThursday(_ sender: Any) {
        if (thursday.backgroundColor==UIColor.gray){
            thursday.backgroundColor=UIColor.white
        }
        else{
            thursday.backgroundColor=UIColor.gray
        }
    }
    @IBAction func flipFriday(_ sender: Any) {
        if (friday.backgroundColor==UIColor.gray){
            friday.backgroundColor=UIColor.white
        }
        else{
            friday.backgroundColor=UIColor.gray
        }
    }
    @IBAction func flipSaturday(_ sender: Any) {
        if (saturday.backgroundColor==UIColor.gray){
            saturday.backgroundColor=UIColor.white
        }
        else{
            saturday.backgroundColor=UIColor.gray
        }
    }
    
    @IBAction func makeTheAlarm(_ sender: Any) {
        makeAlarm();
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
