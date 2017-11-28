//
//  plant.swift
//  projectOne
//
//  Created by Ariel Riggan on 10/17/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class plant{
    var name = "Planty"
    var notes = "No notes"
    
    public var plantName: String{
        return name
    }
    public var plantNotes: String{
        return notes}
    
    var myRepeatRule=EKRecurrenceRule(recurrenceWith: .weekly, interval: 1, daysOfTheWeek: [EKRecurrenceDayOfWeek(EKWeekday(rawValue: 1)!)], daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil)
    var reminderNum = 1
    var plantImage: UIImage {
        return UIImage(named: "genericPlant")!}
    
//    func setPlantName(plantNameIs: String) {
//        var plantName: String{
//            return plantNameIs
//        }
//    }
}
